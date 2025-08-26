$noVNCDir = "C:\noVNC"
$websockifyDir = "$noVNCDir\websockify"

# Start websockify
Write-Host "🚀 Starting websockify for RDP..."
$logFile = "$env:TEMP\websockify.log"
$errFile = "$env:TEMP\websockify_err.log"

# Start as job so it keeps running in background
Start-Job -ScriptBlock {
    python "C:\noVNC\websockify\run" -v 5900 --wrap-mode=rdp localhost 3389
} | Out-Null

# Wait until port 5900 is reachable
$maxTries = 20
$connected = $false
for ($i=1; $i -le $maxTries; $i++) {
    try {
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $tcpClient.Connect("127.0.0.1", 5900)
        $tcpClient.Close()
        $connected = $true
        break
    } catch {}
    Start-Sleep -Seconds 2
}

if (-not $connected) {
    Write-Warning "⚠️ Websockify did not start on port 5900."
} else {
    Write-Host "✅ Websockify is running on http://localhost:5900"
}
