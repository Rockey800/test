$cloudExe = "C:\ProgramData\cloudflared\cloudflared.exe"

Write-Host "🚀 Starting Cloudflare Tunnel for noVNC..."
Start-Process -FilePath $cloudExe -ArgumentList "tunnel --url http://localhost:5900" -NoNewWindow -PassThru

# Wait a few seconds and output quick tunnel URL
Start-Sleep -Seconds 5

# Note: quick tunnels print the URL to stdout
Write-Host "🌐 Check Cloudflared logs for your public noVNC URL"
