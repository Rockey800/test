Write-Output "Enabling RDP..."

# Enable RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Set custom username and password
$Username = "admin"  # Explicitly set username to 'admin'
$PlainTextPassword = "Admin@1234"  # Strong password that meets complexity requirements
$SecurePassword = ConvertTo-SecureString -AsPlainText $PlainTextPassword -Force

# Create or update the local user with the specified credentials
if (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue) {
    Write-Output "User '$Username' exists. Updating password..."
    Set-LocalUser -Name $Username -Password $SecurePassword -PasswordNeverExpires:$true
} else {
    Write-Output "Creating user '$Username'..."
    New-LocalUser -Name $Username -Password $SecurePassword -PasswordNeverExpires:$true
}

# Add user to Remote Desktop Users group
Add-LocalGroupMember -Group "Remote Desktop Users" -Member $Username

Write-Output "RDP enabled. Use the following credentials:"
Write-Output "Username: $Username"
Write-Output "Password: $PlainTextPassword"
