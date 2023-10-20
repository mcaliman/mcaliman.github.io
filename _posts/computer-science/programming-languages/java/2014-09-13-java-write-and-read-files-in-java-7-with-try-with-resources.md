---
layout: post
lang: en
title:  "Writing and reading files in Java 7 with try-with-resources"
excerpt: ""
category: "Programming Languages"
date:   2014-09-13 22:45:33
tags: [Java,"Java 7"]
comments: true
share: true
revision: 0
---

Reading and writing files in Java 7 using the new try-with-resource construct relieves the developer of the task of correctly closing streams, below you can find two example methods.


To write a file
```java
protected boolean write(String name, String text) {
        boolean completed;
        try (Writer writer = 
new BufferedWriter(
new OutputStreamWriter(new FileOutputStream(name), "utf-8"))) 
{
            writer.write(text);
            completed = true;
        } catch (IOException e) {
            completed = false;
            logger.log(Level.SEVERE, "", e);
        }
        return completed;
    }
```


and to read its contents


```java
public String read(String name) {
        String text = null;
        try (BufferedReader buffer = new BufferedReader(new FileReader(name))) {
            StringBuilder string = new StringBuilder();
            String line = buffer.readLine();
            while (line != null) {
                string.append(line).append(System.lineSeparator());
                line = buffer.readLine();
            }
            text = string.toString();
        } catch (FileNotFoundException e) {
            logger.log(Level.SEVERE, "", e);
        } catch (IOException e) {
             logger.log(Level.SEVERE, "", e);
        }
        return text;
    }
```


When the try block ends the stream will be closed automatically. This is possible because the classes used in the try-with-resources block implement the Java interface `java.lang.AutoCloseable` .

All classes that implement this interface can be used within try-with-resources.


The `AutoClosable` interface has only one method `close()`.


```java
public interface AutoClosable {

   public void close() throws Exception;
}
```

Implementing `AutoClosable` on one of our objects does not require much effort as can be seen from the example code below.

```java
public class AutoClosableExampleObject implements AutoCloseable {

   @Override
   public void close() throws Exception {
      //do stuff and close
   }
}
```

If we don't want to catch the exception, just omit the `catch` part of the block, and it will propagate as if it were unhandled (just so a `try` without `catch` and without `finally)`. To be honest, the code above could have benefited from other new features in version 7, such as `catch` with multiple exception handling, but more on that in a future post.
