Repro for a scoping issue in [Pester](https://pester.dev)

`SampleModule.psm1` is a simple Module exporting only a single command `Get-Response`.
`Get-Response` itself just performs a GET on http://example.com using `Invoke-WebRequest`.

`SampleModule.Tests.ps1` contains a single pester test case that calls `Get-Response`.
It mocks `Invoke-WebRequest` and expects `Get-Response` to return the mocked value.

When running the tests using `Invoke-Pester`, everything works as expected.
The test passes because `Get-Response` returns the mocked response.

However, when running the script `run-tests.ps1` (which just calls `Invoke-Pester`), the tests fail because the *real* `Invoke-WebRequest` gets executed instead of the mock.