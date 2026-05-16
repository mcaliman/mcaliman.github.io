# Walkthrough: Rimozione Iubenda e Creazione Banner GDPR Custom

Ho completato la migrazione dalla gestione esterna di Iubenda a un banner cookie proprietario integrato con la Google Consent Mode v2.

## Modifiche Effettuate

### 1. Rimozione Iubenda
Ho ripulito il file `_includes/head.html` rimuovendo tutto il blocco di script che richiamava i servizi e le policy automatiche di Iubenda.

### 2. Creazione Banner Personalizzato
Ho aggiunto un nuovo file HTML (`_includes/cookie-banner.html`) contenente:
- Un testo informativo chiaro.
- I link diretti alle pagine interne già esistenti per **Cookie Policy** e **Privacy Policy**.
- I bottoni **Accetta Tutti** e **Solo Necessari**.

Questo blocco HTML è stato integrato in fondo alla pagina (prima della chiusura del `body` in `_layouts/default.html`).

### 3. Styling del Banner
Ho recuperato e migliorato il vecchio file sperimentale `ga4.css`, creando un file `assets/css/cookie-consent.css` molto più moderno:
- Il banner ha un'animazione fluida di comparsa (slide up).
- Supporta pienamente il tema chiaro e il tema scuro (`data-theme="dark"`).
- È ottimizzato per la visualizzazione mobile.
- Il vecchio `ga4.css` posizionato in root è stato eliminato per mantenere pulita la repository.

### 4. Logica JavaScript (Google Consent Mode v2)
Ho implementato il file `assets/js/cookie-consent.js` che gestisce l'interazione utente e garantisce la conformità:
- Al primo accesso, verifica il `localStorage`. Se non c'è consenso, mostra il banner.
- Se l'utente clicca su **Solo Necessari**, Google Analytics riceve un segnale `denied` e non effettua alcun tracciamento invasivo.
- Se l'utente clicca su **Accetta Tutti**, la scelta viene memorizzata e viene chiamata l'API `gtag('consent', 'update', { 'analytics_storage': 'granted' })` per abilitare i cookie di Google Analytics e nascondere il banner in modo permanente.

## Come Verificare

Per testare le modifiche:
1. Avvia il server Jekyll locale (`bundle exec jekyll serve`).
2. Apri il sito: dovresti vedere il nuovo banner a comparsa dal basso.
3. Cliccando su **Accetta Tutti**, il banner scompare. Ricaricando la pagina, il banner non ricomparirà.
4. Puoi azzerare la scelta eliminando l'elemento `cookie_consent` nel `Local Storage` del browser tramite i Developer Tools (F12 -> Application -> Local Storage).
