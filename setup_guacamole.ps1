# Create Guacamole folder
$guacDir = "C:\Guacamole"
if (-not (Test-Path $guacDir)) { New-Item -ItemType Directory -Path $guacDir }

# Download Guacamole server
$zipUrl = "https://github.com/apache/guacamole-server/releases/download/1.6.0/guacamole-1.6.0.war"
$zipPath = "$guacDir\guacamole.war"
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Extract WAR if needed
# (For simplicity, assume embedded Tomcat in WAR)
