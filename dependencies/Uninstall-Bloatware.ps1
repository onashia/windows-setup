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

function Uninstall-MicrosoftBloatware {
    <#
        .SYNOPSIS
            Remove bloatware pre-installed by Microsoft.
    #>

    # Windows 10 and 11 AppX bloatware
    $Bloatware = @(

        # Utilities
        "*EclipseManager*"
        "*AdobePhotoshopExpress*"
        "*Duolingo-LearnLanguagesforFree*"
        "*PandoraMediaInc*"
        "*Wunderlist*"
        "*Flipboard*"
        "*Spotify*"
        "*Disney*"
        "*Clipchamp*"
        "*Netflix*"
        "*DolbyAccess*"
        "*DropboxOEM*"
        "*McAfeeSecurity*"

        # Games
        "*MicrosoftSolitaireCollection*"
        "*CandyCrush*"
        "*BubbleWitch3Saga*"
        "*Minecraft*"
        "*Royal Revolt*"

        # Social Media
        "*SkypeApp*"
        "*Twitter*"
        "*Facebook*"
        "*LinkedIn*"

        # Shopping
        "*eBay*"
        "*Amazon*"
        "*Booking*"
    )

    # Uninstall the apps
    foreach ($Bloat in $Bloatware) {
        if (Get-AppxPackage -allusers -Name $Bloat) {
            Write-Host "- Attempting to remove $Bloat."
            Get-AppxPackage -allusers -Name $Bloat | Remove-AppxPackage -allusers
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        }
    }
}

function Uninstall-HPBloatware {
    <#
        .SYNOPSIS
            Remove bloatware pre-installed by HP.
    #>

    # Windows 10 and 11 AppX bloatware
    $Bloatware = @(

        # Utilities
        "*AMZNMobileLLC*"
        "*myHP*"

        # Games
        "*RandomSaladGamesLLC*"

        # Social Media
        

        # Shopping
      

    )

    # Uninstall the apps
    foreach ($Bloat in $Bloatware) {
        if (Get-AppxPackage -allusers -Name $Bloat) {
            Write-Host "- Attempting to remove $Bloat."
            Get-AppxPackage -allusers -Name $Bloat | Remove-AppxPackage -allusers
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        }
    }
}

function Uninstall-LenovoBloatware {
    <#
        .SYNOPSIS
            Remove bloatware pre-installed by Lenovo.
    #>

    # Windows 10 and 11 AppX bloatware
    $Bloatware = @(

        # Utilities
        "*McAfeeSecurity*"
        "*AMZNMobileLLC*"

        # Games
        

        # Social Media
        

        # Shopping
      

    )

    # Uninstall the apps
    foreach ($Bloat in $Bloatware) {
        if (Get-AppxPackage -allusers -Name $Bloat) {
            Write-Host "- Attempting to remove $Bloat."
            Get-AppxPackage -allusers -Name $Bloat | Remove-AppxPackage -allusers
            Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        }
    }
}

Write-Host "Removing bloatware and disabling settings which automatically install suggested apps."

# Disable automatic installation of suggested apps.
Write-Host "1) Disabling automatic installation of suggested apps."
Disable-Installation

# Disable suggestions in the Start Menu.
Write-Host "2) Disabling app suggestions in the Start Menu."
# Commented out as this only applies to Windows 10 - Disable-Suggestions

# Remove Microsoft provided bloatware
Write-Host "3) Uninstalling Microsoft provided bloatware."
Uninstall-MicrosoftBloatware

# End of file
Write-Host "`n"