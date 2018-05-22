$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module $here\IntroModule.psm1

Describe 'Fake Test' {
    It "Runs Fake Test" {
        $true | Should Be $true
    }
}

Describe 'Proper Declarations' {
    It 'Checks for existence of functions' {
        (Get-Command -Module IntroModule).Count | Should -Be 2
        Get-Command Get-Cube -ea 0 | Should -Not -Be $Null
        Get-Command Get-Square -ea 0 | Should -Not -Be $Null
        Get-Command Get-Fourth -ea 0 | Should -Be $Null
    }

    It 'Checks for Parameters' {
        Get-Command -Module IntroModule | % {
            $_.Parameters.Number  | Should -Not -Be $null
            $_.Parameters.FakeParam | Should -Be $null
        }
    }

    It 'Checks for Aliases' {
        Get-Command -Module IntroModule | % {
            Get-Alias -Definition ($_.Name) | Should -Not -Be $null
        }
    }
}

# Describe 'FunctionsMustHaveVerboseOutput' {
#     It 'ChecksForVerboseOutput' {
#         Get-Square 2 | Out-Null | Should -Be $null
#         Get-Cube 2 | Out-Null | Should -Be $null
#         Get-Square 2 -Verbose | Out-Null | Should -Not -Be $null
#         Get-Cube 2 -Verbose | Out-Null | Should -Not -Be $null
#     }
# }

Describe 'Proper Functionality' {
    It 'Checks Proper Functionality' {
        Get-Square 2 | Should -Be 4
        Get-Cube 2 | Should -Be 8
    }

    It 'Accepts pipeline input' {
        3,4 | Get-Square | Should -Be @(9,16)
        3,4 | Get-Cube | Should -Be @(27,64)
    }

}