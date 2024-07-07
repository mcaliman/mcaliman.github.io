--- 
layout: post
lang: en
title: "Checking nic.it droptime files with R"
excerpt: ""
category: R 
tags: ["R","Programming Languages"]
date:   2016-10-01 22:45:33
modified: 2016-10-01 22:45:33
comments: false
share: false
published: true
---

The script in question is nothing special but shows the convenience of using R when it comes to manipulating data and creating scripts or prototypes. Download the two droptime files from the nic and check whether it contains the domain we are interested in.
The updated script is available on github [https://github.com/mcaliman/R-utilities](https://github.com/mcaliman/R-utilities)

```r
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
```
We can customise it by emailing instead of printing and then scheduling everything with cron.
