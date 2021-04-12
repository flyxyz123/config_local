# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# config local only for win10
Function cfgl {
    git --git-dir=G:\ComputerStudy\configs\.mycfg_local\ --work-tree=$HOME\ $args
}

# config cross platform
Function cfgc {
    git --git-dir=G:\ComputerStudy\configs\.mycfg_cross_platform\ --work-tree=$HOME\ $args
}

# https://raw.githubusercontent.com/gokcehan/lf/master/etc/lfcd.ps1
Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
	[Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd.ps1')
	[Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
