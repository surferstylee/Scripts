<#
==============================================================================

File:      SetDefaultApps.ps1
Purpose:   Sets custom default apps for Windows 10.
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

$LocalPath = Split-Path $SCRIPT:MyInvocation.MyCommand.Path -Parent

Start-Transcript $LogFile

Copy-Item -Path "$LocalPath\DefaultApps.xml" -Destination "$env:SystemDrive" -Force

Start-Process -FilePath "cmd.exe" -ArgumentList " /c Dism.exe /online /Import-DefaultAppAssociations:$env:SystemDrive\DefaultApps.xml" -Wait

Remove-Item -Path "$env:SystemDrive\DefaultApps.xml" -Force -Verbose

Stop-Transcript