---
layout: post
title:  "Concatenare PDF con iText in Java"
category: articles
date:   2014-09-18 22:45:33
tags: [Java,JDK7,iText,PDF]
comments: false
share: true
---


iText è sicuramente la libreria più diffusa e completa per l’elaborazione di file pdf, consiglio vivamente di darci un occhiata prima di valutare altri framework o reinventare l’acqua calda.

Ma veniamo al sodo,vi riporto sotto il codice di una classe che permette di fondere una serie di PDF insieme, di fatto si tratta di concatenare una serie di file e crearne uno risultante dal processo.

{% highlight java %}
public class ConcatDocumentCommand {


    private final static Logger logger = Logger.getLogger(ConcatDocumentCommand.class.getName());


    private final List<String> list;
    private final String outputFilename;


    public ConcatDocumentCommand(String outputFilename) {
        this.outputFilename = outputFilename;
        this.list = new ArrayList<>();
    }


    public void add(String file) {
        this.list.add(file);
    }


    public void execute() {
        try {
            Document document = new Document();
            PdfCopy copy = new PdfCopy(document, new FileOutputStream(this.outputFilename));
            document.open();
            PdfReader reader;
            int pagesNumber;
            for (String file : this.list) {
                reader = new PdfReader(file);
                pagesNumber = reader.getNumberOfPages();
                for (int page = 0; page < pagesNumber;) {
                    copy.addPage(copy.getImportedPage(reader, ++page));
                }
            }
            document.close();
            copy.close();
        } catch (DocumentException | IOException e) {
            logger.log(Level.SEVERE, "", e);
        }
    }


    public static void main(String[] args) {
        ConcatDocumentCommand c = new ConcatDocumentCommand("/test/test1_concat_test2.pdf");
        c.add("/tmp/test1.pdf");
        c.add("/tmp/test2.pdf");
        c.execute();
    }
}
{% endhighlight %}

La versione utilizzata del linguaggio Java è la 7, non stupitevi quindi del
multiple catch ne della diamond notation. Peccato che nella versione che utilizzo per questo esempio gli oggetti iText non permettano anche l’uso del `try` with resources.


Il codice è piuttosto eloquente è si commenta da solo, il vero lavoro lo fa l’oggetto `PdfCopy` nel blocco

{% highlight java %}
reader = new PdfReader(file);
pagesNumber = reader.getNumberOfPages();
for (int page = 0; page < pagesNumber;) {
     copy.addPage(copy.getImportedPage(reader, ++page));
}
{% endhighlight %}

infatti dal `reader` vengono estratte le pagine del documento, una per una e poi aggiunte all’oggetto `copy`.