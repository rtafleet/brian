#### File needs saved to \\rta-fs\tempwebsitedownloads\Brian folder whenever it's modified

New-Item -Path "C:\" -ItemType Directory -Name "temp"
New-Item -Path "C:\windows\temp" -Name "testuserdata.txt" -ItemType "file" -Value "Yep, userdata obviously ran"
Add-RDServer -Server "$env:computername.$env:userdnsdomain" -Role "RDS-GATEWAY" -ConnectionBroker "aws-rdscb01.rta-host.com"
Add-RDServer -Server "$env:computername.$env:userdnsdomain" -Role "RDS-WEB-ACCESS" -ConnectionBroker "aws-rdscb01.rta-host.com"
Import-Module activedirectory
get-adcomputer $env:computername | Move-ADObject -TargetPath 'OU=RTA,DC=rta-host,DC=com'
Import-Module RemoteDesktopServices
cd RDS:\GatewayServer\CAP\Default-CAP\UserGroups
New-Item -Name "domain users@RTA-HOST"
cd RDS:\GatewayServer\RAP\Default-RAP\UserGroups
New-Item -Name "domain users@RTA-HOST"
cd RDS:\GatewayServer
Set-Item -Path SSLBridging -Value 2


#replace rdsweb pages with branded stuff



#Import-Module ActiveDirectory
#$Computer = Get-Content env:computername
#If (Get-ADObject $Computer -eq $null) 
#{
#$User = Read-Host -Prompt "Enter user with domain joining privileges"
#$Password = Read-Host -Prompt "Enter password for $user" -AsSecureString 
#$Domain = Read-Host -Promt "Enter the domain" 
#$Username = "$Domain\$User" 
#$Credential = New-Object System.Management.Automation.PSCredential($Username,$Password) 
#Add-Computer -DomainName $domain -Credential $Credential
#}
#else {
#Write-Host "$Computer already exists in the domain"
#}



####cross zone load balancing??????
