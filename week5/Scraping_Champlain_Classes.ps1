# Write a powershell function that scrapes the table from the web page and saves the content ot a custom object

function gatherClasses(){

$page = Invoke-WebRequest -Timeout 2 http://10.0.17.8/Courses2025FA.html

$trs=$page.Parsedhtml.body.getElementsbyTagName("tr")

$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){
    
    $tds = $trs[$i].getElementsbyTagName("td")

    $Times = $tds[5].innerText.Split("-")

    $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText;
                                    "Title" = $tds[1].innerText;
                                    "Days" = $tds[4].innerText;
                                    "Time Start" = $Times[0];
                                    "Time End" = $Times[1];
                                    "Instructor" = $tds[6].innerText;
                                    "Location" = $tds[9].innerText; }

}

return $FullTable
}