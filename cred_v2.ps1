Import-Module .\modules\SecureCredential\SecureCredential.psm1

# Folder Path
$path = "C:\Users\adinh\PycharmProjects\scripts"
$user = "Adinh\ADI"

# Get credentials and create an encrypted password file
# Use "whoami"
Save-Credential -UserName $user -KeyPath "$path\keys"

# Get encrypted password from the file
$cred = Get-SavedCredential -UserName $user -KeyPath "$path\keys"

# Display
$cred