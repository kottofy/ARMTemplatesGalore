#!/bin/bash

resource_group_name="DevJBResourceGroup"
location="eastus"
num_of_storage_accounts=6
current="$(date +%F)"


if az group exists --name "$resource_group_name"; then 
    az group delete --name "$resource_group_name" --yes
fi
az group create --name "$resource_group_name" --location "$location"


#Create Parameters JSON file
echo '
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
    "parameters": {
        "namingPrefix": {
            "value": "jber"
        },
        "databricksWorkspaceName": {
            "value": "devdatabricksjb123"
        },
        "appinsightsName": {
            "value": "devappinsightsjb123"
        },
        "storageAccountType": {
            "value": "Standard_LRS"
        },
        "storageAccountSku": {
            "value": "Basic"
        },
        "storageAccountName": {
            "value": "jber"
        },
        "workerSize": {
            "value": "0"
        },
        "dataFactoryName": {
            "value": "devdatafactoryjb123"
        },
        "dataFactoryLocation": {
            "value": "East US"
        },
        "webAppSku": {
            "value": "F1"
        },
        "webAppName": {
            "value": "devwebappjb123"
        }
    }
}
' > azuredeploy.parameters.json