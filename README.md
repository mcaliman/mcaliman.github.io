# True Programming - Massimo Caliman's Blog

Benvenuto nel repository del blog tecnico **True Programming** di Massimo Caliman. Questo file raccoglie tutte le informazioni strutturali, le configurazioni e le procedure di sviluppo utili come base di contesto per futuri aggiornamenti e interazioni.

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

## 4. Linee Guida per i Post e Contenuti

### Nomenclatura File
I file dei post in `_posts/en/` o `_posts/it/` devono seguire lo standard di Jekyll:
```
YYYY-MM-DD-titolo-post.md
```
Ad esempio: `2014-10-12-depth-first-search-tree.md`.

### Front Matter Standard per i Post
Ogni post deve includere le seguenti chiavi nel Front Matter (delimitato da `---`):

```yaml
---
layout: post
title:  "Titolo del Post"
excerpt: "Una breve descrizione dell'articolo per l'anteprima"
category: Programming # Categoria principale (es. Programming, Linux, Systems)
date:   YYYY-MM-DD
comments: true
share: false
modified: YYYY-MM-DD # Data dell'ultima modifica (se presente)
published: true
tags: [data-structures, algorithms, en, code] # Tag rilevanti per la categorizzazione
permalink: /programming/nome-univoco-url/
---
```

### Supporto MathJax
Il supporto per le formule matematiche è abilitato globalmente in `_config.yml` (`mathjax.enable: true`). È possibile scrivere formule matematiche utilizzando la sintassi LaTeX standard all'interno dei post, racchiuse tra `$ ... $` (inline) o `$$ ... $$` (blocco).

---

## 5. Generazione Automatica del Curriculum (CV/Resume)

Il curriculum di Massimo Caliman viene generato in formato Word (`.docx`) a partire dai dati YAML sincronizzati/esportati da LinkedIn situati nella cartella `_data/linkedin/`.

All'interno della cartella `scripts/` sono presenti i seguenti generatori:

* **Curriculum Standard**:
  ```bash
  ruby scripts/generate_resume.rb
  ```
  Genera: `Massimo_Caliman_Resume.docx`
* **Curriculum Advanced**:
  ```bash
  ruby scripts/generate_resume_adv.rb
  ```
  Genera: `Massimo_Caliman_Resume_Advanced.docx`
* **Curriculum Europass**:
  ```bash
  ruby scripts/generate_resume_eu.rb
  ```
  Genera: `Massimo_Caliman_Resume_Europass.docx`

*Nota: Assicurarsi di aver eseguito `bundle install` prima di lanciare gli script, in quanto richiedono la gemma `caracal` per la creazione dei file Word.*

---

## 6. Flusso di Deploy e Pubblicazione

Il sito viene ospitato ed erogato tramite **GitHub Pages**. Il flusso di pubblicazione sul branch principale (`master` o branch di produzione) avviene tramite i comandi Git tradizionali:

```bash
# Aggiungere le modifiche
git add --all .

# Eseguire il commit
git commit -m "Messaggio descrittivo delle modifiche"

# Eseguire il push (prestare attenzione a non forzare inutilmente sul branch principale)
git push origin docs-update-2026-05-23
```

> [!IMPORTANT]
> Non utilizzare l'opzione `--force` o `--force-with-lease` se non strettamente necessario o se si lavora in team, per evitare la sovrascrittura di modifiche concorrenti.

