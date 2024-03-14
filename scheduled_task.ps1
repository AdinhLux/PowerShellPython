# For Powershell 7
# Import-Module PSScheduledJob -SkipEditionCheck
Import-Module .\modules\SecureCredential\SecureCredential.psm1

# Folder Path
$path = "C:\Users\adinh\PycharmProjects\scripts"
$pythonPath = "C:\Users\adinh\.pyenv\pyenv-win\versions\3.12.2\python.exe"
$user = "Adinh\ADI"

# Get encrypted password from the file
$cred = Get-SavedCredential -UserName $user -KeyPath "$path\keys"


$action = New-ScheduledTaskAction -Execute $pythonPath -Argument "$path\reboot.py"
$trigger = New-ScheduledTaskTrigger -Once -At 2:27pm
$trigger.StartBoundary = [DateTime]::Parse($trigger.StartBoundary).ToLocalTime().ToString("s")
$settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit 0
$Password = $cred.GetNetworkCredential().Password

Register-ScheduledTask -Action $action -Trigger $trigger -Settings $settings -TaskName "Reboot computer" -Description "Rebooting with a Python script" -User $cred.UserName -Password $Password