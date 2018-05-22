#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests. 
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#

#
# Import module
#

$ModuleName = 'SE.IntroModule'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$root = (get-item $here).Parent.FullName
Import-Module (Join-Path $root "$ModuleName.psm1") -Force  # TODO: Update to .psd1

#
# Display troubleshooting variables
#

if ($Env:APPVEYOR) {
    Write-Host "Checking environment details`n"
    $PSVersionTable | Out-Host
    Get-Module | Out-Host
    Get-Module -ListAvailable PowerShellGet,PackageManagement | Out-Host
    Get-PackageProvider | Out-Host
    Get-PackageProvider -ListAvailable  | Out-Host    
}

#
# Fake test
#

Describe 'Fake Test' {
    It "Runs Fake Test" {
        $true | Should Be $true
    }
}


#
# Module should import two functions
#

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

#
# Check if documentation is proper
#

Describe 'Proper Documentation' {

	It 'Updates documentation and does git diff' {
        if (!(Get-Module platyPS -List -ea 0)) {Install-Module platyPS -Force -Scope CurrentUser}
		Import-Module platyPS
		# update documentation 
		Push-Location -Path $root
        Update-MarkdownHelp -Path .\Docs
        New-ExternalHelp -Path .\Docs -OutputPath .\en-US -Force
        $diff = git diff .\Docs .\en-US
        Pop-Location
		$diff | Should -Be $null
	}
}
