
if [az group exists --name ExampleGroup]
then 
    az group delete --name ExampleGroup --yes
fi
az group create --name ExampleGroup --location "East US"