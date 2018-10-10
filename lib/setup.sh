#!/bin/bash

resource_group_name="DevJBResourceGroup"
location="eastus"
num_of_storage_accounts=6
current="$(date +%Y%m%d%H%M%S)"


if az group exists --name "$resource_group_name"; then 
    az group delete --name "$resource_group_name" --yes
fi
az group create --name "$resource_group_name" --location "$location"

echo '
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
    "parameters": {
        "namingPrefix": {
            "value": "jber"
        },
        "databricksWorkspaceName": {
            "value": "databricks" + ' + $current + '
        },
        "appinsightsName": {
            "value": "appinsights" + ' + $current + '
        },
        "storageAccountType": {
            "value": "Standard_LRS"
        },
        "storageAccountSku": {
            "value": "Basic"
        },
        "storageAccountName": {
            "value": "storage" + ' + $current + '
        },
        "workerSize": {
            "value": "0"
        },
        "dataFactoryName": {
            "value": "datafactory" + ' + $current + '
        },
        "dataFactoryLocation": {
            "value": "East US"
        },
        "webAppSku": {
            "value": "F1"
        },
        "webAppName": {
            "value": "webapp" + ' + $current + '
        }
    }
}
' | tee azuredeploy.parameters.json