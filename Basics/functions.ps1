<#
Functions vs Cmdlets
    - PowerShell cmdlets are written typically with C#
    - PowerShell functions are written with PowerShell cmdlets
#>

# Get-Command -CommandType Function
# Get-Verb


$lastversion = 3
function Install-Malware {
    [CmdletBinding()]
    param (
        # First parameter
        [Parameter()]
        [ValidateSet('1','2','3')]
        [float] $Version = $lastversion,

        # Second Parameter
        [Parameter(Mandatory, ValueFromPipeline)]
        [string] $ComputerName
    )
    process{
    Write-Host "Installing malware version $Version on $ComputerName target"
    }
}

Install-Malware