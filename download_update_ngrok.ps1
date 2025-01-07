# Define the Ngrok download URL and the destination folder path
$ngrokDownloadUrl = "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip"
$ngrokFolderPath = "D:\a\rdp16\rdp16\ngrok"

# Create the folder if it does not exist
if (-Not (Test-Path -Path $ngrokFolderPath)) {
    New-Item -Path $ngrokFolderPath -ItemType Directory
}

# Define the path to save the downloaded zip file
$ngrokZipPath = "$ngrokFolderPath\ngrok.zip"

# Download the Ngrok zip file
Write-Output "Downloading Ngrok from $ngrokDownloadUrl..."
Invoke-WebRequest -Uri $ngrokDownloadUrl -OutFile $ngrokZipPath

# Extract the Ngrok zip file
Write-Output "Extracting Ngrok to $ngrokFolderPath..."
Expand-Archive -Path $ngrokZipPath -DestinationPath $ngrokFolderPath

# Check if ngrok.exe was extracted successfully
if (-Not (Test-Path -Path "$ngrokFolderPath\ngrok.exe")) {
    Write-Error "Ngrok executable not found at $ngrokFolderPath\ngrok.exe"
    exit 1
} else {
    Write-Output "Ngrok has been downloaded and extracted successfully."
}
