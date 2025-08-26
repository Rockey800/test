$noVNCDir = "C:\noVNC"
$websockifyDir = "$noVNCDir\websockify"

# Download noVNC
if (-Not (Test-Path $noVNCDir)) {
    Write-Host "🔍 Downloading noVNC..."
    Invoke-WebRequest -Uri "https://github.com/novnc/noVNC/archive/refs/heads/master.zip" -OutFile "$env:TEMP\novnc.zip"
    Expand-Archive -Path "$env:TEMP\novnc.zip" -DestinationPath "$env:TEMP\novnc" -Force
    Move-Item "$env:TEMP\novnc/noVNC-master" $noVNCDir
}

# Download websockify
if (-Not (Test-Path $websockifyDir)) {
    Write-Host "🔍 Downloading websockify..."
    Invoke-WebRequest -Uri "https://github.com/novnc/websockify/archive/refs/heads/master.zip" -OutFile "$env:TEMP\websockify.zip"
    Expand-Archive -Path "$env:TEMP\websockify.zip" -DestinationPath "$env:TEMP\websockify" -Force
    Move-Item "$env:TEMP\websockify/websockify-master" $websockifyDir
}

# Start websockify to wrap RDP (port 3389) on port 5900
Write-Host "🚀 Starting websockify for RDP..."
Start-Process -FilePath "python" -ArgumentList "$websockifyDir\run -v 5900 --wrap-mode=rdp localhost 3389" -WindowStyle Hidden
Start-Sleep -Seconds 5
