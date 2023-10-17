---
layout: post
lang: en
title:  "Concatenating PDFs with iText in Java"
excerpt: ""
category: programming-languages
date:   2014-09-18 22:45:33
tags: [Java,"Java 7"]
comments: true
share: true
revision: 0
---
iText is definitely the most popular and complete library for processing PDF files, I highly recommend taking a look at it before evaluating other frameworks or reinventing hot water.

But let's get down to brass tacks, below is the code for a class that allows you to merge a series of PDFs together, effectively concatenating a series of files and creating one resulting from the process.

```java
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
```
The version of the Java language used is 7, so don't be surprised by the
multiple catch nor the diamond notation. Too bad that in the version I use for this example the iText objects do not also allow the use of `try` with resources.


The code is pretty self-explanatory; the real work is done by the `PdfCopy` object in the

```java
reader = new PdfReader(file);
pagesNumber = reader.getNumberOfPages();
for (int page = 0; page < pagesNumber;) {
     copy.addPage(copy.getImportedPage(reader, ++page));
}
```

in fact the `reader` extracts the pages of the document, one by one, and then adds them to the `copy` object.