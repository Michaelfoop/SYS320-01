#challenge 1
function C1(){
    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.47/IOC.html

    $trs = $page.Parsedhtml.body.getElementsbyTagName("tr")

    $table = @()
    for($i=1; $i -lt $trs.length; $i++){
        $tds = $trs[$i].getElementsbyTagName("td")
        $table += [pscustomobject]@{"Pattern"=$tds[0].innerText;
                                    "Description"=$tds[1].innerText;}
    }
    return $table
}
#C1

#challenge 2
function C2(){
    $file = Get-Content C:\Users\champuser\Documents\access.log

    $table = @()
    for($i=1; $i -lt $file.Count; $i++){
        $stuff = $file[$i].Split(" ")
        $table += [pscustomobject]@{"IP"=$stuff[0];
                                    "Time"=$stuff[3].Trim('[');
                                    "Method"=$stuff[5].Trim('"');
                                    "Page"=$stuff[6];
                                    "Protocol"=$stuff[7];
                                    "Response"=$stuff[8];
                                    "Referrer"=$stuff[10];}
    }
    return $table
}
#C2 | Format-Table -AutoSize -Wrap


#challenge 3
function C3($log, $ind){
    $word = $ind | Select-Object "Pattern"

    $table = @()
    for ($i = 0; $i -lt $log.Length; $i++){
        $kellog = $log[$i].Page
        for ($j = 0; $j -lt $ind.Length; $j++){
            $indiana = $word.Pattern[$j]
            $logged = $kellog | Select-String $indiana
            if($logged){
                $table += [pscustomobject]@{"IP"=$log.IP[$i];
                                            "Time"=$log.Time[$i];
                                            "Method"=$log.Mathod[$i];
                                            "Page"=$log.Page[$i];
                                            "Protocol"=$log.Protocol[$i];
                                            "Response"=$log.Response[$i];
                                            "Referrer"=$log.Referrer[$i];}
            }
        }
    }
    return $table | Sort-Object -Property Page -Unique
}

$one = C2
$two = C1

$thug = C3 $one $two

$thug | Format-Table -AutoSize


