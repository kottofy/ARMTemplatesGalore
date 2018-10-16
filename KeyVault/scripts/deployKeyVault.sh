#!/bin/bash

vaultname={kristintest1234356}
password={muhP4ss892734678}

az group create --name DevJBResourceGroup --location 'East US'
az keyvault create \
  --name $vaultname \
  --resource-group DevJBResourceGroup \
  --location 'East US' \
  --enabled-for-template-deployment true
# az keyvault secret set --vault-name $vaultname --name examplesecret --value $password