$cloudDir = "C:\ProgramData\cloudflared"
$cloudExe = "$cloudDir\cloudflared.exe"

if (-Not (Test-Path $cloudExe)) {
    Write-Host "🔍 Downloading cloudflared..."
    New-Item -Path $cloudDir -ItemType Directory -Force | Out-Null
    Invoke-WebRequest -Uri "https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.exe" -OutFile $cloudExe
}
