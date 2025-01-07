# Define the path to the Ngrok executable
$ngrokPath = "D:\a\rdp16\rdp16\ngrok\ngrok.exe"

# Verify if ngrok.exe exists
if (Test-Path -Path $ngrokPath) {
    Write-Output "Starting Ngrok with the provided authentication token..."
    # Start Ngrok with the provided authentication token and other arguments (e.g., "http", "3389")
    Start-Process -FilePath $ngrokPath -ArgumentList "authtoken", $args[0]
} else {
    Write-Error "Ngrok executable not found at $ngrokPath."
    exit 1
}
