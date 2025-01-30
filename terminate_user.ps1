# Install-WindowsFeature -Name RSAT-AD-PowerShell
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Import the Active Directory module
Import-Module ActiveDirectory

# Define user details
$Username = "John.Doe" # Replace with the username to terminate
$TerminatedOU = "OU=TerminatedUsers,DC=example,DC=com" # Replace with your Terminated Users OU
$NewPassword = "Temporary@123!" # Temporary password for the terminated account

# Check if the user exists
$user = Get-ADUser -Filter {SamAccountName -eq $Username} -Properties DistinguishedName

if ($user) {
    # Disable the user account
    Disable-ADAccount -Identity $Username
    Write-Host "User account $Username has been disabled."

    # Reset the user's password
    Set-ADAccountPassword -Identity $Username -Reset -NewPassword (ConvertTo-SecureString $NewPassword -AsPlainText -Force)
    Write-Host "Password for user $Username has been reset."

    # Move the user to the Terminated Users OU
    Move-ADObject -Identity $user.DistinguishedName -TargetPath $TerminatedOU
    Write-Host "User $Username has been moved to the Terminated Users OU."

    # Optional: Remove the user from all groups
    Get-ADUser -Identity $Username -Properties MemberOf | ForEach-Object {
        $_.MemberOf | ForEach-Object {
            Remove-ADGroupMember -Identity $_ -Members $Username -Confirm:$false
        }
    }
    Write-Host "User $Username has been removed from all groups."

    # Optional: Delete the user account (uncomment to enable deletion)
    # Remove-ADUser -Identity $Username -Confirm:$false
    # Write-Host "User $Username has been deleted from Active Directory."
} else {
    Write-Host "User $Username does not exist in Active Directory."
}

