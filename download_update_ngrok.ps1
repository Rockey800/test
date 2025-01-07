# Ensure that Ngrok is downloaded and installed in the correct folder
$ngrokDownloadUrl = "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip"
$ngrokFolderPath = "D:\a\rdp16\rdp16\ngrok"

# Create the folder if it doesn't exist
if (-Not (Test-Path -Path $ngrokFolderPath)) {
    New-Item -Path $ngrokFolderPath -ItemType Directory
}

# Download Ngrok
Invoke-WebRequest -Uri $ngrokDownloadUrl -OutFile "$ngrokFolderPath\ngrok.zip"

# Extract the downloaded zip file
Expand-Archive -Path "$ngrokFolderPath\ngrok.zip" -DestinationPath $ngrokFolderPath

# Ensure ngrok.exe is in the right folder
if (-Not (Test-Path -Path "$ngrokFolderPath\ngrok.exe")) {
    Write-Error "Ngrok executable was not found after downloading."
}
