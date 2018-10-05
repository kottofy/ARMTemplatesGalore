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
          // sh 'az group delete --name ExampleGroup --yes'
          sh 'az group create --name ExampleGroup --location "East US"'
      }
    }

     stage('keyvault') {
      steps {
          // sh 'chmod +x ${WORKSPACE}/KeyVault/scripts/deployKeyVault.sh'
          // sh '${WORKSPACE}/KeyVault/scripts/deployKeyVault.sh'
          sh 'az group deployment create --resource-group ExampleGroup --template-file KeyVault/azuredeploy.json --parameters KeyVault/azuredeploy.parameters.json'
      }
    }

    //  stage('web') {
    //   steps {
    //       sh 'az group deployment create --resource-group ExampleGroup --template-file WebApp/azuredeploy.json --parameters WebApp/azuredeploy.parameters.json'
    //       sh 'az group deployment create --resource-group ExampleGroup --template-file Functions/Dynamic/azuredeploy.json --parameters Functions/Dynamic/azuredeploy.parameters.json'
    //       sh 'az group deployment create --resource-group ExampleGroup --template-file Functions/Dedicated/azuredeploy.json --parameters Functions/Dedicated/azuredeploy.parameters.json'
    //   }
    // }

    // stage('storage') {
    //   steps {
    //       sh 'az group deployment create --resource-group ExampleGroup --template-file Storage/azuredeploy.json --parameters Storage/azuredeploy.parameters.json'
    //   }
    // }
   
    // stage('master') {
    //   steps {
    //       sh 'az group deployment create --resource-group ExampleGroup --template-file Master/azuredeploy.json --parameters Master/azuredeploy.parameters.json'
    //   }
    // }

    stage('teardown') {
      steps {
          sh 'az group delete --name ExampleGroup --yes'
      }
    }

  }
}