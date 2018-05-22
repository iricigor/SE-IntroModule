function Get-Cube {
    <#
    .SYNOPSIS
        SE-UP example commandlet
    .EXAMPLE
        cube 2,3,4
        Returns cubes of specified numbers
    .EXAMPLE
        2,3,4 | cube
        Returns cubes of numbers passed via pipeline
    #>
    
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [int[]]$Number
    )
    
    BEGIN {
        Write-Verbose "begin $($Number.Count) elements"
    }
    
    PROCESS {
        Write-Verbose "process $($Number.Count) elements"
        foreach ($N in $Number) {
            Write-Verbose 'calculating'
            $N * $N * $N
        }
    }
    
    END {
        Write-Verbose "end $($Number.Count) elements"
    }
    
    }
    
    Set-Alias cube Get-Cube