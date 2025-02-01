# Scheduling task
#

# Schedule a script to run daily at 9 AM

$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\Scripts\example.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At "9:00AM"

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "DailyScriptTask"

