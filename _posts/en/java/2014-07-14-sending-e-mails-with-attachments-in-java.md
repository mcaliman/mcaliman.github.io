---
layout: post
lang: en
title:  "Sending e-mails with attachments in Java"
excerpt: ""
category: "Java"
tags: ["Programming Languages","Java","JavaMail API"]
date:   2014-07-14 22:45:33
comments: true
share: false
published: true
---

The javax.mail package is very rich, so at first it can be a bit confusing; we'll see in the code presented in this post how much this complexity pays off in flexibility and potential. True, I don't have a simple mail() method as in other languages, but I do have the tools to create a respectable mail server as well (but we'll go into this in a later post, regarding the simple mail() method we can also create it from the API as we'll see and it will be tailored to our needs)
To create our utility we will refer to the commmand pattern.
First we define an abstract class that will contain the mailcap management, which is always useful when we want to manage email notifications from the Java platform.

```java
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;

public class AbstractMailCommand {

   protected void mailcap() {
      MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
      mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
      mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
      mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
      mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
      mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
      CommandMap.setDefaultCommandMap(mc);
   }
}
```

Here follows the code of the main class, the class has specific methods for handling also the sending of mails with smtp authentication.

```java
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailCommand extends AbstractMailCommand {

   private static final Logger logger = 
        Logger.getLogger(MailCommand.class.getName());
   private String smtp;
   private String user = "myuser@domain.ext";
   private String password;
   private String from;
   private String body;
   private boolean debugEnabled;
   private Session session;
   private MimeMessage message;
   private List<BodyPart> attachments;

   public MailCommand() {
   }

   public MailCommand(String smtp, String user, String password) {
      this.smtp = smtp;
      this.user = user;
      this.password = password;
      this.debugEnabled = false;
      this.mailcap();
   }

   public void addAttachment(File file) 
    throws IOException, MessagingException {
      String name = file.getName();
      BodyPart messageBodyPart = null;
      messageBodyPart = new MimeBodyPart();
      DataSource source = new FileDataSource(file);
      messageBodyPart.setDataHandler(new DataHandler(source));
      messageBodyPart.setFileName(name);
      this.attachments.add(messageBodyPart);
   }

   public void init() throws MessagingException {
      initialize(); //potevo usare il metodo con “base” se non mi interessa l’invio autenticato
   }

   private void initialize() throws MessagingException {
      MailCommandAuthenticator authenticator = new MailCommandAuthenticator(this.user, this.password);
      Properties props = System.getProperties();
      props.put("mail.smtp.host", this.smtp);
      props.put("mail.smtp.auth", "true");
      this.session = Session.getInstance(props, authenticator);
      this.session.setDebug(this.debugEnabled);
      this.attachments = new ArrayList<BodyPart>();
      this.message = new MimeMessage(this.session);
   }

   private void initializeBase() throws MessagingException {
      Properties props = System.getProperties();
      props.put("mail.smtp.host", this.smtp);
      this.session = Session.getInstance(props, null);
      this.session.setDebug(this.debugEnabled);
      this.attachments = new ArrayList<BodyPart>();
      this.message = new MimeMessage(this.session);
   }

   private void initialize(Session session) throws MessagingException {
      Properties props = System.getProperties();
      props.put("mail.smtp.host", this.smtp);
      props.put("mail.smtp.auth", "true");
      this.session = session;
      this.session.setDebug(this.debugEnabled);
      this.attachments = new ArrayList<BodyPart>();
      this.message = new MimeMessage(this.session);
   }

   public void setFrom(String from) throws MessagingException {
      this.from = from;
      this.message.setFrom(new InternetAddress(this.from));
   }

   public void addTo(String to) throws MessagingException {
      this.message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
   }

   public void addCc(String cc) throws MessagingException {
      if (isNotEmpty(cc)) {
         this.message.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
      }
   }

   public void addBcc(String bcc) throws AddressException, MessagingException {
      if (isNotEmpty(bcc)) {
         this.message.addRecipient(Message.RecipientType.BCC, new InternetAddress(bcc));
      }
   }

   public void setSubject(String subject) throws MessagingException {
      this.message.setSubject(subject);
   }

   public void setBody(String body) {
      this.body = body;
   }

   private boolean isNotEmpty(String value) {
      return value != null && value.trim().length() > 0;
   }

   public void execute() {
      try {
         Multipart multipart = new MimeMultipart();
         BodyPart messageBodyPart = new MimeBodyPart();
         messageBodyPart.setText(this.body);
         multipart.addBodyPart(messageBodyPart);
         for (Iterator<BodyPart> it = this.attachments.iterator(); it.hasNext();) {
            BodyPart bodyPart = it.next();
            multipart.addBodyPart(bodyPart);
            message.setContent(multipart);
         }
         if (this.attachments.isEmpty()) {
            message.setContent(multipart);
         }
         Transport tr = session.getTransport("smtp");
         logger.log(Level.FINEST, "Connect to host " + smtp + " from " + from + " password 'secret'");
         tr.connect();
         tr.sendMessage(message, message.getAllRecipients());
         logger.log(Level.FINEST, "Mail sent successfully");
         tr.close();
      } catch (MessagingException ex) {
         logger.log(Level.SEVERE, "", ex);
      }
   }
}
```

You may have noticed the presence of a `MailCommandAuthenticator` class which is used precisely for handling authentication to our mail server.


```java
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailCommandAuthenticator extends Authenticator {

   private String user;
   private String password;

   public MailCommandAuthenticator(String user, String password) {
      this.user = user;
      this.password = password;
   }

   @Override
   public PasswordAuthentication getPasswordAuthentication() {
      return new PasswordAuthentication(this.user, this.password);
   }
}
```

All that remains now is to show an example of use, but first let us help ourselves with a class that realises the `Singleton` pattern

```java
public class MailCommandInstantiator {

   private static MailCommand instance;

   public static MailCommand getInstance() {
      if (instance == null) {
         String smtp = "smtp..myserver.ext";
         String user = "auth@myserver.ext";
         String password = "Secret";
         instance = new MailCommand(smtp, user, password);
      }
      return instance;
   }
}
```


And now the call code, this is one of the possible examples illustrating the flexibility of the mini framework we have created and which you will customise according to your needs.


```java
MailCommand mailCommand = MailCommandInstantiator.getInstance();
try {
     mailCommand.init();
     mailCommand.setFrom("alice@myserver.ext");
     mailCommand.addTo("bob@myserver.ext");
     mailCommand.addCc("alice@myserver.ext");
     mailCommand.addBcc("alice@myserver.ext");
     mailCommand.setSubject("The subject!");
     mailCommand.setBody("Body example.");        
     mailCommand.addAttachment(new File("/home/mailattach/attachment.pdf"));        
     mailCommand.execute();
} catch (IOException ex) {
     //error management
} catch (MessagingException ex) {
     //error management
}
```

Obviously, I can add as many attachments as is possible or add none at all and then only send typical text mails.
