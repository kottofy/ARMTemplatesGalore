#!/bin/bash

resource_group_name="DevJBResourceGroup"
location="eastus"
num_of_storage_accounts=6
current="$(date +%Y%m%d%H%M%S)"
storageAccountName1="1blob$current"
storageAccountName2="2blob$current"
storageAccountName3="3blob$current"
storageAccountName4="4blob$current"
storageAccountName5="5blob$current"
storageAccountName6="6blob$current"

if az group exists --name "$resource_group_name"; then 
    az group delete --name "$resource_group_name" --yes
fi
az group create --name "$resource_group_name" --location "$location"

echo '
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
    "parameters": {
        "prefixName": {
            "value": "jber"
        },
        "databricksWorkspaceName": {
            "value": "databricks'$current'"
        },
        "appinsightsName": {
            "value": "appinsights'$current'"
        },
        "storageAccountType": {
            "value": "Standard_LRS"
        },
        "storageAccountSku": {
            "value": "Basic"
        },
        "workerSize": {
            "value": "0"
        },
        "dataFactoryName": {
            "value": "datafactory'$current'"
        },
        "dataFactoryLocation": {
            "value": "East US"
        },
        "webAppSku": {
            "value": "F1"
        },
        "webAppName": {
            "value": "webapp'$current'"
        },
        "storageAccountName1": {
            "value": "'$storageAccountName1'"
        },
        "storageAccountName2": {
            "value": "'$storageAccountName2'"
        },
        "storageAccountName3": {
            "value": "'$storageAccountName3'"
        },
        "storageAccountName4": {
            "value": "'$storageAccountName4'"
        },
        "storageAccountName5": {
            "value": "'$storageAccountName5'"
        },
        "storageAccountName6": {
            "value": "'$storageAccountName6'"
        }
    }
}
' | tee master/azuredeploy.parameters.json