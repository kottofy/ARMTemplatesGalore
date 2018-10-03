pipeline {
  agent any
  stages {
    stage('ls') {
      steps {
        sh 'ls ${WORKSPACE}'
        withCredentials(bindings: [azureServicePrincipal('Kristins Azure ARMTemplatePractice')]) {
          sh 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
          sh 'az group deployment create --resource-group ARMTemplatePractice --template-file Storage/azuredeploy.json --parameters Storage/azuredeploy.parameters.json'
        }
      }
    }
  }
}