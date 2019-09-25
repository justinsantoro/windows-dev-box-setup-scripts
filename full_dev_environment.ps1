# Description: Boxstarter Script
# Author: Microsoft
# Common dev settings for desktop app development

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "Browsers.ps1";
executeScript "CommonDevTools.ps1";
executeScript "AdminTools.ps1";
executeScript "GraphicTools.ps1";
executeScript "Docker.ps1";
executeScript "VisualStudio.ps1";
executeScript "SqlServer.ps1";

#--- Init specific program configs ---#
executeScript "LoadPuttySessions"
executeScript "InitTortoiseHgSettings"

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula