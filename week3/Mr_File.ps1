function logs ($dayCount){    
    $loginouts = Get-EventLog system -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$dayCount)

    $loginoutsTable = @() #Empty the array to fill customly
    for($i=0; $i -lt $loginouts.Count; $i++){
        $event = ""
        if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
        if($loginouts[$i].InstanceId -eq "7002") {$event="Logoff"}

        $user = $loginouts[$i].ReplacementStrings[1]

        $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
                                               "id" = $loginouts[$i].InstanceId;
                                            "Event" = $event;
                                             "User" = $user | whoami;
                                             }
    }
    $loginoutsTable
}



#Function to obtain computer start and shut-down times
function shuts ($days){
    $starts = Get-EventLog system -source EventLog -After (Get-Date).AddDays($days) | Where-Object {($_.EventId -eq "6006")}

    $startsTable = @() #Empty the array to fill customly
    for($i=0; $i -lt $starts.Count; $i++){
        $event = ""
        if($starts[$i].EventId -eq "6006") {$event="Shutdown"}
    
        $user = $starts[$i].ReplacementStrings[1]

        $startsTable += [pscustomobject]@{"Time" = $starts[$i].TimeGenerated;
                                            "id" = $starts[$i].EventId;
                                         "Event" = $event;
                                          "User" = "System";
                                          }
    }
    $startsTable
}

function starts($days){
    $starts = Get-EventLog system -source EventLog -After (Get-Date).AddDays($days) | Where-Object {($_.EventId -eq "6005")}

    $startsTable = @() #Empty the array to fill customly
    for($i=0; $i -lt $starts.Count; $i++){
        $event = ""
        if($starts[$i].EventId -eq "6005") {$event="Start"}
    
        $user = $starts[$i].ReplacementStrings[1]

        $startsTable += [pscustomobject]@{"Time" = $starts[$i].TimeGenerated;
                                            "id" = $starts[$i].EventId;
                                         "Event" = $event;
                                          "User" = "System";
                                          }
    }
    $startsTable
}