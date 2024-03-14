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