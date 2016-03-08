<#
==============================================================================

File:      DisableConsumerApps.ps1
Purpose:   Disables the installation of Store apps from first login (not provisioned apps).
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

Start-Transcript $LogFile

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name 'DisableWindowsConsumerFeatures' -Value 1 -PropertyType DWORD -Force -Verbose

Stop-Transcript