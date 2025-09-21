# List all of the apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log -tail 5


# List 5 of the apache logs of xampp
#Get-Content C:\xampp\apache\logs\access.log -tail 5


# Display only logs that contain 404 (Not Found) or 400 (Bad Request)
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '


# Display logs that DON'T contain 200 (OK)
#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch


# From every .log file in the directory, only get logs that contain the word "error"
#$A = Get-ChildItem -Path "C:\xampp\apache\logs\*.log" | Select-String -Pattern 'error'
# Display last 5 elements of the result array
#$A[-5..-1]


# Display only IP addresses for 404 (Not Found) records
$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"

$ipsUnorganized = $regex.Matches($notfounds)

$ips = @()
for($i=0;$i -lt $ipsUnorganized.Count;$i++){
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}
#$ips | Where-Object { $_.IP -ilike "10.*" }

# Count the number of times an IP appears
$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | Group-Object IP
$counts | Select-Object Count, Name