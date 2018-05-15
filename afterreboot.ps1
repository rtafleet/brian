New-Item -Path "C:\" -ItemType Directory -Name "temp"
New-Item -Path "C:\windows\temp" -Name "testuserdata.txt" -ItemType "file" -Value "Yep, userdata obviously ran"
Add-RDServer -Server "$env:computername.$env:userdnsdomain" -Role "RDS-GATEWAY" -ConnectionBroker "aws-rdscb01.rta-host.com"
Add-RDServer -Server "$env:computername.$env:userdnsdomain" -Role "RDS-WEB-ACCESS" -ConnectionBroker "aws-rdscb01.rta-host.com"
Import-Module activedirectory
get-adcomputer $env:computername | Move-ADObject -TargetPath 'OU=RTA,DC=rta-host,DC=com'
Import-Module RemoteDesktopServices
cd RDS:\
