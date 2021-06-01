# Chocolatey profile by chocolatey
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

Set-Alias -Name ll -Value Get-ChildItem

# config local only for win10
Function cfgl {
    git --git-dir=G:\ComputerStudy\configs\.mycfg_local\ --work-tree=$HOME\ $args
}

# config cross platform
Function cfgc {
    git --git-dir=G:\ComputerStudy\configs\.mycfg_cross_platform\ --work-tree=$HOME\ $args
}

# Add zoxide to PowerShell 
# https://github.com/ajeetdsouza/zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
})

# can't use wildcard and autocomplete for .lnk
# https://superuser.com/a/810991
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

# run scoop-search.exe whenever you use native scoop search
# it causes problem when use winfetch to check number of packages
# https://github.com/shilangyu/scoop-search 
Invoke-Expression (&scoop-search --hook)

Set-PSReadLineOption -EditMode Vi

# https://docs.microsoft.com/en-us/powershell/module/psreadline/set-psreadlineoption?view=powershell-7.1#example-6--use-vimodechangehandler-to-display-vi-mode-changes
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a block.
        Write-Host -NoNewLine "`e[2 q"
    } else {
        # Set the cursor to a line.
        Write-Host -NoNewLine "`e[6 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
