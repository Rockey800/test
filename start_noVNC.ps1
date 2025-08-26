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

# Start websockify to wrap RDP (port 3389 -> 5900)
Write-Host "🚀 Starting websockify for RDP..."
$logFile = "$env:TEMP\websockify.log"
$errFile = "$env:TEMP\websockify_err.log"

Start-Process -FilePath "python" `
    -ArgumentList "$websockifyDir\run -v 5900 --wrap-mode=rdp localhost 3389" `
    -NoNewWindow -RedirectStandardOutput $logFile -RedirectStandardError $errFile

# Wait until port 5900 is reachable
$maxTries = 20
$connected = $false
for ($i=1; $i -le $maxTries; $i++) {
    try {
        Invoke-WebRequest -Uri http://localhost:5900 -UseBasicParsing -TimeoutSec 2
        $connected = $true
        break
    } catch {}
    Start-Sleep -Seconds 2
}

if (-not $connected) {
    Write-Warning "⚠️ Websockify did not start on port 5900. Check $logFile"
} else {
    Write-Host "✅ Websockify is running on http://localhost:5900"
}
