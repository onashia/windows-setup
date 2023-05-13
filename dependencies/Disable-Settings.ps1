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

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
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

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Disable-Tips {
    <#
        .SYNOPSIS
            Disable the setting "Get tips and suggestions when I use Windows"
    #>

    $RegistryPath   = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
    $Name           = 'SubscribedContent-338389Enabled'
    $Value          = '0'
    $Type           = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

Write-Host "Disabling common Windows settings which causes advertisement and unwanted notifications`n"

# Disable Windows welcome experience
Write-Host "1) Disabling Windows welcome experience."
Disable-Welcome

# Disable suggestions on device setup
Write-Host "2) Disabling suggestions on device setup."
Disable-Suggestions

# Disable tips and suggestions
Write-Host "3) Disabling tips and suggestions in Windows."
Disable-Tips

# End of file
Write-Host "`n"
