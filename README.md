# PowerShell Backup Script

This PowerShell script is designed to create a daily backup of a source folder and save it to a destination folder that is already linked to a cloud backup solution. The script creates a new folder for each backup with the current date and time as the folder name, making it easy to manage and organize your backups.

# Usage

To use this script, you will need to modify the following variables:

$sourceFolder: The path to the folder that you want to backup.
$destinationFolder: The path to the folder that is linked to your cloud backup solution.
Once you have updated these variables with the correct paths, you can save the script as a ".ps1" file and run it in PowerShell. You can also schedule the script to run automatically using Task Scheduler.

``` powershell
$sourceFolder = "C:\SourceFolder"
$destinationFolder = "C:\DestinationFolder"

$date = Get-Date -Format "yyyy-MM-dd"
$newFolder = Join-Path $destinationFolder $date

New-Item -ItemType Directory -Force -Path $newFolder

Copy-Item -Path $sourceFolder\* -Destination $newFolder -Recurse -Force

```

By default, the script is set to run every day at 18:00. If you want to change the scheduling settings, you can modify the $trigger variable in the script.

``` powershell
$trigger = New-ScheduledTaskTrigger -Daily -At "18:00"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\Scripts\backup.ps1"
Register-ScheduledTask -TaskName "Daily Backup" -Trigger $trigger -Action $action -User "Username" -Password "Password"

```

# Note

If you get a "command not found" error when you try to run a PowerShell script, it may be because the script execution policy is set to "Restricted" on your machine. This policy prevents any PowerShell scripts from running on the system.

To change the script execution policy to allow PowerShell scripts to run, follow these steps:

Open PowerShell as an administrator.
Type 
``` powershell
Set-ExecutionPolicy RemoteSigned

```

and press Enter. This command will allow PowerShell scripts to run, but only if they are signed by a trusted publisher.
Type "Y" and press Enter to confirm the change.
Now, you should be able to run your PowerShell script by navigating to the directory where the script is located and typing its name (including the .ps1 extension) in the PowerShell console. For example:

``` powershell

cd C:\Scripts
.\backup.ps1

```

# Requirements

This script requires Windows Operating System and PowerShell to be installed on your system. It also requires the execution policy to be set to either "RemoteSigned" or "Unrestricted" in order to run the script.

# License

This script is licensed under the MIT License. You are free to use, modify, and distribute the script as you see fit, but please refer to the LICENSE file for more details.

# Contributing

If you find any issues with this script or have any suggestions for improvement, please feel free to open an issue or submit a pull request on GitHub. Your contributions are welcome and appreciated!
