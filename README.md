# True Programming - Massimo Caliman's Blog

Benvenuto nel repository del blog tecnico **True Programming** di Massimo Caliman. Questo file raccoglie le informazioni di base sulla struttura del progetto e sui comandi per lo sviluppo in locale.

Per tutte le specifiche di lavoro, le convenzioni del codice, la stesura dei post e il workflow Git, fare riferimento al file [spec.md](spec.md).

---

## 1. Informazioni Generali
* **Sito Web**: [True Programming](https://trueprogramming.com) (o dominio GitHub Pages collegato)
* **Autore**: Massimo Caliman (mcaliman@gmail.com)
* **Descrizione**: Blog tecnico dedicato all'Informatica, Programmazione (Java, Python, C#, COBOL, R), Algoritmi, Strutture Dati, Linux/Sistemi e altro.
* **Tecnologia**: Generatore di siti statici **Jekyll** scritto in Ruby.
* **Tema Base**: `mmistakes/so-simple-theme` (configurato tramite `remote_theme` in `_config.yml`).

---

## 2. Struttura del Progetto

Il repository segue la struttura standard di Jekyll con alcune personalizzazioni:

| Cartella / File | Descrizione |
| :--- | :--- |
| `_config.yml` | File di configurazione globale del sito (metadata, plugin, MathJax, fonts, analytics). |
| `_posts/` | Contiene tutti gli articoli del blog divisi per lingua: `en/` (Inglese) e `it/` (Italiano). |
| `pages/` | Pagine statiche istituzionali divise per lingua (`en/` e `it/`) come Privacy Policy, Cookie Policy, Terms of Service e il Curriculum/Profilo (`resume.md`, `mcaliman.md`). |
| `_includes/` | Componenti HTML personalizzati che sovrascrivono o estendono quelli del tema base (es. banner dei cookie, pulsanti social, tracciamento analytics). |
| `_layouts/` | Layout personalizzati per le pagine e i post (es. `post.html`, `posts.html`, `categories.html`, `tags.html`). |
| `_data/` | File di dati YAML tra cui `text.yml` (per le traduzioni multilingua dell'interfaccia), `navigation.yml` (menu principale) e la cartella `linkedin/` (dati del curriculum). |
| `scripts/` | Script Ruby per la generazione del curriculum offline in formato Word (.docx). |
| `assets/` | File CSS statici, skin del tema e altre risorse grafiche. |
| `images/` | Immagini utilizzate all'interno del sito e dei post. |

---

## 3. Sviluppo Locale e Comandi Utili

### Prerequisiti
* Ruby installato sul sistema.
* Bundler installato (`gem install bundler`).

### Installazione Dipendenze
Per installare le gemme Ruby necessarie (Jekyll e i relativi plugin):
```bash
bundle install
```

### Avviare il Server Locale
Per testare il sito in locale con ricaricamento automatico:
```bash
bundle exec jekyll serve
```
*Il sito sarà solitamente accessibile su `http://localhost:4000`.*

### Compilazione (Build)
Per generare la versione statica del sito nella cartella `_site`:
```bash
bundle exec jekyll build
```

---

## 4. Specifiche e Linee Guida di Lavoro

Tutte le specifiche operative dettagliate sono documentate in:
👉 **[spec.md](spec.md)**

Consultare questo file per:
* **Workflow Git**: Convenzioni sui branch, commit e deploy su GitHub Pages.
* **Linee guida per la creazione di nuovi post**: Struttura delle cartelle, standard di Front Matter, tag obbligatori.
* **MathJax**: Sintassi per formule matematiche e pseudocodice.
* **Generazione dei Curriculum**: Istruzioni per l'uso dei generatori automatici a partire da file YAML LinkedIn.
* **Customizzazione Grafica**: Linee guida per layout e CSS.

