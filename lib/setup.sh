#!/bin/bash

resource_group_name="ExampleGroup"
location="eastus"

if az group exists --name "$resource_group_name"; then 
    az group delete --name "$resource_group_name" --yes
fi
az group create --name "$resource_group_name" --location "$location"