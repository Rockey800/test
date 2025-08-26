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

# Start ngrok process in background
Write-Host "🚀 Starting ngrok TCP tunnel for RDP..."
Start-Process -FilePath $ngrokExe -ArgumentList "tcp 3389" -NoNewWindow

# Wait & retry until tunnel appears
$apiUrl = "http://127.0.0.1:4040/api/tunnels"
$tunnelUrl = $null

for ($i=0; $i -lt 12; $i++) {   # retry up to 12 times (~60 seconds)
    try {
        $response = Invoke-RestMethod -Uri $apiUrl -UseBasicParsing -TimeoutSec 5
        $tcpTunnel = $response.tunnels | Where-Object { $_.proto -eq "tcp" }
        if ($tcpTunnel) {
            $tunnelUrl = $tcpTunnel.public_url
            break
        }
    } catch {
        # ignore errors and retry
    }
    Start-Sleep -Seconds 5
}

if ($tunnelUrl) {
    Write-Host "`n🌐 ngrok Public URL (RDP): $tunnelUrl`n"
} else {
    Write-Warning "❌ ngrok did not start or no tunnel was created."
}
