function Get-Response {

    [CmdletBinding()]
    param()

    Invoke-WebRequest "http://example.com"
}