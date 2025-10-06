. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot chromeThingy.ps1)


$Prompt = "`n"
$Prompt += "Choose Below`n"
$Prompt += "1 - Display Last 10 Apache Logs`n"
$Prompt += "2 - Display Last 10 Failed Logins for all Users`n"
$Prompt += "3 - Display at Risk Users`n"
$Prompt += "4 - Start Chrome Web Browser and Navigate to champlain.edu`n"
$Prompt += "5 - Exit`n"


$loop = $true

while ($loop){
    
    Write-Host $Prompt | Out-String
    $choice = Read-Host

    if($choice -eq 5){
        Write-Host "Bye Bye" | Out-String
        exit
        $operation = $false
    }


    elseif($choice -eq 1){
        $loc="C:\xampp\apache\logs\*.log"
        if(Test-Path $loc){
            Get-Content $loc -Tail 10
        }
        else{
            Write-Host "nothin"
        }
    }

    elseif($choice -eq 2){               
        $userLogins = getFailedLogins(100)
        Write-Host ($userLogins | Group-Object -Property User | ForEach-Object { $_.Group | Sort-Object -Property Time -Descending | Select-Object -First 10 } | Format-Table User, Time, Event | Out-String)
    }

    elseif($choice -eq 3){
        $day = Read-Host -Prompt "How many days back into the logs"
        Write-Host "Number of Users with 10 or more failed log ins at $day days"
        badGuys $day
    }

    elseif($choice -eq 4){
        chromeThing
    }

    else{
        Write-Host "Try again"
        $operation = $true
    }

}