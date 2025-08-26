$guacDir = "C:\Guacamole"
$javaExe = "C:\Program Files\Zulu\zulu-17\bin\java.exe"  # Make sure Java 17 installed

Write-Host "🚀 Starting Guacamole on port 8080..."
Start-Process -FilePath $javaExe `
    -ArgumentList "-jar", "$guacDir\guacamole.war", "--port", "8080" `
    -WindowStyle Hidden

# Wait until port 8080 is open
$maxTries = 20
$connected = $false
for ($i=1; $i -le $maxTries; $i++) {
    try {
        $tcp = New-Object System.Net.Sockets.TcpClient("127.0.0.1", 8080)
        $tcp.Close()
        $connected = $true
        break
    } catch {}
    Start-Sleep -Seconds 3
}
if (-not $connected) { Write-Warning "Guacamole did not start on port 8080."; exit 1 }
Write-Host "✅ Guacamole running on http://localhost:8080"
