--- 
layout: post
title: "Controllare i droptime file del nic.it con R"
excerpt: "Controllare in automatico se il dominio che ci interessa sarà disponibile giornata."
category: "Computer Science"
date:   2016-10-01 22:45:33
modified: 2016-10-01 22:45:33
tags: [R]
comments: true
share: true
---

Lo script in questione non è nulla di speciale ma mostra la comodità di utilizzare R quando si tratta di manipolare dati e creare script o prototipi. Scarica i due file droptime file dal nic e verifica se al suo interno è presente il dominio che ci interessa.
Lo script aggiornato è disponibile su github [https://github.com/mcaliman/R-utilities](https://github.com/mcaliman/R-utilities)

{% highlight R %}
# droptime_file_observer.R
# the format of droptime file is yyyymmdd09 and yyyymmdd16 
date <- Sys.Date()
filename1 <- paste0(format(date,format='%Y%m%d'),'09','.txt')
filename2 <- paste0(format(date,format='%Y%m%d'),'16','.txt')
url1<-paste0('http://www.nic.it/droptime/files/',filename1)
url2<-paste0('http://www.nic.it/droptime/files/',filename2)
download.file(url1,filename1)
download.file(url2,filename2)

droptime_file1<-readLines(filename1)
droptime_file2<-readLines(filename2)
domain_to_find <- 'dominiochemiinteressa.it'
if (is.element(domain_to_find, droptime_file1)){
	print('present in droptime file!');
}
if (is.element(domain_to_find, droptime_file2)){
	print('present in droptime file!');
}
{% endhighlight %}

Possiamo personalizzarlo con un invio email al posto della stampa e poi schedulando tutto con cron.

