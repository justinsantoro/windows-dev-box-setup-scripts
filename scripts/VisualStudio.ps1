choco install -y visualstudio2019community --package-parameters="'--add Microsoft.VisualStudio.Component.Git --add Microsoft.VisualStudio.Web.Mvc4.ComponentGroup'"
Update-SessionEnvironment #refreshing env due to Git install
choco install -y visualstudio2019-workload-python
choco install -y visualstudio2019-workload-manageddesktop
choco install -y visualstudio2019-workload-netcoretools
choco install -y visualstudio2019-workload-netweb