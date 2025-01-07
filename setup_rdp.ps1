# Variables
$Username = "admin"
$Password = ConvertTo-SecureString "Str0ngP@ssw0rd!" -AsPlainText -Force

# Enable RDP
Write-Output "Enabling RDP..."
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Create a new user
Write-Output "Creating user '$Username'..."
try {
    New-LocalUser -Name $Username -Password $Password -FullName "Admin User" -Description "RDP User" -ErrorAction Stop
    Add-LocalGroupMember -Group "Administrators" -Member $Username -ErrorAction Stop
    Add-LocalGroupMember -Group "Remote Desktop Users" -Member $Username -ErrorAction Stop
    Write-Output "RDP setup completed successfully."
    Write-Output "Use the following credentials:"
    Write-Output "Username: $Username"
    Write-Output "Password: Str0ngP@ssw0rd!"
} catch {
    Write-Error "An error occurred: $_"
}
