$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.8/ToBeScraped.html

# Get the link count
#$scraped_page.Links.Count


# Get the links as HTML elements
#$scraped_page.Links


# Get the links and display only the URL and its text
#$scraped_page.Links | Select outerText , href | Format-List

# Get outer text of every element with the tag h2
#$h2s = $scraped_page.Parsedhtml.body.getElementsByTagName("h2") | select outerText
#$h2s


# Print innerText of every div element that has the class as div-1
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { 
    $_.getAttributeNode("class").Value -ilike "div-1"} | select innerText

$divs1
