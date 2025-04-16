# Path where ngrok should be installed
$ngrokInstallPath = "C:\ngrok"

# Download ngrok if not already installed
if (-Not (Test-Path "$ngrokInstallPath\ngrok.exe")) {
    Write-Output "Ngrok not found. Downloading ngrok..."

    # Download ngrok
    $ngrokVersion = "v3.22.1"  # Specify the desired version
    $ngrokDownloadUrl = "https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64-$ngrokVersion.zip"
    $downloadPath = "$env:TEMP\ngrok.zip"
    
    Invoke-WebRequest -Uri $ngrokDownloadUrl -OutFile $downloadPath
    Write-Output "Downloaded ngrok.zip."

    # Extract ngrok
    Expand-Archive -Path $downloadPath -DestinationPath $ngrokInstallPath
    Write-Output "Ngrok extracted to $ngrokInstallPath."
} else {
    Write-Output "Ngrok is already installed at $ngrokInstallPath."
}
