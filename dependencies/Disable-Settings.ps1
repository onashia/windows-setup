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

    $RegistryPath   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
    $Name           = 'SubscribedContent-310093Enabled'
    $Value          = '0'
    $Type           = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force
}

function Disable-Suggestions {
    <#
        .SYNOPSIS
            Disable the setting "Suggest ways to get the most out of Windows and finish setting up this device"
    #>

    $RegistryPath   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement'
    $Name           = 'ScoobeSystemSettingEnabled'
    $Value          = '0'
    $Type           = 'DWORD'

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force
}

Disable-Welcome
Disable-Suggestions
