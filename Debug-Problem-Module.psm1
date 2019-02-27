Set-StrictMode -Version Latest

function Test-Function {
    param(
        [string] $TestParam
    )

    Write-Host "TestParam: $TestParam"
}