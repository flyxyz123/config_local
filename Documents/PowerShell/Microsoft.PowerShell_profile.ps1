# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# config local only for win10
Function configl {
    git --git-dir=G:\ComputerStudy\configs\config_local\ --work-tree=$HOME\ $args
}

# config cross platform
Function configc {
    git --git-dir=G:\ComputerStudy\configs\config_cross_platform\ --work-tree=$HOME\ $args
}
