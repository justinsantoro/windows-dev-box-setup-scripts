
# About this rep

These scripts leverage two popular open source projects.
- Boxstarter [boxstarter.org](http://boxstarter.org)
- Chocolatey [chocolatey.org](http://chocolatey.org)

Boxstarter is a wrapper for Chocolatey and includes features like managing reboots for you. We're using the Boxstarter web launcher to start the installation process:<br/>
https://boxstarter.org/Learn/WebLauncher

## Project structure
The script code is organized in a hierarchy

**Recipes**
A recipe is the script you run on a fresh install.  It calls multiple helper scripts.  These currently live in the root of the project (full_dev_environment.ps1, etc.) 

**Helper Scripts**: A helper script performs setup routines that may be useful by many recipes. Recipes call helper scripts.  The helper scripts live in the **scripts** folder. Once you have Boxstarter installed you can run a helper script directly like so:
`Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/justinsantoro/windows-dev-box-setup-scripts/gb/scripts/VisualStudio.ps1`

## You may want to customize the scripts
*Note: The one-click links use the following format.  When working out of a different Fork or Branch you'll want to update the links as follows:*

`http://boxstarter.org/package/url?https://raw.githubusercontent.com/{{GITHUB_DOMAIN}}/windows-dev-box-setup-scripts/{{YOUR_BRANCH}}/{{RECIPE_NAME.ps1}}
`

## How to run the scripts

To run a recipe script, click a link in the table below from your target machine using Edge. This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). On start it will ask you to type your user password so that it can automatically login after a reboot. You can then leave the job unattended and come back when it's finished.

|Click link to run  |Description  |
|---------|---------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/justinsantoro/windows-dev-box-setup-scripts/gb/full_dev_environment.ps1'>Full Env</a>     | Most everything needed to facilidate development, administration, and design excluding (unfortunately) MSOffice. Will initialize configs for TortoiseHg and PuTTy. Only manual step required to start cloning remote repos is to point puTTy to your SSH Key. |


**Notes:**  
1. If you are using WSL there's a followup step after running the setup script.  When the script finishes you will only have a root user with a blank password. You should  manually create a non-root user via `$ sudo adduser [USERNAME] sudo` 
with a non-blank password. Use this user going forward. For more info on WSL refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).

## Known issues
- The Boxstarter ClickOnce installer does not work when using Chrome.  This issue is being tracked [here](https://github.com/chocolatey/boxstarter/issues/345). Use Edge to run the ClickOnce installer.
- Reboot is not always logging you back in to resume the script.  This is being tracked [here](https://github.com/chocolatey/boxstarter/issues/318).  The workaround is to login manually and the script will continue running. 
- There have been reports of Windows 1803 not successfully launching Boxstarter via the web launcher. See this issue for details: https://github.com/chocolatey/boxstarter/issues/301
