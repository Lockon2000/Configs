Import-Module posh-git
Import-Module oh-my-posh

Import-Module LockLib


Set-Theme Paradox
Set-PSReadLineOption -EditMode Emacs

New-Alias -Name sublime             -Value "C:\Program Files\Sublime Text 3\sublime_text.exe"
New-Alias -Name m                   -Value more
New-Alias -Name less                -Value more
New-Alias -Name timeit              -Value Measure-Command
New-Alias -Name View-FullHistory    -Value (Get-PSReadLineOption).HistorySavePath
