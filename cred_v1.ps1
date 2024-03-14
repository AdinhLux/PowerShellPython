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
 

# ----------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------


# Function to get credentials from a Saved file
Function Get-SavedCredential([string]$UserName,[string]$KeyPath)
{
    If(Test-Path "$($KeyPath)\$($Username).cred") {
        $SecureString = Get-Content "$($KeyPath)\$($Username).cred" | ConvertTo-SecureString
        $Credential = New-Object System.Management.Automation.PSCredential -ArgumentList $Username, $SecureString
    }
    Else {
        Throw "Unable to locate a credential for $($Username)"
    }
    Return $Credential
}
  

# ----------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------

# Folder Path
$path = "C:\Users\adinh\PycharmProjects\scripts"
$user = "Administrator"

# Get credentials and create an encrypted password file
# Use "whoami"
Save-Credential -UserName $user -KeyPath "$path\keys"

# Get encrypted password from the file
$cred = Get-SavedCredential -UserName $user -KeyPath "$path\keys"

# Display
$cred