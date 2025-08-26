$guacDir = "C:\Guacamole"
$guacExe = "$guacDir\guacd.exe"

if (-Not (Test-Path $guacExe)) {
    Write-Host "🔍 Downloading Guacamole..."
    New-Item -Path $guacDir -ItemType Directory -Force | Out-Null

    # Download prebuilt Guacamole Windows port
    Invoke-WebRequest -Uri "https://github.com/bigbluebutton/guacamole-win/releases/latest/download/guacd.exe" -OutFile $guacExe
}

Write-Host "🚀 Starting Guacamole server..."
Start-Process -FilePath $guacExe -ArgumentList "-f" -WindowStyle Hidden

# Wait few seconds for server to start
Start-Sleep -Seconds 5
