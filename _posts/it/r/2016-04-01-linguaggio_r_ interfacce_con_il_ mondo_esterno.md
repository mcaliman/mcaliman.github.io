---
layout: post
lang: it
title:  "Interfacce con il mondo esterno in R"
excerpt: ""
category: R
date:   2016-04-01 22:45:33
tags: [Italian,R]
comments: true
share: true
---


I dati vengono letti tramite interfacce di collegamento . Le connessioni possono essere a file o url per esempio .

* `file`, apre una connessione a un file
* `gzfile`, apre un collegamento ad un file compresso con gzip
* `bzfile`, apre un collegamento ad un file compresso con bzip2
* `url`, apre un collegamento a una pagina web

Per connettersi ad un file

```r
> str(file)
function (description = "", open = "", blocking = TRUE,
encoding = getOption("encoding"))
```

Descrizione è il nome del file open è un codice che indica

* “r” sola lettura
* “w” scrittura (e inizializzazione di un nuovo file)
* “a” append
* “rb”, “wb”, “ab” lettura,scrittura, o append in binary mode (Windows)


In generale, i collegamenti sono strumenti potenti che consentono di navigare file o altri oggetti esterni. 
In pratica, spesso non abbiamo bisogno di trattare con l'interfaccia di collegamento direttamente .

```r
con <- file("foo.txt", "r")
data <- read.csv(con)
close(con)
```

equivale a

```r
data <- read.csv("foo.txt")
```

lettura per righe di un file di testo

```r
con <- gzfile("example.gz")
x <- readLines(con, 10)
```

`writeLines` prende un vettore di caratteri e scrive ciascun elemento  una riga alla volta su un file di testo.
`readLines` può essere utile per la lettura per linee di pagine web

```r
con <- url("http://google.com", "r")
x <- readLines(con)
```


