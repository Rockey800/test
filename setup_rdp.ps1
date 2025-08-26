# Enable RDP
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0

# Enable firewall rule
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Start RDP service
Start-Service -Name TermService
