param (
    [string]$ngrokAuthToken
)

# --- Input Validation ---
if ([string]::IsNullOrWhiteSpace($ngrokAuthToken)) {
    Write-Error "❌ ngrokAuthToken parameter is required and cannot be empty."
    exit 1
}

# Define ngrok paths
$ngrokDir = "$env:ProgramData\ngrok"
$ngrokExe = "$ngrokDir\ngrok.exe"
$ngrokConfigPath = "$ngrokDir\ngrok.yml" # ngrok creates this file

# --- Download ngrok if not found ---
if (-Not (Test-Path $ngrokExe)) {
    Write-Host "🔍 ngrok.exe not found at '$ngrokExe', downloading..."

    try {
        # Create folder if it doesn't exist
        if (-Not (Test-Path $ngrokDir)) {
            New-Item -Path $ngrokDir -ItemType Directory -Force | Out-Null
            Write-Host "📂 Created ngrok directory: $ngrokDir"
        }

        # Download zip
        $ngrokZip = "$ngrokDir\ngrok.zip"
        Write-Host "⬇️ Downloading ngrok from https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip..."
        Invoke-WebRequest -Uri "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-windows-amd64.zip" -OutFile $ngrokZip -ErrorAction Stop

        # Extract
        Write-Host "📦 Extracting ngrok..."
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ngrokZip, $ngrokDir) -ErrorAction Stop

        # Clean up zip
        Write-Host "🧹 Cleaning up zip file..."
        Remove-Item $ngrokZip -ErrorAction SilentlyContinue # Use SilentlyContinue in case it's already gone

        if (-Not (Test-Path $ngrokExe)) {
            Write-Error "❌ Failed to find ngrok.exe after extraction. Please check the zip contents or download manually."
            exit 1
        }
        Write-Host "✅ ngrok downloaded and extracted successfully."

    } catch {
        Write-Error "❌ An error occurred during ngrok download or extraction: $($_.Exception.Message)"
        exit 1
    }
} else {
    Write-Host "✅ ngrok.exe found at '$ngrokExe'."
}

# --- Authenticate ngrok ---
Write-Host "🔐 Authenticating ngrok..."
try {
    # Explicitly specify the config path for robustness
    # ngrok typically creates ngrok.yml in the same directory as the executable.
    & $ngrokExe config add-authtoken $ngrokAuthToken --config $ngrokConfigPath -ErrorAction Stop
    Write-Host "✅ ngrok authenticated successfully."
} catch {
    Write-Error "❌ Failed to authenticate ngrok. Ensure your token is valid: $($_.Exception.Message)"
    exit 1
}

# --- Start tunnel ---
Write-Host "🚀 Starting ngrok TCP tunnel for RDP (port 3389)..."
try {
    # Use -NoNewWindow for a truly hidden process (no console flash)
    # Use -PassThru to get the process object for potential later management
    # Explicitly specify --config and -WorkingDirectory for robustness
    $ngrokProcess = Start-Process -FilePath $ngrokExe -ArgumentList "tcp 3389 --config $ngrokConfigPath" -WindowStyle Hidden -PassThru -ErrorAction Stop -WorkingDirectory $ngrokDir
    Write-Host "✅ ngrok process started (PID: $($ngrokProcess.Id))."
} catch {
    Write-Error "❌ Failed to start ngrok process: $($_.Exception.Message)"
    exit 1
}

# --- Wait for ngrok API and show public URL ---
$apiUrl = "http://127.0.0.1:4040/api/tunnels"
$maxAttempts = 12 # 12 * 5 seconds = 60 seconds timeout
$attempt = 0
$tcpTunnel = $null

Write-Host "⏳ Waiting for ngrok API to become available (max 60 seconds)..."

while ($attempt -lt $maxAttempts) {
    try {
        # Use -ErrorAction SilentlyContinue here because the API might not be up yet
$response = Invoke-RestMethod -Uri $apiUrl -UseBasicParsing -ErrorAction SilentlyContinue
        if ($response -and $response.tunnels) {
            $tcpTunnel = $response.tunnels | Where-Object { $_.proto -eq "tcp" }
            if ($tcpTunnel) {
                break # Found the tunnel, exit loop
            }
        }
    } catch {
        # API not yet available or other transient error, ignore for now and retry
    }

    Start-Sleep -Seconds 5
    $attempt++
}

if ($tcpTunnel) {
    Write-Host "`n🌐 ngrok Public URL (RDP): $($tcpTunnel.public_url)`n"
    Write-Host "⚠️ Keep this PowerShell window open to maintain the ngrok tunnel. To stop, close this window or use 'Stop-Process -Id $($ngrokProcess.Id)'."
} else {
    Write-Warning "⚠️ Tunnel started but no public URL found after multiple attempts. It may still be starting, or there might be an issue."
    Write-Host "   You can try manually checking the ngrok web interface at http://127.0.0.1:4040 to see the tunnel status."
}


