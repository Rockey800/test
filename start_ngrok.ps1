param (
    [string]$ngrokAuthToken = ""
)

# Define Ngrok Paths
$ngrokPath = "D:\a\rdp16\rdp16\ngrok.exe"

# Check Ngrok Installation
if (-Not (Test-Path $ngrokPath)) {
    Write-Error "Ngrok executable not found at $ngrokPath."
    exit 1
}

# Set Auth Token
Write-Output "Setting Ngrok Auth Token..."
& $ngrokPath authtoken $ngrokAuthToken
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to set Ngrok auth token."
    exit 1
}

# Start Ngrok Tunnel
Write-Output "Starting Ngrok TCP tunnel for RDP on port 3389..."
& $ngrokPath tcp 3389 --log=stdout > ngrok.log 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Error "Failed to start Ngrok tunnel. Check logs for details."
    Get-Content ngrok.log -Tail 20
    exit 1
}

# Wait for Tunnel Initialization
Start-Sleep -Seconds 5

# Fetch Tunnel URL
Write-Output "Fetching Ngrok Tunnel URL..."
try {
    $NgrokTunnelInfo = Get-Content ngrok.log | Select-String -Pattern "tcp://.*:3389"
    if (-Not $NgrokTunnelInfo) {
        throw "Failed to fetch Ngrok tunnel URL. Ensure Ngrok is running correctly."
    }
    $TunnelUrl = ($NgrokTunnelInfo -match "tcp://.*:3389").Value
    Write-Output "Ngrok Tunnel URL: $TunnelUrl"
} catch {
    Write-Error "An error occurred: $_"
    exit 1
}
