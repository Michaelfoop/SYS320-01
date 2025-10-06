. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - List Enabled Users`n"
$Prompt += "2 - List Disabled Users`n"
$Prompt += "3 - Create a User`n"
$Prompt += "4 - Remove a User`n"
$Prompt += "5 - Enable a User`n"
$Prompt += "6 - Disable a User`n"
$Prompt += "7 - Get Log-In Logs`n"
$Prompt += "8 - Get Failed Log-In Logs`n"
$Prompt += "9 - List at Risk Users`n"
$Prompt += "10 - Exit`n"



$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 10){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        $enabledUsers = getEnabledUsers
        Write-Host ($enabledUsers | Format-Table | Out-String)
    }

    elseif($choice -eq 2){
        $notEnabledUsers = getNotEnabledUsers
        Write-Host ($notEnabledUsers | Format-Table | Out-String)
    }


    # Create a user
    elseif($choice -eq 3){ 

        $name = Read-Host -Prompt "Please enter the username for the new user"
        $password = Read-Host -AsSecureString -Prompt "Please enter the password for the new user"

        #ToDo list done


        createAUser $name $password

        Write-Host "User: $name is created." | Out-String
    }


    # Remove a user
    elseif($choice -eq 4){

        $name = Read-Host -Prompt "Please enter the username for the user to be removed"

        # TODO: Check the given username with the checkUser function.        DONE
        
        $thing = checkUser($name)
        
        if ($thing -eq $false){
            Write-Host "User: $name is not a real user"
        }
        else{
            removeAUser $name
            Write-Host "User: $name Removed." | Out-String
        }
    }


    # Enable a user
    elseif($choice -eq 5){


        $name = Read-Host -Prompt "Please enter the username for the user to be enabled"

        # TODO: Check the given username with the checkUser function.        DONE
        
        $thing = checkUser($name)
        
        if ($thing -eq $false){
            Write-Host "User: $name is not a real user"
        }
        else{
            enableAUser $name
            Write-Host "User: $name Enabled." | Out-String
        }
    }


    # Disable a user
    elseif($choice -eq 6){

        $name = Read-Host -Prompt "Please enter the username for the user to be disabled"

        # TODO: Check the given username with the checkUser function.        DONE
        
        $thing = checkUser($name)
        
        if ($thing -eq $false){
            Write-Host "User: $name is not a real user"
        }
        else{
            disableAUser $name
            Write-Host "User: $name Disabled." | Out-String
        }
    
    }



    elseif($choice -eq 7){

        $name = Read-Host -Prompt "Please enter the username for the user logs"

        # TODO: Check the given username with the checkUser function.
        $thing = checkUser($name)

        if($thing -eq $false){
            Write-Host "User: $name is not a real user"
        }

        else{
            $day = Read-Host -Prompt "How many days back"
            $userLogins = getLogInAndOffs $day
        }
        # TODO: Change the above line in a way that, the days 90 should be taken from the user

        Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
    }
    #DONE


    elseif($choice -eq 8){

        $name = Read-Host -Prompt "Please enter the username for the user's failed login logs"

        # TODO: Check the given username with the checkUser function.
        $thing = checkUser($name)

        if($thing -eq $false){
            Write-Host "User: $name is not a real user"
        }

        else{
            $day = Read-Host -Prompt "How many days back"
            $userLogins = getFailedLogins $day
        }
        # TODO: Change the above line in a way that, the days 90 should be taken from the user

        Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
    }
    #DONE


    elseif($choice -eq 9){
        $day = Read-Host -Prompt "How many days back into the logs"
        Write-Host "Number of Users with 10 or more failed log ins at $day days"
        badGuys $day
    }


    # TODO: If user enters anything other than listed choices, e.g. a number that is not in the menu   
    #       or a character that should not be accepted. Give a proper message to the user and prompt again.
    else{
        Write-Host "Wrong Choice you are SSTUPID !!!!!!"
        $operation = $true
        
    }

}




