---
layout: post
lang: en
title:  "A Servlet to manage file downloads in Java"
excerpt: ""
category: programming-languages
tags: [Java]
date:   2014-07-15 22:45:33
comments: true
share: true
---
Let's see in this post how to write the code for a Java Servlet that allows us to transfer (download) a file from our server application to the client (our users' web browser).
Clicking on a link pointing to our servlet will initiate the download, we see the rather intuitive code in the lines below the post.
To implement this, we essentially need to read the requested file (using some implementation of `InputStream`, in our case `FileInputStream`); determine the `MIME` type; and dump it correctly to the `HttpServletResponse` object in our servlet.


In our example, the filename including the path is passed as a parameter, making the Servlet generic, usable for downloading any file

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
           //log
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

We do not need to add anything to our webapplication via the web.xml deployment descriptor since we have used the annotation mode. For the invocation

```bash 
http://localhost:8080/MyWebApplication/DownloadFileServlet?file=/path/file.ext
```
