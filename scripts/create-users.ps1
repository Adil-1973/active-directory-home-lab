# Replace the password before running; do not commit real passwords
$password = Read-Host "Enter initial password" -AsSecureString
Import-Csv "$PSScriptRoot\users.csv" | ForEach-Object {
    New-ADUser -Name "$($_.FirstName) $($_.LastName)" `
        -GivenName $_.FirstName -Surname $_.LastName `
        -SamAccountName $_.Username `
        -UserPrincipalName "$($_.Username)@corp.local" `
        -Department $_.Department `
        -Path "OU=$($_.Department),DC=corp,DC=local" `
        -AccountPassword $password `
        -ChangePasswordAtLogon $true -Enabled $true
    Add-ADGroupMember -Identity "$($_.Department)-Staff" -Members $_.Username
}
