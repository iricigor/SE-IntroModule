function Get-Square {
    <#
    .SYNOPSIS
        SE-UP example commandlet
    .EXAMPLE
        square 2,3,4
        Returns square of specified numbers
    .EXAMPLE
        2,3,4 | square
        Returns squares of numbers passed via pipeline
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
            $N * $N
        }
    }
    
    END {
        Write-Verbose "end $($Number.Count) elements"
    }
    
    }
    
    Set-Alias square Get-Square