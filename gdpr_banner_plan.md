# Sostituzione Iubenda con Banner GDPR Custom

Questo piano definisce i passaggi per rimuovere il servizio di terze parti Iubenda e implementare un banner cookie e privacy personalizzato e conforme al GDPR. Il banner integrerà la Google Consent Mode v2 (già parzialmente presente nel sito) per garantire che i tracciamenti (come Google Analytics) si attivino solo dopo l'esplicito consenso dell'utente.

> [!IMPORTANT]
> L'obiettivo è avere una gestione nativa delle preferenze cookie salvando i dati nel `localStorage` dell'utente e utilizzando le API native di Google Analytics (`gtag('consent', 'update')`). Questo eliminerà la dipendenza da Iubenda.

## User Review Required

- **Testi del Banner:** Il banner avrà un testo di base ("Questo sito utilizza cookie per migliorare l'esperienza utente e analizzare il traffico..."). Sei d'accordo con l'utilizzo di testi standard o preferisci fornirmi tu un copy specifico?
- **Pagina Policy:** Attualmente il sito ha già due pagine (`pages/it/cookie-policy.md` e `pages/en/cookie-policy.md`). Il banner punterà a queste pagine. Confermi che non è necessario crearne di nuove?
- **Gestione del vecchio file `ga4.css`:** C'è un file `ga4.css` nella directory principale che contiene già delle classi `.cookie-consent-banner`. Sembra un esperimento precedente non incluso nel sito. Intendo prendere quelle regole, migliorarle e inserirle in un nuovo file in `assets/css/` o nel foglio di stile principale, ed eliminare `ga4.css` dalla root. Confermi?

## Proposed Changes

---

### Layouts & Includes

Rimuoverò Iubenda e aggiungerò il nuovo markup per il banner.

#### [MODIFY] [head.html](file:///c:/Users/mcaliman/github/mcaliman.github.io/_includes/head.html)
- Rimuovere il blocco script di Iubenda (linee 2-11).
- Aggiungere il link al nuovo foglio di stile del banner (`cookie-consent.css`).

#### [NEW] [cookie-banner.html](file:///c:/Users/mcaliman/github/mcaliman.github.io/_includes/cookie-banner.html)
- Creare il partial HTML con la struttura del banner.
- Conterrà il testo informativo, i link alle policy, e i bottoni (Accetta Tutti, Solo Necessari).

#### [MODIFY] [default.html](file:///c:/Users/mcaliman/github/mcaliman.github.io/_layouts/default.html)
- Aggiungere `{% include cookie-banner.html %}` prima della chiusura del `body`.

---

### Assets (CSS & JS)

Creazione degli stili e della logica del banner.

#### [NEW] [cookie-consent.css](file:///c:/Users/mcaliman/github/mcaliman.github.io/assets/css/cookie-consent.css)
- Foglio di stile per rendere il banner responsive e stilisticamente coerente con il tema (supporto dark mode se necessario).

#### [NEW] [cookie-consent.js](file:///c:/Users/mcaliman/github/mcaliman.github.io/assets/js/cookie-consent.js)
- Logica JavaScript che:
  1. Legge il `localStorage` per vedere se il banner è già stato accettato.
  2. Gestisce il click su "Accetta Tutti" aggiornando le impostazioni `gtag('consent', 'update', {'analytics_storage': 'granted'})` e nascondendo il banner.
  3. Gestisce il click su "Solo Necessari".
- Verrà richiamato in `_layouts/default.html`.

#### [DELETE] [ga4.css](file:///c:/Users/mcaliman/github/mcaliman.github.io/ga4.css)
- Rimuovere questo file dalla root in quanto il suo contenuto (ripulito) sarà spostato in `cookie-consent.css`.

## Verification Plan

### Manual Verification
1. Lanciare il sito in locale con Jekyll (`npm run dev` o `bundle exec jekyll serve`).
2. Aprire il sito e verificare che Iubenda sia sparito e appaia il nuovo banner.
3. Ispezionare il Network Tab: verificare che le richieste a Google Analytics siano bloccate o in stato `denied` (nessun cookie creato) *prima* del consenso.
4. Cliccare su "Accetta Tutti" e verificare (tramite console e cookie tab) che i consensi vengano aggiornati in `granted` e GA parta.
5. Verificare che al ricaricamento della pagina, il banner non ricompaia in caso di scelta pregressa.
