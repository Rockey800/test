$port = 8080
$cloudflaredExe = "C:\cloudflared\cloudflared.exe"

# Download cloudflared if missing
if (-not (Test-Path $cloudflaredExe)) {
    Invoke-WebRequest -Uri "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe" -OutFile $cloudflaredExe
}

# Start quick tunnel
$proc = Start-Process -FilePath $cloudflaredExe `
    -ArgumentList "tunnel", "--url", "http://localhost:$port", "--no-autoupdate" `
    -NoNewWindow -PassThru

# Wait a few seconds for URL to be generated
Start-Sleep -Seconds 5

# Extract public URL from logs
$logFile = "$env:TEMP\cloudflared.log"
Start-Sleep -Seconds 5
$publicUrl = & $cloudflaredExe tunnel list | Select-String "trycloudflare.com" | ForEach-Object { $_.ToString() }
Set-Content -Path "$env:TEMP\cloudflared_url.txt" -Value $publicUrl
Write-Host "🌐 Cloudflare Tunnel URL: $publicUrl"
