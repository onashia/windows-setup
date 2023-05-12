<#
    .SYNOPSIS
        Disables annoying default settings in Windows 10 and 11
    .DESCRIPTION
        The functions in this script will disable Suggestions, Tips, and Recommendations in Windows 10 and 11    
#>

function Disable-Welcome {
    <#
        .SYNOPSIS
            Disables the setting "Show the Windows welcome experience after updates and when signed in to show what's new and suggested"
    #>

    $RegistryPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
    $Name         = 'SubscribedContent-310093Enabled'
    $Value        = '0'
    $Type         = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force
}

Disable-Welcome