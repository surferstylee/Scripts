<#
==============================================================================
File:      SetDesktopIcons.ps1
Purpose:   Adds This PC, Libraries, Control Panel, User Folder, and Network
           icons on the desktop in Windows 10.
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

Start-Transcript $LOGFILE

Function SetIconOnDesktop($RegKey)
{
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name $REGKEY -Value 0 -PropertyType DWORD -Force -Verbose
}

#This PC Icon
SetIconOnDesktop -RegKey '{20D04FE0-3AEA-1069-A2D8-08002B30309D}'

#Libraries Icon
SetIconOnDesktop -RegKey '{031E4825-7B94-4dc3-B131-E946B44C8DD5}'

#Control Panel Icon
SetIconOnDesktop -RegKey '{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}'

#User Folder Icon
SetIconOnDesktop -RegKey '{59031a47-3f72-44a7-89c5-5595fe6b30ee}'

#Network Icon
SetIconOnDesktop -RegKey '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}'

Stop-Transcript