#!/bin/bash

resource_group_name="DevJBResourceGroup"
location="eastus"
num_of_storage_accounts=6
current="$(date +%F)"


if az group exists --name "$resource_group_name"; then 
    az group delete --name "$resource_group_name" --yes
fi
az group create --name "$resource_group_name" --location "$location"

parameters='
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
    "parameters": {
        "namingPrefix": {
            "value": "jber"
        },
        "databricksWorkspaceName": {
            "value": "databricks" + current
        },
        "appinsightsName": {
            "value": "appinsights" + current
        },
        "storageAccountType": {
            "value": "Standard_LRS"
        },
        "storageAccountSku": {
            "value": "Basic"
        },
        "storageAccountName": {
            "value": "storage" + current
        },
        "workerSize": {
            "value": "0"
        },
        "dataFactoryName": {
            "value": "datafactory" + current
        },
        "dataFactoryLocation": {
            "value": "East US"
        },
        "webAppSku": {
            "value": "F1"
        },
        "webAppName": {
            "value": "webapp" + current
        }
    }
}
'

echo parameters

#Create Parameters JSON file
echo parameters > azuredeploy.parameters.json