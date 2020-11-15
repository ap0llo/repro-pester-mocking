BeforeAll {
    Remove-Module "SampleModule" -Force -ErrorAction SilentlyContinue
    Import-Module (Join-Path $PSScriptRoot "SampleModule.psm1")
}

Describe "Get-Response" {

    It "returns the expected data" {

        Mock Invoke-WebRequest {
            return [PSCustomObject]@{
                Content = "Hello World"
            }
        }

        $response =  Get-Response
        $response.Content | Should -Be "Hello World"
    }
}