function Show-Menu {
    param (
        [string]$Title = 'CottonCandy PS Designed by Aidan Patrick Marias'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1. Show Disabled Features"
    Write-Host "2: Enable Basic Admin Tools"
    Write-Host "3: Press '3' for this option."
    Write-Host "Q: Press 'Q' to quit."
}
do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
    Get-WindowsOptionalFeature –Online | Where-Object {$_. State –eq “Disabled”} 
    } '2' {
    Enable-WindowsOptionalFeature –FeatureName "Windows-Defender-ApplicationGuard" -All -Online
    Enable-WindowsOptionalFeature –FeatureName "Name" -All -Online 
    } '3' {
      'You chose option #3'
    }
    }
    pause
 }
 until ($selection -eq 'q')
