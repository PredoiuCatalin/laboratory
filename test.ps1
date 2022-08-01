[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string[]]$breed,
    [bool]$list,
    [bool]$count,
    [bool]$image
)
$dogserver = 'https://dog.ceo/api'
$cmdOutput = Invoke-RestMethod "$dogserver/breed/$breed/list" | Select-Object -Property 'message' -ExpandProperty message
if ($list){
    Write-Host $cmdOutput
    }
if ($count){
    $myList = $cmdOutput.split(' ')
    $counter = $(echo $myList | measure).Count
    Write-Host $counter
    }



