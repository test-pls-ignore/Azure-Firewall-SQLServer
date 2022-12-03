# Azure-Firewall-SQLServer

This powershell script enables you to change your IP adress in a firewall rule for a SQL Server on Azure. 

To successfully run it you need to customize the variables.

The template as it is can handle multiple environments (so multiple subscrpiptions, resource groups, sql servers etc.) but you can of course also use it for just one resource.

The $Subscription variable needs the name of your subscription(s).
![image](https://user-images.githubusercontent.com/53261343/205454020-e34674b5-e9d3-4791-a404-1914b2d60c99.png)

The $ResourceGroupDict variable needs the name(s) of your resource group(s).
![image](https://user-images.githubusercontent.com/53261343/205453602-399b9b71-bc07-42da-a1ab-56b9817354e1.png)

The $ServerDict variable needs the server name(s).
![image](https://user-images.githubusercontent.com/53261343/205453792-6a7bcf83-55e9-48ce-9669-9c9f0c16f4e9.png)

The $FirewallRuleName variable is name you give your firewall rule.
![image](https://user-images.githubusercontent.com/53261343/205453892-621a7ed1-8792-483e-8ceb-7ab25958e5e9.png)

The $Tenant variable needs your Directory ID.
![image](https://user-images.githubusercontent.com/53261343/205454285-b017e2b8-fbb9-4240-affb-cfa936ede689.png)

