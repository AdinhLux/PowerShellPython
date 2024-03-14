# For Powershell 7
# Import-Module PSScheduledJob -SkipEditionCheck
Import-Module .\modules\SecureCredential\SecureCredential.psm1

# Folder Path
$path = "C:\Users\adinh\PycharmProjects\scripts"
$user = "Adinh\ADI"

# Get encrypted password from the file
$cred = Get-SavedCredential -UserName $user -KeyPath "$path\keys"

# A job trigger starts a scheduled job. The options : -Once -Weekly -Daily -AtLogOn -AtStartUp
$trigger = New-JobTrigger -Once -At 13:53

# Options are the conditions that may be required for the job to run, controlled through the New-ScheduledJobOption cmdlet.
# These are choices such as RUNELEVATED or STARTIFONBATTERY or REQUIRENETWORK.
$opt = New-ScheduledJobOption -RunElevated

# Create scheduled job
Register-ScheduledJob -Name PC-rebooting -Trigger $trigger -Credential $cred -FilePath "$path\scheduled_job.ps1" -ScheduledJobOption $opt


# Get-ScheduledJob
# Get-Job
# Unregister-ScheduledJob -Id 4