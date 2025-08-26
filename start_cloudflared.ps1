$cloudExe = "C:\ProgramData\cloudflared\cloudflared.exe"

# Wait until port 5900 is open
$maxWait = 30
$waited = 0
$portOpen = $false
while (-not $portOpen -and $waited -lt $maxWait) {
    try {
        $tcp = New-Object System.Net.Sockets.TcpClient
        $tcp.Connect("127.0.0.1", 5900)
        $tcp.Close()
        $portOpen = $true
    } catch {}
    Start-Sleep -Seconds 1
    $waited++
}

if (-not $portOpen) {
    Write-Warning "⚠️ Port 5900 not open. Cloudflared cannot start."
    exit 1
}

# Start Cloudflared
Write-Host "🚀 Starting Cloudflare Tunnel for noVNC..."
$tunnelProcess = Start-Process -FilePath $cloudExe `
    -ArgumentList "tunnel --url http://localhost:5900" `
    -NoNewWindow -PassThru -RedirectStandardOutput "$env:TEMP\cloudflared.log"

# Wait for public URL
$publicUrl = $null
$maxWait = 60
$waited = 0
while (-not $publicUrl -and $waited -lt $maxWait) {
    Start-Sleep -Seconds 2
    $waited += 2
    if (Test-Path "$env:TEMP\cloudflared.log") {
        $logContent = Get-Content "$env:TEMP\cloudflared.log" -Raw
        if ($logContent -match "(https://[^\s]+\.trycloudflare\.com)") {
            $publicUrl = $matches[1]
        }
    }
}

if ($publicUrl) {
    Write-Host "🌐 Your noVNC public URL: $publicUrl"
} else {
    Write-Warning "⚠️ Could not detect public URL. Check cloudflared logs at $env:TEMP\cloudflared.log"
}
