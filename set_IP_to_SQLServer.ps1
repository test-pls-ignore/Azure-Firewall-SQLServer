
 #.\set_IP_to_SQLServer.ps1 -Environment {DEV|PRD} 

Param
(
    [parameter(Mandatory = $true)]
    [ValidateSet("DEV", "PRD")]
    [String]
    $Environment="DEV"
)

$Subscription=@{
    DEV="DEV subscription name";
    PRD="PRD subscription name"
}

$ResourceGroupDict=@{
    DEV ="DEV resource group name";
    PRD="PRD resource group name"
}

$ServerDict=@{
DEV ="DEV Server name";
PRD = "PRD Server name"
}

#Firewall rule that needs to be changed
$FirewallRuleName = "your rule name"

#current external  IP adress
$myIP = (Invoke-WebRequest -uri "https://api.ipify.org/").Content

$Tenant = "your Directory ID"

#get ResourceGroup
if ([string]::IsNullOrEmpty($ResourceGroup)) 
{$ResourceGroupName=$ResourceGroupDict.$Environment} 
else
{$ResourceGroup=$ResourceGroup}

#get SQL Server
if ([string]::IsNullOrEmpty($Server)) 
{$ServerName=$ServerDict.$Environment} 
else
{$ServerName=$Server}


#connect to azure
Connect-AzAccount
Set-AzContext -Tenant $Tenant -Subscription $Subscription.$Environment


#show current firewall rule
Get-AzSqlServerFirewallRule -ResourceGroupName $ResourceGroupName -ServerName $ServerName -FirewallRuleName $FirewallRuleName

#update and show firewall rule
Set-AzSqlServerFirewallRule -ResourceGroupName $ResourceGroupName -ServerName $ServerName -FirewallRuleName $FirewallRuleName -StartIpAddress $myIP -EndIpAddress $myIP
