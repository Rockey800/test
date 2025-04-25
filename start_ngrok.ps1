
param (
    [string]$ngrokAuthToken
)

# Define default path
$ngrokDir = "$env:ProgramData\ngrok"
$ngrokExe = "$ngrokDir\ngrok.exe"

# Download ngrok manually if not found
if (-Not (Test-Path $ngrokExe)) {
    Write-Host "🔍 ngrok.exe not found, downloading..."

    # Create folder
    New-Item -Path $ngrokDir -ItemType Directory -Force | Out-Null

    # Download zip
    $ngrokZip = "$ngrokDir\ngrok.zip"
    Invoke-WebRequest -Uri "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip" -OutFile $ngrokZip

    # Extract
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($ngrokZip, $ngrokDir)

    # Clean up zip
    Remove-Item $ngrokZip
}

# Authenticate
Write-Host "🔐 Authenticating ngrok..."
& $ngrokExe config add-authtoken $ngrokAuthToken

# Start tunnel
Write-Host "🚀 Starting ngrok TCP tunnel for RDP..."
Start-Process -FilePath $ngrokExe -ArgumentList "tcp 3389" -WindowStyle Hidden

# Wait for ngrok to boot
Start-Sleep -Seconds 5

# Try to show public URL
try {
    $apiUrl = "http://127.0.0.1:4040/api/tunnels"
    $response = Invoke-RestMethod -Uri $apiUrl -UseBasicParsing
    $tcpTunnel = $response.tunnels | Where-Object { $_.proto -eq "tcp" }

    if ($tcpTunnel) {
        Write-Host "`n🌐 ngrok Public URL (RDP): $($tcpTunnel.public_url)`n"
    } else {
        Write-Warning "⚠️ Tunnel started but no public URL found yet."
    }
} catch {
    Write-Warning "⚠️ Could not connect to ngrok API. It may still be starting."
}
