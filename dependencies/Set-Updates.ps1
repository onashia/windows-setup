<#
    .SYNOPSIS
        Configure Windows Update settings.
    .DESCRIPTION
        Configure the Windows Update settings to download all Microsoft Updates, and installation times.
#>

function Set-MicrosoftUpdates {
    <#
    .SYNOPSIS
        Turn on "Receive updates for other Microsoft products when your update Windows".
    #>

    $ServiceManager = New-Object -ComObject Microsoft.Update.ServiceManager
    $ServiceManager.ClientApplicationID = "My App"
    $NewUpdateService = $ServiceManager.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")
}

Write-Host "Adjusting Windows Update settings."

# Enable updates for Microsoft products
Write-Host "1) Enable updates for other Microsoft products when updating Windows."
Set-MicrosoftUpdates

# End of file
Write-Host "`n"