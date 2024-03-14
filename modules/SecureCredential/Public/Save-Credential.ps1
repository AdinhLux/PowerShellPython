# Function to Save Credentials to a file
Function Save-Credential([string]$UserName, [string]$KeyPath)
{
    # Create directory for Key file
    If (!(Test-Path $KeyPath)) {        
        Try {
            New-Item -ItemType Directory -Path $KeyPath -ErrorAction STOP | Out-Null
        }
        Catch {
            Throw $_.Exception.Message
        }
    }
    # Store password encrypted in file
    $Credential = Get-Credential -Message "Enter the Credentials:" -UserName $UserName
    $Credential.Password | ConvertFrom-SecureString | Out-File "$($KeyPath)\$($Credential.Username).cred" -Force
}