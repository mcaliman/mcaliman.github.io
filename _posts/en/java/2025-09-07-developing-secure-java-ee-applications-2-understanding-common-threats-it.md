---
layout: post
title: "Sviluppo di applicazioni Java EE sicure 2"
excerpt: "Dalle minacce alle migliori pratiche Parte 2"
category: "Java"
date: 2025-09-07
comments: true
share: false
modified: 2025-09-07
published: true
tags: [java, security, en]
---


### 2. Comprendere le minacce comuni
* Difetti di iniezione (SQL, NoSQL, iniezione di comandi)
* Autenticazione e gestione delle sessioni non funzionanti
* Cross-Site Scripting (XSS)
* Esposizione di dati sensibili
* Configurazione errata della sicurezza
* Vulnerabilità di deserializzazione
* Cross-Site Request Forgery (CSRF)
* Utilizzo di componenti con vulnerabilità note
* Brevi esempi pratici


### 2.1 Difetti di iniezione (SQL, NoSQL, iniezione di comandi)
* Un difetto di iniezione è una vulnerabilità che consente a un aggressore di trasmettere codice dannoso tramite un'applicazione
a un altro sistema

### 2.2 Autenticazione e gestione delle sessioni interrotte
* Punti deboli nell'autenticazione e nella gestione delle sessioni (dirottamento delle sessioni, credential stuffing)
* Strategie di mitigazione (contesto Java EE):
* Pratiche di autenticazione forte:
* Applicare politiche di password forti, implementare meccanismi di blocco degli account, applicare
limiti di frequenza ai tentativi di accesso, utilizzare l'autenticazione a più fattori (MFA), hashing
con algoritmi salt & slow: Come discusso, utilizzare algoritmi di hashing robusti, con salt e lenti
come BCrypt, SCrypt o Argon2. Non memorizzare mai password in chiaro. Evitare messaggi di errore verbosi
al login
* Pratiche di gestione sicura delle sessioni:
* Utilizzare ID di sessione forti, casuali e univoci, impostare flag sicuri e HttpOnly sui
cookie di sessione, invalidare le sessioni al momento del logout [HttpSession.invalidate(),
HttpServletRequest.changeSessionId() (Servlet 3.1+)]
* Sfruttare le funzionalità di sicurezza Java EE / Jakarta EE:
* Autenticazione gestita dal contenitore
* API di sicurezza Jakarta (JSR 375+)
* Utilizzo dell'API standard


### 2.3 Cross-Site Scripting (XSS) ecc…
* XSS riflesso, memorizzato e basato su DOM. Come influiscono sulle applicazioni web EE
* Gli attacchi Cross-Site Scripting (XSS) sfruttano le vulnerabilità delle applicazioni web iniettando
Gli attacchi Cross-Site Scripting (XSS) sfruttano le vulnerabilità delle applicazioni web iniettando
script dannosi nelle pagine visualizzate da altri utenti, compromettendo la loro esperienza e potenzialmente
mettendo a rischio i loro dati.
    * L'XSS riflesso si verifica quando un aggressore utilizza un link o un modulo dannoso per iniettare uno script, che
viene poi riflesso sul browser della vittima.
* L'XSS memorizzato si verifica quando un aggressore inietta uno script dannoso nel database dell'applicazione,
 che viene poi consegnato a utenti ignari.
    * L'XSS basato su DOM sfrutta le debolezze del codice lato client, consentendo a un aggressore di
manipolare il Document Object Model (DOM) e iniettare script dannosi.


### 2.4 Sensitive Data Exposure
* Come i dati sensibili possono essere esposti (mancanza di crittografia, registrazione eccessiva)
* Dati in transito: le informazioni intercettate mentre viaggiano attraverso le reti (ad esempio, Wi-Fi pubblico,
Internet) possono essere facilmente lette. Si pensi alle credenziali di accesso, ai dettagli finanziari o ai messaggi personali
inviati tramite connessioni non crittografate (HTTP vs. HTTPS).
        * HTTPS/TLS sempre:** configurate il vostro server applicativo (ad es. Tomcat, WildFly, WebSphere,
GlassFish) per utilizzare HTTPS (HTTP Secure) con TLS (Transport Layer Security) per tutte le
comunicazioni. Ciò è essenziale per il livello web (dal browser al server), i servizi web
(SOAP/REST) e, se possibile, anche per le connessioni al database.
    * Dati inattivi: i file e i database non crittografati, se accessibili da persone non autorizzate (ad esempio
a seguito di una violazione della sicurezza o della perdita di un dispositivo), sono completamente compromessi. I laptop o i server rubati con
dischi rigidi non crittografati offrono accesso diretto a informazioni sensibili.

### 2.5 Sensitive Data Exposure
* Hashing delle password: non memorizzare mai le password in chiaro o con crittografia reversibile.
* Utilizzare algoritmi di hashing robusti e con salt, come bcrypt, scrypt o Argon2.
* Librerie come Spring Security o Apache Shiro offrono implementazioni pronte all'uso.
* Esempio (concettuale): String hashedPassword = BCrypt.hashpw(plainTextPassword,
BCrypt.gensalt());
    * https://docs.spring.io/springsecurity/
site/docs/current/api/org/springframework/security/crypto/bcrypt/BCrypt.html

### 2.6 Security Misconfiguration
* Errori di configurazione comuni nei server delle applicazioni, nei framework, nelle librerie...
* Non affidarti troppo a ciò che trovi su stackoverflow ... LLM
* Leggi comunque la documentazione ufficiale (a volte anche quella può contenere errori!).

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee
http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
 version="4.0">

 <session-config>
 <session-timeout>15</session-timeout> <cookie-config>
 <secure>true</secure>
 <http-only>true</http-only>
 </cookie-config>
 </session-config>

 </web-app>
``` 

### 2.7 Deserialization Vulnerabilities
* Rischi legati alla deserializzazione di dati non attendibili.
* Che cos'è la deserializzazione?
* Il processo di conversione di un formato di dati serializzato (ad esempio byte, JSON, XML) in un
oggetto in memoria.
* Perché è rischioso?
* Se i dati serializzati provengono da una fonte non attendibile, possono essere manipolati per alterare lo
stato dell'applicazione, causando l'esecuzione di codice remoto (RCE) o altri attacchi gravi.
* Vulnerabilità di Java

Vettori di attacco comuni
* Esecuzione di codice remoto (RCE)
* È possibile progettare oggetti dannosi per eseguire codice arbitrario sul server.
* Denial of Service (DoS)
* Payload accuratamente progettati possono causare un consumo eccessivo di risorse, bloccando l'
applicazione
* Manomissione/corruzione dei dati
* Alterazione dello stato degli oggetti per aggirare i controlli di sicurezza o manipolare i dati.
* Divulgazione di informazioni
* Sfruttamento della deserializzazione per leggere dati sensibili

Come avvengono gli attacchi (esempio concettuale Java)
* Il metodo `ObjectInputStream.readObject()` è il punto di ingresso per la deserializzazione. Senza un'
attenta convalida e sanificazione dell'input, tenterà di ricostruire qualsiasi oggetto Java
dal flusso di byte. Gli aggressori possono creare flussi di byte dannosi che, una volta deserializzati,
costruiscono oggetti progettati per attivare azioni dannose.
* Contromisure e best practice

Contromisure e best practice
* Evitare la deserializzazione di dati non attendibili
* L'approccio più sicuro. Se possibile, utilizzare formati di dati alternativi come JSON o XML con schemi definiti con cura
e utilizzare librerie di analisi specifiche (ad esempio Gson, Jackson, JAXB) per controllare
gli schemi definiti e utilizzare librerie di analisi specifiche (ad esempio Gson, Jackson, JAXB) per controllare
la costruzione degli oggetti.
* Utilizzare whitelist, non blacklist
        * Se la deserializzazione è inevitabile, definire e applicare con attenzione quali classi possono
essere deserializzate. Non cercare mai di bloccare classi notoriamente dannose; si troveranno sempre nuovi exploit.
* Librerie di deserializzazione moderne
* Se è *necessario* deserializzare, prendere in considerazione l'utilizzo di librerie progettate tenendo conto della sicurezza (ad esempio,
quelle con funzionalità di whitelist integrate). Ricercare le migliori pratiche attuali.
    * Filtro seriale di Java (JEP 290)
* A partire da Java 9 (e con backport ad alcune versioni di Java 8), utilizzare il meccanismo del filtro seriale
per controllare quali classi possono essere deserializzate. Si tratta di una difesa cruciale, ma
richiede un'attenta configurazione.
byte[]

```java
byte[] serializedData = getUntrustedData(); // From network, file, etc.
// 1. Create a filter that allows only specific classes (whitelist)
BinaryOperator<ObjectInputStream, ObjectInputFilter>
filterFactory =
(ois, serialFilter) -> ObjectInputFilter.Config.createFilter(
"com.example.*;!*"); // Allow only classes in com.example package
// 2. Set the filter factory on the ObjectInputStream
try (ObjectInputStream ois = new ObjectInputStream(new
ByteArrayInputStream(serializedData))) {
ois.setObjectInputFilter(filterFactory.apply(ois, null)); // Apply the filter
Object obj = ois.readObject(); // Now safer, but STILL requires caution
System.out.println("Deserialized object: " + obj);
}
```


### 2.8 Falsificazione delle richieste cross-site (CSRF)
* Come sfruttare la fiducia riposta dall'utente nel proprio browser.

### 2.9 Utilizzo di componenti con vulnerabilità note
* L'importanza di gestire in modo sicuro le dipendenze

### 2.9.1 Brevi esempi pratici
* Mostra frammenti di codice Java EE vulnerabile e spiega perché è vulnerabile.
