---
layout: post
lang: it
title:  "Una Servlet per gestire il download di file in Java"
excerpt: ""
category: Java
date:   2014-07-15 22:45:33
tags: [English,Java, Servlet]
comments: true
share: true
---

Vediamo in questo post come scrivere il codice di una Servlet Java che ci permette di effettuare il trasferimento (il download) di un file dalla nostra applicazione server al client (il web browser dei nostri utenti).
Effettuando il click su un link che punta alla nostra servlet verrà avviato il download, vediamo il codice piuttosto intuitivo nelle linee sottostanti del post.
Per la realizzazione abbiamo bisogno essenzialmente di leggere il file richiesto (usando una qualche implementazione di `InputStream` nel nostro caso useremo `FileInputStream`); di determinare il tipo `MIME` e riversare il tutto correnttamente sull’oggetto di tipo `HttpServletResponse` della nostra Servlet.


Nel nostro esempio il nome del file comprensivo di path è passato come parametro, rendendo la Servlet generica, utilizzabile per effettuare il download di qualsiasi file

```java
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DownloadFileServlet", urlPatterns = {"/DownloadFileServlet"})
public class DownloadFileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
      throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String filePath = request.getParameter("file");
            File file = new File(filePath);
            FileInputStream inputStream = new FileInputStream(file);
            ServletContext context = getServletContext();
            String mimeType = context.getMimeType(filePath);
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }
            response.setContentType(mimeType);
            response.setContentLength((int) file.length());
            // forziamo il download del file
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
            response.setHeader(headerKey, headerValue);
            OutputStream outputStream = response.getOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            inputStream.close();
            outputStream.close();
        } catch (Exception e) {
            //gestiamo eventuali errori come file non esistente
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
       throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
```

Non dobbiamo aggiungere nulla alla nostra webapplication tramite il descrittore di deployment web.xml dato che abbiamo utilizzato la modalità tramite annotazioni. Per l’invocazione 
```bash 
http://localhost:8080/MyWebApplication/DownloadFileServlet?file=/path/file.ext
```
