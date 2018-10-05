#!/bin/bash

resourceGroupName={ExampleGroup}

if [az group exists --name $resourceGroupName]; then 
    az group delete --name $resourceGroupName --yes
fi
az group create --name $resourceGroupName --location "East US"