param (
    [string]$ngrokAuthToken
)

# Try known locations
$possiblePaths = @(
    "$env:ProgramData\chocolatey\lib\ngrok\tools\ngrok.exe",
    "$env:USERPROFILE\scoop\apps\ngrok\current\ngrok.exe",  # in case scoop was used
    "C:\ngrok\ngrok.exe",
    "ngrok.exe"  # fallback if in PATH
)

$ngrokPath = $null
foreach ($path in $possiblePaths) {
    if (Test-Path $path) {
        $ngrokPath = $path
        break
    }
}

if (-not $ngrokPath) {
    Write-Error "❌ ngrok.exe not found in known locations."
    exit 1
}

# Authenticate ngrok
Write-Host "🔐 Authenticating ngrok..."
& $ngrokPath config add-authtoken $ngrokAuthToken

# Start ngrok tunnel for RDP (port 3389)
Write-Host "🚀 Starting ngrok TCP tunnel on port 3389..."
Start-Process -FilePath $ngrokPath -ArgumentList "tcp 3389" -WindowStyle Hidden

# Wait a bit for ngrok to initialize
Start-Sleep -Seconds 5

# Optional: Show tunnel public URL (requires curl or Invoke-RestMethod)
try {
    $apiUrl = "http://127.0.0.1:4040/api/tunnels"
    $response = Invoke-RestMethod -Uri $apiUrl -UseBasicParsing
    $tcpTunnel = $response.tunnels | Where-Object { $_.proto -eq "tcp" }

    if ($tcpTunnel) {
        Write-Host "`n🌐 ngrok Public URL (use in RDP): $($tcpTunnel.public_url)`n"
    } else {
        Write-Warning "⚠️ Could not retrieve public URL. Check ngrok dashboard or ensure tunnel started properly."
    }
} catch {
    Write-Warning "⚠️ Could not connect to ngrok API (127.0.0.1:4040). Tunnel might still be starting."
}
