# Specifiche di Lavoro (spec.md)

Questo file contiene le regole e le specifiche operative da seguire per ogni modifica o sviluppo effettuato su questo repository. Tutte le interazioni, modifiche al codice e creazione di nuovi post devono attenersi a queste linee guida.

---

## 1. Gestione dei Branch e Git Workflow

* **Sviluppo basato su Branch**: Ogni nuova funzionalità, aggiornamento della documentazione o stesura di post deve avvenire su un branch dedicato (es. `docs-update-YYYY-MM-DD`, `post-nuovo-argomento`).
* **Allineamento**: Prima di aprire un nuovo branch, assicurarsi di essere sul branch `master`, eseguire un `git pull` per incorporare le ultime modifiche remote e poi creare il branch.
* **Commit Atomici**: Effettuare commit frequenti e focalizzati su singole modifiche logiche, con messaggi chiari (es. in inglese o in italiano, es. *"Aggiunta formule MathJax al post DFS"*).
* **Pubblicazione (Push)**: Eseguire il push sul proprio branch di lavoro remoto. Evitare l'uso di `--force` o `--force-with-lease` sul branch `master` se non concordato esplicitamente.

---

## 2. Linee Guida per i Post (`_posts/`)

* **Multilinguismo**: I post devono essere inseriti nella cartella corrispondente alla lingua:
  * `_posts/en/` per gli articoli in inglese.
  * `_posts/it/` per gli articoli in italiano.
* **Nomenclatura**: Il nome del file deve seguire rigorosamente lo schema `YYYY-MM-DD-titolo-post.md` (tutto in minuscolo, parole separate da trattini).
* **Front Matter Obbligatorio**: Ogni post deve contenere i seguenti metadati in testa al file:
  ```yaml
  ---
  layout: post
  title: "Titolo dell'Articolo"
  excerpt: "Breve abstract/riassunto visualizzato in anteprima"
  category: CategoriaPrincipale # (es. Programming, Linux, Systems)
  date: YYYY-MM-DD
  comments: true
  share: false
  tags: [tag1, tag2, lang-tag, code] # es. [java, algorithms, it, code]
  permalink: /categoria/permalink-univoco/
  ---
  ```
* **Tag di Lingua**: Includere sempre il tag della lingua nei `tags`: `en` per l'inglese, `it` per l'italiano.
* **Tag Codice**: Se il post contiene frammenti di codice sorgente o pseudocodice strutturato, includere sempre il tag `code` nei metadati.
* **MathJax (Formule Matematiche)**:
  * Il supporto a MathJax è abilitato a livello globale in `_config.yml`.
  * Utilizzare la sintassi standard LaTeX per scrivere le formule:
    * `$ formula $` per formule inline.
    * `$$ formula $$` o blocchi `\begin{array} ... \end{array}` per formule su riga separata.
  * *Esempio*: Utilizzare blocchi strutturati in LaTeX per rappresentare lo pseudocodice in modo elegante al posto di semplici blocchi di testo preformattato dove possibile.

---

## 3. Gestione e Generazione dei Curriculum (CV)

* **Sorgente dei Dati**: I dati del curriculum risiedono nei file YAML all'interno di `_data/linkedin/` (es. `Profile.yml`, `Positions.yml`, `Skills.yml`, ecc.).
* **Flusso di Aggiornamento**:
  1. Modificare o aggiornare i dati YAML in `_data/linkedin/` per riflettere le variazioni del profilo.
  2. Eseguire gli script di generazione per aggiornare i file Word (`.docx`) nella directory principale:
     * `ruby scripts/generate_resume.rb` -> `Massimo_Caliman_Resume.docx`
     * `ruby scripts/generate_resume_adv.rb` -> `Massimo_Caliman_Resume_Advanced.docx`
     * `ruby scripts/generate_resume_eu.rb` -> `Massimo_Caliman_Resume_Europass.docx`
  3. Verificare che i file `.docx` siano stati aggiornati correttamente prima di effettuare il commit.

---

## 4. Layout, CSS e Personalizzazioni

* **Integrità del Tema**: Il sito utilizza il tema `so-simple-theme`. Eventuali personalizzazioni grafiche o di layout devono essere implementate sovrascrivendo i file all'interno di `_includes/` o `_layouts/` localmente, senza modificare direttamente la gemma del tema.
* **Qualità Estetica**: Qualsiasi modifica all'interfaccia utente deve essere visivamente curata, reattiva (responsive) e in linea con l'estetica esistente del sito.
