Invoke-Webrequest https://gist.githubusercontent.com/justinsantoro/322b09af6ad525c9c1a9bc6171a655e2/raw/85f10cf2bedfcbf802d2dc842e9c89597e64debf/SQLServerConfigurationFile.ini `
  -OutFile C:\sqlconfig.ini

choco install -y choco install sql-server-2017 --params "'/ConfigurationFile:C:\sqlconfig.ini'"
choco install -y sql-server-management-studio
