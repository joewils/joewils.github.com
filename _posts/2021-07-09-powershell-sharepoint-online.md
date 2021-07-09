---
layout: post
title: "SharePoint Online PowerShell"
category: links
---

* [Install PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1)
* [Lazy Admin](https://lazyadmin.nl/powershell/restore-recycle-bin-sharepoint-online-with-powershell/)
* [Fix "Unable to find repository" errors](https://dev.to/darksmile92/powershell-disabled-support-for-tls-1-0-for-the-gallery-update-module-and-install-module-broken-1oii)


### Usage Notes:

Install module: 
`Install-Module SharePointPnPPowerShellOnline`

Use web login to connect: 
`Connect-PnpOnline -Url https://contoso.sharepoint.com -UseWebLogin`

Restore files deleted by a specific user: 
`Get-PnPRecycleBinItem -FirstStage | ? DeletedByEmail -eq 'user@contoso.com' | Restore-PnpRecycleBinItem -Force`