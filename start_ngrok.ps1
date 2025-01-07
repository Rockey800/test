param (
    [string]$ngrokAuthToken
)

Write-Output "Setting Ngrok Auth Token..."
.\ngrok.exe authtoken $ngrokAuthToken

Write-Output "Starting Ngrok TCP tunnel for RDP on port 3389..."
Start-Process -FilePath ".\ngrok.exe" -ArgumentList "tcp 3389" -NoNewWindow -PassThru

Write-Output "Waiting for Ngrok to initialize..."
Start-Sleep -Seconds 5

# Fetch Ngrok tunnel URL
try {
    $tunnelInfo = Invoke-WebRequest -Uri "http://127.0.0.1:4040/api/tunnels" -UseBasicParsing | ConvertFrom-Json
    $tunnelUrl = $tunnelInfo.tunnels[0].public_url
    Write-Output "Ngrok tunnel established successfully."
    Write-Output "RDP URL: $tunnelUrl"
} catch {
    Write-Error "Failed to fetch Ngrok tunnel URL. Ensure Ngrok is running correctly."
    exit 1
}
