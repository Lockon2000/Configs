Import-Module LockLib 3>$null


New-Alias -Name sublime     -Value "C:\Program Files\Sublime Text 3\sublime_text.exe"
New-Alias -Name m           -Value more
New-Alias -Name less        -Value more
New-Alias -Name timeit      -Value Measure-Command
New-Alias -Name fullhistory -Value (Get-PSReadLineOption).HistorySavePath


function Prompt {
    Write-Color -Text  $env:username, "@",      ($env:computername+" "), ($ExecutionContext.SessionState.Path.CurrentLocation.ToString()+" "), ((Get-Date -Format g)+"`n") `
                -Color Red,           DarkCyan, Yellow,                  Green,                                                                Cyan
    "PS> "
}
