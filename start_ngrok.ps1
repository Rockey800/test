param (
    [string]$ngrokAuthToken
)

# Define the path to the ngrok executable (update this if needed)
$ngrokExePath = "D:\path\to\ngrok.exe"  # Change this to the correct path where ngrok.exe is located

# Check if ngrok.exe exists at the specified path
if (-Not (Test-Path $ngrokExePath)) {
    Write-Error "ngrok.exe not found at the specified path: $ngrokExePath"
    exit 1
}

Write-Output "Setting Ngrok Auth Token..."
# Set the Ngrok authentication token
& $ngrokExePath authtoken $ngrokAuthToken

Write-Output "Starting Ngrok TCP tunnel for RDP on port 3389..."
# Start the Ngrok TCP tunnel for RDP on port 3389
$ngrokProcess = Start-Process -FilePath $ngrokExePath -ArgumentList "tcp 3389" -NoNewWindow -PassThru

Write-Output "Waiting for Ngrok to initialize..."

# Wait for Ngrok tunnel to become available
$maxWaitTime = 30  # Max wait time in seconds
$waitTime = 0

# Loop to check if the Ngrok tunnel is ready
while ($waitTime -lt $maxWaitTime) {
    try {
        # Fetch Ngrok tunnel information
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
