vaultname={kristintest1234356}
password={muhP4ss892734678}

az group create --name examplegroup --location 'East US'
az keyvault create \
  --name $vaultname \
  --resource-group examplegroup \
  --location 'East US' \
  --enabled-for-template-deployment true
az keyvault secret set --vault-name $vaultname --name examplesecret --value $password