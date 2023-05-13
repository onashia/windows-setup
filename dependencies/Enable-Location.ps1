<#
    .SYNOPSIS
        Verify that location settings are enabled.
    .DESCRIPTION
        This script will verify that the location settings are enabled for the System, User, and Weather app.
#>

function Enable-SystemLocation {
    <#
        .SYNOPSIS
            Enable "location services" setting.
    #>

    $RegistryPath   = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location'
    $Name           = 'Value'
    $Value          = 'Allow'
    $Type           = 'String'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Enable-UserLocation {
    <#
        .SYNOPSIS
            Enable "let apps access your location" setting.
    #>

    $RegistryPath   = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location'
    $Name           = 'Value'
    $Value          = 'Allow'
    $Type           = 'String'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Enable-WeatherLocation {
    <#
        .SYNOPSIS
            Enable location services for the Microsoft Weather app.
    #>

    $RegistryPath   = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\Microsoft.BingWeather_8wekyb3d8bbwe'
    $Name           = 'Value'
    $Value          = 'Allow'
    $Type           = 'String'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

Write-Host "Enable settings in Windows for location services and ensure Weather app is using current location.`n"

# Enable location services on system.
Write-Host "1) Enabling location services.""
Enable-SystemLocation

# Enable app access to location
Write-Host "2) Allowing apps access to location.""
Enable-UserLocation

# Enable location for Microsoft Weather
Write-Host "3) Allowing access to location for Weather app"
Enable-WeatherLocation

# End of file
Write-Host "`n"