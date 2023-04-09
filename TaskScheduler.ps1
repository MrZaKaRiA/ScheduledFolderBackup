$trigger = New-ScheduledTaskTrigger -Daily -At "18:00"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\Scripts\backup.ps1"
Register-ScheduledTask -TaskName "Daily Backup" -Trigger $trigger -Action $action -User "Username" -Password "Password"
