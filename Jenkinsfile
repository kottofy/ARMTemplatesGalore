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
          sh 'chmod +x ${WORKSPACE}/lib/setup.sh'
          sh '${WORKSPACE}/lib/setup.sh'
      }
    }
   
    stage('deploy-master') {
      steps {
          sh 'az group deployment create --resource-group DevResourceGroupJB --template-file Master/azuredeploy.json --parameters Master/azuredeploy.parameters.json'
      }
    }
    
  }
}