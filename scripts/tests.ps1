# Extract of LogicApp.Tests.with.CLI.ps1

Describe "Deployment Tests" {
    # Init
    # BeforeAll {
    #     az login --service-principal -u $Username -p $Password -t $TenantId
    # }

    # Teardown
    AfterAll {
    }

    # Tests whether the cmdlet returns value or not.
    Context "When deployed with parameters" {
        $output = az group deployment validate `
            --resource-group DevJBResourceGroup `
            --template-file Master/azuredeploy.json `
            --parameters Master/azuredeploy.parameters.json `
            | ConvertFrom-Json

        $result = $output.properties

        It "Should be deployed successfully" {
            $result.provisioningState | Should -Be "Succeeded"
        }

        # It "Should have name of" {
        #     $expected = "log-app"
        #     $resource = $result.validatedResources[0]

        #     $resource.name | Should -Be $expected
        # }
    }
}