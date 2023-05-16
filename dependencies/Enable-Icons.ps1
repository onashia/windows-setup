<#
    .SYNOPSIS
        Enable common icons on the Desktop.
    .DESCRIPTION
        This script will place icons for This PC, Recycle Bin, and Control Panel on the users Desktop.
#>

function Enable-ThisPC {
    <#
        .SYNOPSIS
            Enable a Desktop icon for "This PC" setting.
    #>

    $PanelRegistryPath  = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'
    $ManuRegistryPath   = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu'
    $Name               = '{20D04FE0-3AEA-1069-A2D8-08002B30309D}'
    $Value              = '0'
    $Type               = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $PanelRegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
    New-ItemProperty -Path $ManuRegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Enable-Recycle {
    <#
        .SYNOPSIS
            Enable a Desktop icon for "Recycle Bin" setting.
    #>

    $PanelRegistryPath  = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'
    $ManuRegistryPath   = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu'
    $Name               = '{645FF040-5081-101B-9F08-00AA002F954E}'
    $Value              = '0'
    $Type               = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $PanelRegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
    New-ItemProperty -Path $ManuRegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

function Enable-Control {
    <#
        .SYNOPSIS
            Enable a Desktop icon for "Recycle Bin" setting.
    #>

    $PanelRegistryPath  = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'
    $ManuRegistryPath   = 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu'
    $Name               = '{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}'
    $Value              = '0'
    $Type               = 'DWORD'

    if (-NOT (Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
    }

    New-ItemProperty -Path $PanelRegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
    New-ItemProperty -Path $ManuRegistryPath -Name $Name -Value $Value -PropertyType $Type -Force | Out-Null
}

Write-Host "Show common icons on the Desktop."

Write-Host "1) Enable shortcut for This PC"
Enable-ThisPC

Write-Host "2) Enable shortcut for Recycle Bin"
Enable-Recycle

Write-Host "3) Enable shortcut for Control Panel"
Enable-Control