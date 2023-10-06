---
layout: post
lang: en
title:  "Using Channels to Copy Files in Java"
excerpt: ""
category: programming-languages
date:   2014-11-15 22:45:33
tags: [English,Java]
comments: true
share: true
---
Making a copy of files with Java might have been considered pedantic until a few years ago. We sometimes forget the existence of the new nio package. Some might object that today with Java7 (and of course 8) it is possible to use the `Files` class, which exposes the even simpler copy method. For those who can't use it, a performant and simple solution is given below. Try a few tests to see how it performs with the classic stream-based methods, and you will appreciate the advantages of channels, especially if you are working with large files.

```java
private static void copy(File source, File destination) {
    FileChannel input = null;
    FileChannel output = null;
    try {
        input = new FileInputStream(source).getChannel();
        output = new FileOutputStream(destination).getChannel();
        output.transferFrom(input, 0, input.size());
        input.close();
        output.close();
    } catch (IOException e) {
        logger.log(Level.SEVERE, "", e);
    }
}
```   
