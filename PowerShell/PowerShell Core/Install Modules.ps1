# To elevate the session if needed in a script
$CurrentlyAdmin = (New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
If (-Not $CurrentlyAdmin)
{
    # Get the path to the currently running PowerShell version
    $Path = (Get-Process -id $PID | Get-Item | Select -ExpandProperty Fullname)

    Start-Process $Path -Verb runAs -ArgumentList "-NoLogo -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    Exit
}


Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Pause