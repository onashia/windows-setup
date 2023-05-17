<#
    .SYNOPSIS
        Remove bloatware from system.
    .DESCRIPTION
        This script will uninstall as much bloatware as possible on new retail Windows devices.
#>

function Disable-Installation {
    <#
        .SYNOPSIS
            Disable installation of recommended apps through Microsoft Windows Consumer Experience.
    #>

    $RegistryPath   = 'HKLM:\Software\Policies\Microsoft\Windows\CloudContent'
    $Name           = 'DisableWindowsConsumerFeatures'
    $Value          = '1'
    $Type           = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Disable-Suggestions {
    <#
        .SYNOPSIS
            Disable suggestions in the Start Menu.
    #>

    $RegistryPath   = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'
    $Name           = 'SubscribedContent-338388Enabled'
    $Value          = '0'
    $Type           = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

Write-Host "Removing bloatware and disabling settings which automatically install suggested apps."

# Disable automatic installation of suggested apps.
Write-Host "1) Disabling automatic installation of suggested apps"
Disable-Installation

# Disable suggestions in the Start Menu.
Write-Host "2) Disabling app suggestions in the Start Menu"
# Commented out as this only applies to Windows 10 - Disable-Suggestions

# End of file
Write-Host "`n"