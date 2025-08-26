$cloudExe = "C:\ProgramData\cloudflared\cloudflared.exe"

# Start Cloudflared quick tunnel
Write-Host "🚀 Starting Cloudflare Tunnel for noVNC..."
$tunnelProcess = Start-Process -FilePath $cloudExe `
    -ArgumentList "tunnel --url http://localhost:5900" `
    -NoNewWindow -PassThru -RedirectStandardOutput "$env:TEMP\cloudflared.log"

# Wait for the public URL to appear in logs
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
