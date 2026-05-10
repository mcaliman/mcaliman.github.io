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
