---
layout: post
lang: en
title:  "Common errors when configuring Adobe PDF iFilter for SharePoint 2007"
excerpt: ""
category: Miscellaneous
date:   2011-04-04 22:45:33
tags: [SharePoint]
comments: true
share: false
published: true
---
A common mistake you can run into when installing iFilter for SharePoint 2007 is forgetting to replace the value of the key

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office
server\12.0\Search\Setup\ContentIndexCommon\Filters\Extension\.pdf`
```

with the new value for iFilter, for iFilter 9 platform 64 bit and SharePoint 2007 the value to set is


`{E8978DA6-047F-4E3D-9C78-CDBE46041603}`
Another error or problem is that the `PDFFilter.dll` DLL is not registered correctly.
in which case a check can be performed and the problem rectified using `regedt32.exe`.