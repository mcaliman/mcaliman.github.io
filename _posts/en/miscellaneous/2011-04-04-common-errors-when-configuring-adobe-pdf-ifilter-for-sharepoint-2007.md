---
layout: post
title: "Common errors when configuring Adobe PDF iFilter for SharePoint 2007"
excerpt: "Troubleshooting Adobe PDF iFilter configuration issues in SharePoint 2007"
category: Miscellaneous
date: 2011-04-04
comments: true
share: false
modified: 2024-07-11
published: true
tags: [misc, architecture, en, code]
permalink: /miscellaneous/common-errors-when-configuring/
---

A common mistake you may encounter when installing iFilter for SharePoint 2007 is forgetting to replace the value of the key:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office
server\12.0\Search\Setup\ContentIndexCommon\Filters\Extension\.pdf`
```

with the new value for iFilter. For iFilter 9 on a 64-bit platform and SharePoint 2007, the value to set is:

`{E8978DA6-047F-4E3D-9C78-CDBE46041603}`
Another error or problem is that the `PDFFilter.dll` DLL is not registered correctly.
In this case, a check can be performed and the problem rectified using `regedt32.exe`.
