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

# https://github.com/ajeetdsouza/zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})

# https://superuser.com/a/810991
# can't use wildcard and autocomplete for .lnk
remove-item alias:cd -force
function cd($target)
{
    if($target.EndsWith(".lnk"))
    {
        $sh = new-object -com wscript.shell
		$fullpath = (resolve-path $target).Path
		#$fullpath = resolve-path $target
        $targetpath = $sh.CreateShortcut($fullpath).TargetPath
        set-location $targetpath
    }
    else {
        set-location $target
    }
}
