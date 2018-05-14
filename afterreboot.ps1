New-Item -Path "C:\windows\temp" -Name "testuserdata.txt" -ItemType "file" -Value "Yep, userdata obviously ran"
Add-WindowsFeature SNMP-Service
Add-WindowsFeature RSAT-SNMP
Add-Windowsfeature SNMP-WMI-Provider
Add-Windowsfeature RSAT-AD-AdminCenter
Add-RDServer -Server "$env:computername.$env:userdnsdomain" -Role "RDS-WEB-ACCESS" -ConnectionBroker "aws-rdscb01.rta-host.com"
Import-Module activedirectory
get-adcomputer $env:computername | Move-ADObject -TargetPath 'OU=RTA,DC=rta-host,DC=com'