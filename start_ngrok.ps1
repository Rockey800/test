param (
    [string]$ngrokAuthToken
)

Write-Output "Setting Ngrok Auth Token..."
.\ngrok.exe authtoken $ngrokAuthToken

Write-Output "Starting Ngrok TCP tunnel for RDP on port 3389..."
$ngrokProcess = Start-Process -FilePath ".\ngrok.exe" -ArgumentList "tcp 3389" -NoNewWindow -PassThru

Write-Output "Waiting for Ngrok to initialize..."

# Wait for Ngrok to initialize and tunnel to be available
$maxWaitTime = 30  # Max wait time in seconds
$waitTime = 0

# Loop to check if Ngrok tunnel is ready
while ($waitTime -lt $maxWaitTime) {
    try {
        $tunnelInfo = Invoke-WebRequest -Uri "http://127.0.0.1:4040/api/tunnels" -UseBasicParsing | ConvertFrom-Json
        if ($tunnelInfo.tunnels.Count -gt 0) {
            $tunnelUrl = $tunnelInfo.tunnels[0].public_url
            Write-Output "Ngrok tunnel established successfully."
            Write-Output "RDP URL: $tunnelUrl"
            break
        }
    } catch {
        Write-Output "Ngrok not yet initialized. Retrying..."
    }
    
    Start-Sleep -Seconds 2
    $waitTime += 2
}

# If Ngrok tunnel is not established within maxWaitTime
if ($waitTime -ge $maxWaitTime) {
    Write-Error "Ngrok tunnel could not be established. Exiting..."
    exit 1
}

# Optionally, monitor the Ngrok process and wait for it to exit
$ngrokProcess.WaitForExit()
