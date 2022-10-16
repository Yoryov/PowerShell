<# Using foreach with a file with domain names as targets
Make sure create a "targets.txt" file and add one domain name per line
#>
$targets = Get-Content .\targets.txt
$ports = @(80,443,22)

foreach ($target in $targets){ 
    Write-Output "Scanning $($target)"
   foreach($port in $ports){
        if (Test-NetConnection $target -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue){
            Write-Output "  Port $($port) open"
        }else{
            Write-Output "  Port $($port) closed"
        }
    }
}

<#Using a for with a list of targets#>
$targets = @("example.com", "nasa.gov", "facebook.com", "cyberoperator.dev")

for ($i = 0; $i -le $targets.Length; $i++){
    
    if (Test-NetConnection $targets[$i] -Port 443 -InformationLevel Quiet -WarningAction SilentlyContinue){
        Write-Output "$($targets[$i]) has a website! go to https://$($targets[$i])"
    }
}