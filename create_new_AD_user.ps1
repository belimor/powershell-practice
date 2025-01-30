# Install RSAT Tools:

# On Windows 10/11 or Windows Server, install RSAT: Active Directory module:
# Install-WindowsFeature -Name RSAT-AD-PowerShell

# Ensure the script execution policy allows running scripts:
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Import the Active Directory module
Import-Module ActiveDirectory

# Define the user's details
$FirstName = "John"
$LastName = "Doe"
$Username = "$FirstName.$LastName"
$Password = "P@ssw0rd!" # Change this to a secure password
$OU = "OU=Users,DC=example,DC=com" # Organizational Unit (Change as per your AD structure)
$DisplayName = "$FirstName $LastName"
$Email = "$Username@example.com"

# Check if the user already exists
if (Get-ADUser -Filter {SamAccountName -eq $Username} -ErrorAction SilentlyContinue) {
    Write-Host "User $Username already exists in Active Directory."
} else {
    # Create the new user
    New-ADUser -SamAccountName $Username `
               -UserPrincipalName $Email `
               -Name $DisplayName `
               -GivenName $FirstName `
               -Surname $LastName `
               -DisplayName $DisplayName `
               -Path $OU `
               -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
               -Enabled $true `
               -PasswordNeverExpires $false `
               -ChangePasswordAtLogon $true

    Write-Host "User $Username has been created successfully in Active Directory."
}


