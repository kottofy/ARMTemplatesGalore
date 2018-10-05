
if (az group exists --name ExampleGroup)
    az group delete --name ExampleGroup --yes
az group create --name ExampleGroup --location "East US"