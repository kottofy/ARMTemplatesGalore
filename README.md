# ARM Templates for Jenkins

This is a place to put all useful ARM templates for a particular project that is in progress

## Steps to Deploy
1. Create a resource group or identify an existing one
2. If using the Azure shell with Bash, upload the files related to a particular ARM template
3. Run the command to deploy:
    - WITHOUT the parameters file: 
        
        `az group deployment create --resource-group YOUR_RESOURCE_GROUP_HERE --template-file azuredeploy.json`
    - WITH the parameters file: 
    
        `az group deployment create --resource-group YOUR_RESOURCE_GROUP_HERE--template-file azuredeploy.json --parameters azuredeploy.parameters.json`


Notes
    - For the Azure Function, the Always On feature is enabled at the Basic App Service Plan or above
    - Must use api version "2015-04-01" for dynamic sku with "Microsoft.Web/serverfarms"