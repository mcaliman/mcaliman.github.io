---
layout: post
title:  "Errori comuni nella configurazione di Adobe PDF iFilter per SharePoint 2007"
excerpt: ""
category: ComputerScience
date:   2011-04-04 22:45:33
tags: [SharePoint2007]
comments: true
share: true
---

Un errore comune in cui si può incorrere nell'installare iFilter per SharePoint 2007 è quello di dimenticare di sostituire il valore della chiave

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office
server\12.0\Search\Setup\ContentIndexCommon\Filters\Extension\.pdf`
con il nuovo valore per iFilter, per iFilter 9 piattaforma 64 bit e SharePoint 2007 il valore da impostare è


`{E8978DA6-047F-4E3D-9C78-CDBE46041603}`
Un altro errore o problema è rappresentato dalla mancata registrazione corretta della DLL `PDFFilter.dll`
in questo caso si può effettuare una verifica e ovviare al problema tramite `regedt32.exe`
