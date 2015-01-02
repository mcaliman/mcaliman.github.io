---
layout: post
title:  "Linux: il comando du"
category: articles
date:   2007-01-01 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Linux]
comments: true
share: true
---


il comando "du" mostra lo spazio disco usato.
Uso:
du -s -h .
Dove:
"-s" indica --summarise display only a total for each argument.
"-h" indica --human-readable print sizes in human readable format (e.g., 1K 234M 2G).
"." indica di applicare alla directory corrente.
Esempio:
mcaliman@deimos:~# du -s -h .

537M .
