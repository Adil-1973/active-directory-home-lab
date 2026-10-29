$base = "DC=corp,DC=local"
"IT","HR","Sales","Finance","Computers","Groups" | ForEach-Object {
    New-ADOrganizationalUnit -Name $_ -Path $base
}
"IT-Staff","HR-Staff","Sales-Staff","Finance-Staff" | ForEach-Object {
    New-ADGroup -Name $_ -GroupScope Global -GroupCategory Security -Path "OU=Groups,$base"
}
