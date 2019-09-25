Invoke-Webrequest https://gist.githubusercontent.com/justinsantoro/1625fb0cc49da5acac3d676c84e73b14/raw/34af574429ca805721e5e1186df1e5a1ed79a66b/putty-sessions.reg `
  -OutFile C:\\putty-sessions.reg
reg import C:\\putty-sessions.reg