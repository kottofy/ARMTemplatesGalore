pipeline {
  agent any
  stages {
    stage('login') {
      steps {
        withCredentials(bindings: [azureServicePrincipal('Kristins Azure ARMTemplatePractice')]) {
          sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
        }
      }
    }

    stage('setup') {
      steps {
        withCredentials(bindings: [azureServicePrincipal('Kristins Azure ARMTemplatePractice')]) {
          // sh 'az group delete --name ExampleGroup1 --yes'
          sh 'az group create --name ExampleGroup1 --location "East US"'
        }
      }
    }
   
    stage('deploy') {
      steps {
        withCredentials(bindings: [azureServicePrincipal('Kristins Azure ARMTemplatePractice')]) {
          sh 'az group deployment create --resource-group ExampleGroup1 --template-file Master/azuredeploy.json --parameters Master/azuredeploy.parameters.json'
          // sh 'az group deployment create --resource-group ExampleGroup1 --template-file WebApp/azuredeploy.json --parameters WebApp/azuredeploy.parameters.json'
          // sh 'az group deployment create --resource-group ExampleGroup1 --template-file Storage/azuredeploy.json --parameters Storage/azuredeploy.parameters.json'
          // sh 'az group deployment create --resource-group ExampleGroup1 --template-file Functions/Dynamic/azuredeploy.json --parameters Functions/Dynamic/azuredeploy.parameters.json'
          // sh 'az group deployment create --resource-group ExampleGroup1 --template-file Functions/Dedicated/azuredeploy.json --parameters Functions/Dedicated/azuredeploy.parameters.json'
          
        }
      }
    }
  }
}