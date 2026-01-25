---
layout: post
title: "Sviluppo di applicazioni Java EE sicure 1"
excerpt: "Dalle minacce alle migliori pratiche Parte 1"
category: "Java"
date: 2025-09-07
comments: true
share: false
modified: 2025-09-07
published: true
---

### 1. Introduzione
* Benvenuto e obiettivi
* Panorama attuale delle minacce
* Java EE / Jakarta EE Contesto

### 2. Perché siamo qui? - L'obiettivo di questo Talk
* Empowerment degli sviluppatori
    * Fornire agli sviluppatori Java EE conoscenze e strumenti concreti
* La sicurezza è responsabilità di tutti
    * Non è solo un problema per gli esperti di sicurezza informatica o per gli IT Ops.
* Dalle minacce alla prevenzione
    * Capire cosa cercare e come difendersi
* Migliora il codice e i processi
    * Integrare la sicurezza nel ciclo di vita dello sviluppo software

### 3. Il panorama delle minacce in continua evoluzione (Il “perché” - Parte 1)
* Frequenza e sofisticatezza
    * Gli attacchi non sono più solo opera di “script kiddies”
* Motivazioni
    * Guadagno finanziario (ransomware, furto di dati)
    * Spionaggio industriale/statale
    * Vandalismo/Danno alla reputazione
* Conseguenze nel mondo reale
    * Data Breaches
    * Perdite finanziarie significative
    * Danno alla reputazione, perdita della fiducia dei clienti
    * Sanzioni legali e normative (ad es. GDPR)
    
### 4. Le applicazioni sono l'obiettivo (Il “perché” - Parte 2)
* Dalle infrastrutture al codice
    * Gli aggressori si concentrano sui punti in cui trovano le vulnerabilità maggiori
* Vettori di attacco comuni
* Vulnerabilità del codice
    * SQL injection, XSS, autenticazione compromessa, ecc.
* Configurazioni errate:
    * Server, framework, librerie
* Componenti con vulnerabilità note
    * Dipendenze da terze parti
* La Top 10 dell'OWASP
    * La nostra guida di riferimento alle vulnerabilità più critiche delle applicazioni web

### 5. Il contesto Java EE/Jakarta EE: il nostro ecosistema
* Potenza e complessità
    * La piattaforma scelta per le applicazioni aziendali mission-critical
* Architettura
    * Componenti distribuiti (EJB, Servlet, JPA, JMS, JAX-RS, ecc.).
* Sfide uniche in materia di sicurezza
    * Complessità intrinseca
        * Molti componenti devono essere configurati in modo sicuro e interagire tra loro.
* Applicazioni legacy
    * Applicazioni obsolete con pratiche di sicurezza superate
* Delegare al contenitore (ma non troppo!)
    * l contenitore Java EE offre eccezionali funzionalità di sicurezza “pronte all'uso”:
autenticazione, autorizzazione basata sui ruoli e gestione delle sessioni. Tuttavia, è fondamentale
comprendere che il contenitore è solo una parte della soluzione. Se il codice della nostra applicazione è
vulnerabile (ad esempio, SQL Injection, XSS), il contenitore non può fare miracoli. La sicurezza del codice dell'applicazione
è la nostra responsabilità primaria.
* Sicurezza:
    * Una responsabilità condivisa che inizia dagli sviluppatori

### 6. Il “Piano”
* Sviluppo di applicazioni Java EE sicure - (1)
    *  Introduzione (la presente Introduzione)
* Sviluppo di applicazioni Java EE sicure - (2)
    *  Comprendere le minacce comuni
* Sviluppo di applicazioni Java EE sicure - (3)
    *  Principi di sviluppo sicuro in Java EE
* Sviluppo di applicazioni Java EE sicure - (4)
    *  Migliori pratiche specifiche per Java EE Jakarta EE
* Sviluppo di applicazioni Java EE sicure - (5)
    *  Test di sicurezza e monitoraggio