---
layout: post
title: "Developing Secure Java EE Applications 2"
excerpt: "Understanding Common Threats Part 2"
category: "Java"
date: 2025-09-07
comments: true
share: false
modified: 2025-09-07
published: true
tags: [java, security]
---


### 2. Understanding Common Threats
* Injection Flaws (SQL, NoSQL, Command Injection)
* Broken Authentication and Session Management
* Cross-Site Scripting (XSS)
* Sensitive Data Exposure
* Security Misconfiguration
* Deserialization Vulnerabilities
* Cross-Site Request Forgery (CSRF)
* Using Components with Known Vulnerabilities
* Brief Practical Examples


### 2.1 Injection Flaws (SQL, NoSQL, Command Injection)
* An injection flaw is a vulnerability which allows an attacker to relay malicious code through an
application to another system

### 2.2 Broken Authentication and Session Management
* Weaknesses in authentication and session handling (session hijacking, credential stuffing)
    * Mitigation Strategies (Java EE Context):
        * Strong Authentication Practices:
            * Enforce Strong Password Policies, Implement Account Lockout Mechanisms, Apply
Rate Limiting on Login Attempts, Utilize Multi-Factor Authentication (MFA), Hashing
with Salt & Slow Algorithms: As discussed, use robust, salted, slow hashing algorithms
like BCrypt, SCrypt, or Argon2. Never store plain text passwords. Avoid Verbose Error
Messages on Login
        * Secure Session Management Practices:
            * Use Strong, Random, and Unique Session IDs, Set Secure and HttpOnly Flags on
Session Cookies, Invalidate Sessions Upon Logout [HttpSession.invalidate(),
HttpServletRequest.changeSessionId() (Servlet 3.1+)]
    * Leveraging Java EE / Jakarta EE Security Features:
        * Container-Managed Authentication
        * Jakarta Security API (JSR 375+)
        * Standard API Usage

### 2.3 Cross-Site Scripting (XSS) etc…
* Reflected, Stored, and DOM-based XSS. How they affect EE web applications
    * Cross-Site Scripting (XSS) attacks exploit vulnerabilities in web applications by injecting
Cross-Site Scripting (XSS) attacks exploit vulnerabilities in web applications by injecting
malicious scripts into pages viewed by other users, affecting their experience and potentially
compromising their data.
    * Reflected XSS occurs when an attacker uses a malicious link or form to inject a script, which
is then reflected back to the victim's browser.
    * Stored XSS happens when an attacker injects a malicious script into the application's
database, and it's then delivered to unsuspecting users.
    * DOM-based XSS exploits weaknesses in the client-side code, allowing an attacker to
manipulate the Document Object Model (DOM) and inject malicious scripts.

### 2.4 Sensitive Data Exposure
* How sensitive data can be exposed (lack of encryption, excessive logging)
    * Data in Transit: Information intercepted while traveling across networks (e.g., public Wi-Fi,
internet) can be easily read. Think of login credentials, financial details, or personal
messages sent over unencrypted connections (HTTP vs. HTTPS).
        * HTTPS/TLS Always:** Configure your application server (e.g. Tomcat, WildFly, WebSphere,
GlassFish) to use HTTPS (HTTP Secure) with TLS (Transport Layer Security) for all
communications. This is essential for the web tier (browser to server), web services
(SOAP/REST), and also for database connections if possible.
    * Data at Rest: Unencrypted files and databases, if accessed by unauthorized individuals (e.g.,
through a security breach, lost device), are fully compromised. Stolen laptops or servers with
unencrypted hard drives offer direct access to sensitive information.

### 2.5 Sensitive Data Exposure
* Password Hashing: Never store passwords in plaintext or with reversible encryption..
* Use robust, salted hashing algorithms such as bcrypt, scrypt, or Argon2.
* Libraries like Spring Security or Apache Shiro offer ready-to-use implementations.
* Example (conceptual): String hashedPassword = BCrypt.hashpw(plainTextPassword,
BCrypt.gensalt());
    * https://docs.spring.io/springsecurity/
site/docs/current/api/org/springframework/security/crypto/bcrypt/BCrypt.html

### 2.6 Security Misconfiguration
* Common configuration errors in application servers, frameworks, libraries…
* Don't rely too much on what you find on stackoverflow ... LLM
* Read the official documentation anyway (sometimes even that can have errors!).

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
* Risks related to deserializing untrusted data.
* What is Deserialization?
* The process of converting a serialized data format (e.g., bytes, JSON, XML) back into an
object in memory.
* Why is it Risky?
* If the serialized data comes from an untrusted source, it can be crafted to manipulate the
application's state, leading to Remote Code Execution (RCE) or other severe attacks.
* Java's Vulnerability
* Java's standard deserialization mechanism is particularly vulnerable. Malicious payloads can
exploit object construction and side effects.

Common Attack Vectors
* Remote Code Execution (RCE)
    * Malicious objects can be designed to execute arbitrary code on the server.
* Denial of Service (DoS)
    * Carefully crafted payloads can cause excessive resource consumption, crashing the
application
* Data Tampering/Corruption
    * Altering object state to bypass security checks or manipulate data.
* Information Disclosure
    * Exploiting deserialization to read sensitive data

How Attacks Happen (Conceptual Java Example)
* The `ObjectInputStream.readObject()` method is the entry point for deserialization. Without
careful validation and sanitization of the input, it will attempt to reconstruct any Java object
from the byte stream. Attackers can create malicious byte streams that, when deserialized,
construct objects designed to trigger harmful actions.
* Countermeasures & Best Practices

Countermeasures & Best Practices
* Avoid Deserialization of Untrusted Data
    * The safest approach. If possible, use alternative data formats like JSON or XML with carefully
defined schemas, and use specific parsing libraries (e.g., Gson, Jackson, JAXB) to control
defined schemas, and use specific parsing libraries (e.g., Gson, Jackson, JAXB) to control
object construction.
    * Use Whitelisting, not Blacklisting
        * If deserialization is unavoidable, carefully define and enforce which classes are allowed to
be deserialized. Never try to block known bad classes; new exploits will always be found.
    * Modern Deserialization Libraries
        * If you *must* deserialize, consider using libraries designed with security in mind (e.g.,
those with built-in whitelisting capabilities). Research current best practices.
    * Java's Serial Filter (JEP 290)
        * Starting with Java 9 (and backported to some Java 8 versions), use the serial filter
mechanism to control which classes can be deserialized. This is a crucial defense but
requires careful configuration.
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


### 2.8 Cross-Site Request Forgery (CSRF)
* How to exploit the user's browser's trust.

### 2.9 Using Components with Known Vulnerabilities
* The importance of securely managing dependencies

### 2.9.1 Brief Practical Examples
* Show snippets of vulnerable Java EE code and explain why it's vulnerable
