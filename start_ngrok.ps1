# ngrok setup for RDP

$ngrokPath = "C:\ngrok\ngrok.exe"  # Adjust path if necessary
$ngrokAuthToken = $args[0]  # Pass in the auth token as an argument

# Check if ngrok is installed
if (-Not (Test-Path $ngrokPath)) {
    Write-Error "ngrok.exe not found at $ngrokPath"
    exit 1
}

# Authenticate ngrok
Write-Output "Authenticating with ngrok..."
& $ngrokPath authtoken $ngrokAuthToken

# Start ngrok TCP tunnel for RDP
Write-Output "Starting ngrok TCP tunnel for RDP..."
$ngrokProcess = Start-Process -FilePath $ngrokPath -ArgumentList "tcp", "3389" -PassThru

# Wait for the tunnel to initialize
$ngrokProcess.WaitForExit()

# Display public URL for RDP
Write-Output "Ngrok tunnel started. You can connect using the following URL:"
& $ngrokPath tcp 3389
