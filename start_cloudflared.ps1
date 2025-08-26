# Load cloudflared
$cloudExe = "C:\ProgramData\cloudflared\cloudflared.exe"

# Run tunnel for Guacamole web interface (default port 8080)
Write-Host "🚀 Starting Cloudflare Tunnel..."
Start-Process -FilePath $cloudExe -ArgumentList "tunnel --url http://localhost:8080" -NoNewWindow -PassThru

# Wait a few seconds
Start-Sleep -Seconds 5

# Capture the public URL from logs
Start-Sleep -Seconds 5
$logFile = "C:\ProgramData\cloudflared\public_url.txt"
$pattern = "https://.*trycloudflare.com"

# Poll cloudflared log
for ($i=0; $i -lt 12; $i++) {
    $output = & $cloudExe "tunnel" "list"
    if ($output -match $pattern) {
        $publicUrl = $matches[0]
        Set-Content -Path $logFile -Value $publicUrl
        Write-Host "`n🌐 Public Browser RDP URL: $publicUrl`n"
        break
    }
    Start-Sleep -Seconds 5
}

if (-Not $publicUrl) {
    Write-Warning "❌ Could not get public URL. Check cloudflared logs."
}
