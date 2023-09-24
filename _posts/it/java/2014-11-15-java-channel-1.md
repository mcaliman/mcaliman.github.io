---
layout: post
lang: it
title:  "Usare i Channel per copiare file in Java"
excerpt: ""
category: Java
date:   2014-11-15 22:45:33
tags: [Italian,Java]
comments: true
share: true
---

Parte della disumanità del computer sta nel fatto che, una volta programmato e messo in funzione, si comporta in maniera perfettamente onesta. *(Isaac Asimov, Il vento è cambiato, 1983)*

Effettuare una copia di file con Java poteva essere ritenuto pedante fino a qualche anno fa. A volte ci dimentichiamo dell’esistenza del nuovo package nio. Qualcuno potrebbe obbiettare che oggi con Java7 (ed ovviamente 8) è possibile usare la classe `Files` che espone il metodo copy ancora più semplice. Per chi non potesse utilizzarlo una soluzione performante e semplice è riportata sotto. Provate ad effettuare qualche test per verirficare le performance con i metodi classici basati su Stream e potrete apprezzare i vantaggi dei channel sopratutto se lavorate con file di dimensioni non trascurabili.

{% highlight java %}
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
{% endhighlight %}    
