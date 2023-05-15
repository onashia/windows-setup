<#
    .SYNOPSIS
        Verify that automatic date and time are set.
    .DESCRIPTION
        This script will verify that the settings for automatic date, time, and time-zone are enabled.
#>

function Enable-Time {
    <#
        .SYNOPSIS
            Enable "set the time automatically" setting.
    #>

    $RegistryPath   = 'HKLM:\SYSTEM\CurrentControlSet\Services\W32Time\Parameters'
    $Name           = 'Type'
    $Value          = 'NTP'
    $Type           = 'String'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Enable-Daylight {
    <#
        .SYNOPSIS
            Enable "adjust for daylight saving time automatically" setting.
    #>

    $RegistryPath   = 'HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation'
    $Name           = 'DynamicDaylightTimeDisabled'
    $Value          = '0'
    $Type           = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Enable-TimeZone {
    <#
        .SYNOPSIS
            Enable "set the time zone automatically" setting.
    #>

    $RegistryPath   = 'HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate'
    $Name           = 'Start'
    $Value          = '3'
    $Type           = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

Write-Host "Enable settings to set the time and date automatically.`n"

Write-Host "1) Enabling automatic time."
Enable-Time

Write-Host "2) Enabling automatic daylight saving time detection."
Enable-Daylight

Write-Host "3) Enabling automic time zone detection."
Enable-TimeZone

# End of file
Write-Host "`n"