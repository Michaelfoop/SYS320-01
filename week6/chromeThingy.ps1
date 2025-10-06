function chromeThing{
    if (Get-Process -Name chrome -ErrorAction SilentlyContinue){
        Stop-Process -Name chrome -Force
        }
        else{
            Start-Process chrome "https://www.champlain.edu"
        }
}