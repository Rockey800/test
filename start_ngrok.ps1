param (
    [string]$ngrokAuthToken
)

# Set the correct ngrok.exe path (installed via Chocolatey)
$ngrokPath = "C:\ProgramData\chocolatey\lib\ngrok\tools\ngrok.exe"

# Check if ngrok exists
if (-Not (Test-Path $ngrokPath)) {
    Write-Error "❌ ngrok.exe not found at: $ngrokPath"
    exit 1
}

# Authenticate ngrok
Write-Host "🔐 Adding ngrok auth token..."
& $ngrokPath config add-authtoken $ngrokAuthToken

# Start RDP tunnel
Write-Host "🚀 Starting ngrok tunnel on port 3389..."
Start-Process -NoNewWindow -FilePath $ngrokPath -ArgumentList "tcp 3389"

Write-Host "✅ ngrok tunnel started. Use the public address from ngrok's web dashboard."
