---
layout: post
title:  "Inviare mail con allegati in Java"
excerpt: ""
category: java
date:   2014-07-14 22:45:33
tags: [Articoli disponibili in lingua italiana,lang_it,Java, JavaMail]
comments: true
share: true
---

Il package javax.mail è molto ricco, quindi in prima istanza può anche disorientare, vedremo nel codice presentato in questo post quanto ripaghi in flessibilità e potenzialità questa complessità. E’ vero, non ho un metodo semplice mail() come in altri linguaggi,  ma ho gli strumenti per crearmi anche un server di posta di tutto rispetto (ma questo lo approfondieremo in un prossimo post, riguardo il semplice metodo mail() possiamo anche crearcelo a partire dalle API come vedremo e sarà fatto su misura per le nostre esigenze)
Per creare la nostra utility faremo riferimento al pattern commmand.
Per prima cosa definiamo una classe astratta che conterrà la gestione mailcap sempre utile quando si vuole gestire notifiche via mail da piattaforma Java.

{% highlight java %}
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
{% endhighlight %}

Segue a questo punto il codice della classe principale, la classe presenta metodi specifici per gestire anche l’invio di mail con autenticazione smtp.

{% highlight java %}
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
{% endhighlight %}
Avrete notato la presenza di una classe `MailCommandAuthenticator` che serve proprio per la gestione dell’autenticazione al nostro server di posta.

{% highlight java %}
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
{% endhighlight %}

E’ ora non ci resta che mostrare un esempio di utilizzo, ma prima aiutiamoci con una classe che realizza il pattern `Singleton` 

{% highlight java %}
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
{% endhighlight %}


Ed ora il codice di chiamata, si tratta di uno degli esempi possibili atto ad illustrare la flessibilità del mini framework che abbiamo realizzato e che voi personalizzerete secondo le vostre esigenze.

{% highlight java %}
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
{% endhighlight %}

Ovviamente posso aggiungere più allegati come è possibile o non aggiungerne affatto e quindi inviare solo tipiche mail di testo.
