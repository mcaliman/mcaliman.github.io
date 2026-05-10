# Peer Review Tracking - Massive Run (Branch peer-review-2026-05-10-2)

This document tracks the massive peer review of 50 posts, broken down into 5 Macro-Blocks of 10 posts each.

## Macro-Block 1 (Posts 1-10) (DONE)

### 1. `2014-10-05-java-trees.md`
- **Grammar & Formatting:**
  - Backtick errati alla riga 22 (` `such that `(u,v)` `).
  - Alla riga 54 c'è un'intera frase in italiano (*"A questo punto passare dalla specifica in pseudocodice ad una in linguaggio Java è immediato."*) in un post in inglese!
- **Action:** Fix backticks and translate the Italian sentence to English.

### 2. `2014-10-06-indexed-representations-tree.md`
- **Typos:**
  - "numerable" alla riga 29 è preferibile come "numberable" o "numbered".
- **Action:** Change to "numbered".

### 3. `2014-10-07-linked-representations-tree.md`
- **Typos & Punctuation:**
  - Alla riga 16: "idicised ones" invece di "indexed ones".
  - Alla riga 24 c'è una frase molto confusa e priva di punteggiatura: *"In the case from 2 if a child is absent we place the pointer to Null Required space O(n*d) which for d constant is O(n)"*.
- **Action:** Fix typo and rewrite line 24 for clarity and correct punctuation.

### 4. `2014-10-10-generic-visit-algorithm-for-a-tree.md`
- **Encoding Issues:**
  - Lo pseudocodice ha caratteri corrotti trasformati in `?` (es. `S ? { r }`, `while S ? Ø do`, `S ? S ? { children of u}`). Molto probabilmente erano frecce di assegnazione (`←`), disuguaglianze (`≠`) e unioni (`∪`).
- **Action:** Restore the correct mathematical/algorithmic symbols.

### 5. `2014-10-12-depth-first-search-tree.md`
- **Encoding & Grammar:**
  - Anche qui ci sono caratteri corrotti nello pseudocodice (`u ? S.pop()`, `if u ? null`).
  - Le righe 32-33 contengono una "run-on sentence" enorme e senza punteggiatura.
- **Action:** Restore symbols and split the run-on sentence.

### 6. `2014-10-14-breadth-first-search-tree.md`
- **Encoding:**
  - Stessi caratteri corrotti `?` nello pseudocodice.
  - Manca la chiusura dello pseudocodice alla fine (`end` o `od`).
- **Action:** Restore symbols and close the algorithm block.

### 7. `2016-01-02-strategy-pattern-java-examples.md`
- **Status:** Clean. No actions needed.

### 8. `2016-01-03-chain-of-responsibility-pattern-java-examples.md`
- **Typos:**
  - Errore esilarante nel titolo del Front Matter: `title: "The Chain Of Responsibilityeton design pattern"`. Un chiaro errore di copia-incolla dalla parola "Singleton"!
  - Nell'excerpt c'è scritto "CoF" invece di "CoR" (Chain of Responsibility).
- **Action:** Fix title and excerpt.

### 9. `2016-01-03-interpreter-pattern-java-examples.md`
- **Grammar:**
  - Riga 16: *"add important knowledge... which are always covered"* -> deve essere al singolare *"adds... which is..."* riferito a "learning".
- **Action:** Fix subject-verb agreement.

### 10. `2016-01-03-singleton-pattern-java-examples.md`
- **Formatting:**
  - Il tag `modified:` è duplicato due volte nel Front Matter (righe 5 e 9).
- **Action:** Remove the duplicate `modified` field.

---
**Note per l'utente:**
Ho analizzato i primi 10 post! Ci sono scoperte notevoli: un'intera frase rimasta in italiano, caratteri speciali "rotti" (`?` al posto delle freccine negli algoritmi in pseudocodice), e persino un pattern "Responsibilityeton" nato da un mix fortuito tra "Chain of Responsibility" e "Singleton" durante un copia-incolla.


## Macro-Block 2 (Posts 11-20) (DONE)

### 11. `2016-01-03-visitor-pattern-java-examples.md`
- **Status:** Clean. Added tag.

### 12. `2016-01-13-state-pattern-java-examples.md`
- **Typos:**
  - "lose-coupled" alla riga 25 -> "loosely-coupled".
  - Il nome della classe `DraftState` è scritto ovunque come `DarftState` (e la variabile come `darftState`).
- **Action:** Fix "lose-coupled" and "DarftState". Added tag.

### 13-18. Various Theoretical Posts (2018)
- **Status:** Clean. Added tags.

### 19. `2018-04-02-from-cfg-to-pda.md`
- **Formatting:** Spaziature anomale a inizio riga 17.
- **Action:** Fix spaces. Added tag.

### 20. `2018-04-07-turing-machine.md`
- **Grammar:**
  - Residuo italiano alla riga 48: "tale che:" -> "such that:".
- **Action:** Fix translation. Added tag.


## Macro-Block 3 (Posts 21-30) (DONE)

### 21. `2019-03-03-scala-language.md`
- **Typos:**
  - "programmes" (UK) preferibile "programs" (US) per uniformità.
- **Action:** Fix typo. Add tag `peer-review-2026-05-10-3`.

### 22. `2023-05-15-explore-world-artificial-intelligence.md`
- **Markdown:**
  - I link nel testo non usano la sintassi corretta (es. `Resumai [https://www.resumai.com/]`).
- **Action:** Convert to proper Markdown links `[Resumai](https://www.resumai.com/)`. Add tag.

### 23. `2023-05-20-cobol-overview.md`
- **Status:** Clean. Added tag.

### 24. `2023-08-08-understanding-domain-specific-languages.md`
- **Status:** Clean. Added tag.

### 25. `2023-08-11-what-is-an-expert-system.md`
- **Status:** Clean. Added tag.

### 26. `2023-08-11-what-is-an-inference-engine.md`
- **Status:** Clean. Added tag.

### 27. `2023-08-13-passing-parameters-in-programming-languages.md`
- **Typos:**
  - "Procedure" nel titolo dovrebbe essere plurale ("Procedures").
  - "For istance" alla riga 20 -> "For instance".
- **Action:** Fix typos. Add tag.

### 28. `2023-08-14-prolog-expert-system.md`
- **Status:** Clean. Added tag.

### 29. `2023-09-23-introduction-machine-learning.md`
- **Metadata & Grammar:**
  - La `date:` nel Front Matter è "2014-09-23" ma il file è del 2023! Errore di copia-incolla.
  - Incongruenza nella lista ("Facial recognition, is used to..." vs "Speech recognition, used to...").
- **Action:** Fix date to `2023-09-23` and standardize the list. Add tag.

### 30. `2023-10-14-computer-architecture-what-is-it.md`
- **Metadata:**
  - Anche qui la `date:` nel Front Matter è sbagliata ("2014-09-23") anziché "2023-10-14".
- **Action:** Fix date. Add tag.

---
**Note per l'utente:**
Ho analizzato i post da 21 a 30! La scoperta più interessante è che i post del 2023 sul Machine Learning e sull'Architettura avevano la data sbagliata nel Front Matter (erano rimasti al 2014 per via di qualche copia-incolla). C'erano anche dei link Markdown rotti nel post sui tool di AI.

Inoltre, per questo blocco sto usando il tag `peer-review-2026-05-10-3` visto che siamo sul nuovo branch.
Attendo il tuo OK per applicare queste correzioni!


## Macro-Block 4 (Posts 31-40) (DONE)

### 31. `2024-04-27-monads-first-definition.md`
- **Punctuation:**
  - Manca il punto fermo alla fine della riga 34: "power in functional programming" -> "power in functional programming."
- **Action:** Fix punctuation. Add tag `peer-review-2026-05-10-3`.

### 32. `2014-09-01-python-how-to-swap-two-variables-at-once.md`
- **Typos & Syntax:**
  - "with Pyhton just do" -> "with Python just do".
  - Alla riga 31 c'è una virgola superflua a fine riga: `x,y = y,x,` -> `x,y = y,x`.
- **Action:** Fix typo and syntax. Add tag.

### 33. `2019-02-25-python-download-remote-files-1.md`
- **Typos:**
  - "matra" alla riga 14 -> "mantra".
- **Action:** Fix typo. Add tag.

### 34. `2019-03-05-python-download-remote-files-2.md`
- **Status:** Clean. Added tag.

### 35. `2020-06-14-python-howto-install-linux.md`
- **Status:** Clean. Added tag.

### 36. `2020-12-19-python-restore-remote-database.md`
- **Status:** Clean. Added tag.

### 37. `2023-04-24-python-backup-script-1.md`
- **Status:** Clean. Added tag.

### 38. `2023-04-24-python-backup-script-2.md`
- **Status:** Clean. Added tag.

### 39. `2016-01-10-r-lang-intro-1.md`
- **Grammar & Localization:**
  - Alla riga 86, l'output in un post in inglese è rimasto in italiano: `Errore: oggetto "x" non trovato` -> `Error: object "x" not found`.
  - Alla riga 105 c'è una frase parzialmente duplicata dalla riga precedente ("and then with `ls()` get the list...").
- **Action:** Fix output language and remove duplicate sentence. Add tag.

### 40. `2016-01-15-r-lang-flow-control.md`
- **Status:** Clean. Added tag.

---
**Note per l'utente:**
Ho analizzato i post da 31 a 40 (Python script, R language basics, Monads)!
Ho trovato piccoli refusi ("Pyhton", "matra"), una virgola di troppo nell'assegnamento multiplo in Python (`x,y = y,x,`), e un po' di italiano rimasto in un blocco di output R (`Errore: oggetto "x" non trovato`).

Attendo il tuo OK per applicare queste modifiche!

## Macro-Block 5 (Posts 41-50) (DONE)

### 41. `2023-01-01-r-lang-1.md`
- **Status:** Clean. Added tag.

### 42. `2026-05-01-matematica-per-intelligenza-artificiale.md`
- **Status:** Clean. Added tag.

### 43. `2003-01-01-java-essential-features.md`
- **Status:** Clean. Added tag.

### 44. `2003-01-02-java-variables.md`
- **Status:** Clean. Added tag.

### 45. `2003-02-03-java-constants.md`
- **Status:** Clean. Added tag.

### 46. `2003-03-01-java-array.md`
- **Status:** Clean. Added tag.

### 47. `2003-03-02-java-introducing-oop.md`
- **Status:** Clean. Added tag.

### 48. `2017-06-01-csharp-null-coalescing-operator-in-java.md`
- **Status:** Clean. Added tag.

### 49. `2017-08-15-wsimport-webservice-dot-net-2-0.md`
- **Status:** Clean. Added tag.

### 50. `2017-09-16-include-external-jar-on-my-netbeans-project.md`
- **Status:** Clean. Added tag.

---
**Note per l'utente:**
Ho analizzato gli ultimi 10 post (da 41 a 50)! Questo blocco era molto pulito (molti post storici su Java e alcuni più recenti su R e AI). Non ci sono correzioni sostanziali da fare al testo, ma andrà aggiunto a tutti il tag `peer-review-2026-05-10-3`.

Con questi, siamo a **40 file già revisionati e committati**, e questi ultimi 10 completeranno il target di 50 file!

Attendo il tuo OK per applicare questi ultimi tag e chiudere il ciclo!
