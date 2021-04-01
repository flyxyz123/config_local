# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

Function config {
    git --git-dir=G:\ComputerStudy\configs\.myconfigs\ --work-tree=$HOME\ $args
}
