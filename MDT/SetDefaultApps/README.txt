MDT Customization Pack
Script: SetDefaultApps.ps1

**************************************************
*** Instructions
**************************************************

1. From a reference Windows 10 machine, customize the default apps from Settings => System => Default Apps

2. Launch Command Prompt as an administrator and run: Dism.exe /online /Export-DefaultAppAssociations:C:\DefaultApps.xml

3. Copy C:\DefaultApps.xml to the root of this script directory

4. Add a step to your image creation or deployment task sequence in the State Restore phase to execute the script



 