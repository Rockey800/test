Write-Output "Checking for Ngrok executable..."

# Define download URLs
$ngrokDownloadUrl = "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip"
$ngrokZipFile = "ngrok.zip"
$ngrokExecutable = ".\ngrok.exe"

# Download Ngrok
Write-Output "Downloading Ngrok..."
Invoke-WebRequest -Uri $ngrokDownloadUrl -OutFile $ngrokZipFile -ErrorAction Stop

# Extract the Ngrok archive
Write-Output "Extracting Ngrok..."
Expand-Archive -Path $ngrokZipFile -DestinationPath .\ -Force

# Ensure the Ngrok executable exists
if (-Not (Test-Path $ngrokExecutable)) {
    Write-Error "Ngrok download or extraction failed. Exiting..."
    exit 1
}
Write-Output "Ngrok downloaded successfully."
