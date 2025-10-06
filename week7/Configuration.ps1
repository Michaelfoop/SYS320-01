#. (Join-Path $PSScriptRoot "configuration.txt")

function showConfig{
    $file = (Get-Content "C:\Users\champuser\Downloads\configuration.txt")
    $table += [pscustomobject]@{"Days" = $file[0]; `
                                "ExecutionTime" = $file[1];
                               }
return $table
}


function changeConfig{
    $path = "C:\users\champuser\Downloads\configuration.txt"

    $dayChoice = ""
    while($dayChoice -notmatch "[0-9]{1,3}"){
        $dayChoice = Read-Host "Enter the number of days for which the logs will be obtained: "    
    }
    $bug = (Get-Content -LiteralPath $path)
    $bug[0] = $dayChoice
    Set-Content -LiteralPath $path -Value $bug
    
    $timeChoice = ""
    while($timeChoice -notmatch "[0-9]{1,2}:[0-9]{2} [AP]M"){
        $timeChoice = Read-Host "Enter the daily execution time of the script (add AM or PM): "
    }
    $bug[1] = $timeChoice
    Set-Content -LiteralPath $path -Value $bug
}



$Prompt = "`n"
$Prompt += "1 - Show Configuration`n"
$Prompt += "2 - Change Configuration`n"
$Prompt += "3 - Exit`n"

$loop = $true

while ($loop){
    
    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 3){
        Write-Host "Bye Bye" | Out-String
        exit
        $loop = $false
    }

    if($choice -eq 1){
        showConfig | Out-String
    }

    if($choice -eq 2){
        changeConfig | Out-String
    }
}
