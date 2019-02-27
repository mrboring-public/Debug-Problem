Set-StrictMode -Version Latest

remove-module Debug-Problem-Module -Force -ErrorAction SilentlyContinue
Import-Module "$PSScriptRoot\..\Debug-Problem-Module.psm1" -Force

InModuleScope -ModuleName 'Debug-Problem-Module' -ScriptBlock {

    Describe -Name 'Test-Function' -Fixture {

        It -Name 'Calling this function should write text to the console' -Test {
            Mock -CommandName 'Write-Host' -MockWith {return $true}

            $result = Test-Function -TestParam 'dummyText'

            $result | Should Be $true

            Assert-MockCalled -CommandName 'Write-Host' -Scope It -Exactly 1
        } # It -Name 'Calling this function should write text to the console'

    } # Describe -Name 'Test-Function'

} # InModuleScope -ModuleName 'Debug-Problem-Module'