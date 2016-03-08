<#
==============================================================================

File:      DisableWifiSense.ps1
Purpose:   Disables Wifi Sense on Windows 10 (1511).
Author:    Frank Trout

This script is provided "AS IS" with no warranties, confers no rights and 
is not supported by the authors. 

==============================================================================
#>

# // Load TS Environment

$TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment
$LogPath = $TSEnv.Value("LogPath")
$LogFile = "$LogPth\$($myInvocation.MyCommand).log"

# // Main

$RegPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"

Start-Transcript $LogFile

New-ItemProperty -Path $RegPath -Name 'AutoConnectAllowedOEM' -Value 0 -PropertyType DWORD -Force -Verbose

Stop-Transcript