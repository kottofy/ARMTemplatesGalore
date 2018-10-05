#!/bin/bash

resourceGroupName={ExampleGroup}

if ! command az >/dev/null; then
  echo "Must install Azure CLI: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli" >&2
  exit 1
fi

if az group exists --name $resourceGroupName; then 
    az group delete --name $resourceGroupName --yes
fi
az group create --name $resourceGroupName --location "East US"