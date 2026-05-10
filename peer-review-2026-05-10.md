# Peer Review Tracking - 2026-05-10

## Block 1: English Main Pages (DONE)

### 1. `pages/en/mcaliman.md`
- **Grammar & Flow:** 
  - "I'm working as IT specialist since 1995" -> "I have been working as an IT specialist since 1995".
  - "others many languages" -> "many other languages".
  - "Italian Association member" -> "member of the Italian Java Association".
- **Formatting:** The skills section and HTML elements (`div`, `span`) are well implemented for the Jekyll layout.
- **Action:** Apply grammar fixes to improve the professional Tone of Voice.

### 2. `pages/en/resume.md`
- **Grammar & Typos:**
  - Line 103 contains a duplicated block of text: *"Java Developer for Studio Balbi S.u.r.l., Software House and IBM Business Partner in Genoa..."* which repeats exactly what was written just before it.
  - "Presentd" -> "Presented" (appears multiple times under "Talks").
  - "Operative systems" -> "Operating Systems".
  - "fameworks" -> "frameworks" (Line 41).
- **Formatting:** Consistent usage of Markdown headers.
- **Action:** Fix typos and remove the duplicated text block to ensure a polished professional resume.

### 3. `pages/en/privacy-policy.md`
- **Grammar & Flow:** Excellent. Clear, concise, and professional.
- **Action:** Nessuna modifica necessaria.

### 4. `pages/en/cookie-policy.md`
- **Grammar & Flow:** Excellent. Standard legal wording used correctly.
- **Action:** Nessuna modifica necessaria.

### 5. `pages/en/terms-of-service.md`
- **Grammar & Flow:** Very professional, good use of disclaimers for a personal blog.
- **Action:** Nessuna modifica necessaria.

---

## Block 2: Italian Main Pages & First Posts (DONE)

### 1. `pages/it/privacy-policy.md`
- **Grammar & Flow:** Excellent, well translated and legally sound.
- **Action:** Nessuna modifica necessaria.

### 2. `pages/it/cookie-policy.md`
- **Grammar & Flow:** Perfect, fully compliant and professional.
- **Action:** Nessuna modifica necessaria.

### 3. `pages/it/terms-of-service.md`
- **Grammar & Flow:** Good use of disclaimers. Clear language.
- **Action:** Nessuna modifica necessaria.

### 4. `_posts/en/programming/2014-07-09-my-thoughts-on-programming-languages-01.md`
- **Grammar & Flow:** 
  - "The syntax is essential, clear and has no syntactic frills" -> "The syntax is minimalistic, clear, and has no syntactic frills" ("essential" in this context sounds like an Italianism for "essenziale", meaning basic/minimal).
- **Formatting:** Good use of markdown.
- **Action:** Improve vocabulary for a more native English tone.

### 5. `_posts/en/programming/2014-07-10-my-thoughts-on-programming-languages-02.md`
- **Grammar & Flow:**
  - "C++, C,C# and Ada." -> "C++, C, C#, and Ada." (missing space after comma).
- **Action:** Fix punctuation.


## Block 3: Programming Posts (Part 1) (DONE)

### 1. `_posts/en/programming/2014-07-11-my-thoughts-on-programming-languages-03.md`
- **Grammar & Flow:** 
  - Il primo paragrafo è una lunghissima frase (run-on sentence) divisa solo da virgole. È necessario dividerla in più frasi con il punto fermo per renderla leggibile.
- **Action:** Rewrite the run-on sentence for better readability.

### 2. `_posts/en/programming/2014-07-12-my-thoughts-on-programming-languages-04.md`
- **Grammar & Flow:** 
  - La riga 25-26 contiene una duplicazione evidente dello stesso concetto: *"The Operating Systems, compilers... are written in C or C++. you can use it to accomplish anything. Operating Systems the compilers..."*.
- **Action:** Remove duplicated text and fix capitalization.

### 3. `_posts/en/programming/2014-08-14-considerations-related-to-recursion.md`
- **Grammar & Flow:**
  - *"usually realised with constructs such as `for`, `foreach` and `white`."* -> Deve essere `while`.
- **Action:** Fix typo.

### 4. `_posts/en/programming/2014-09-06-about-the-limits-of-the-calculable.md`
- **Grammar & Flow:** Excellent, clean and precise.
- **Action:** Nessuna modifica necessaria.

### 5. `_posts/en/programming/2014-09-24-java-dictionaries.md`
- **Grammar & Flow:**
  - L'articolo è scritto interamente in inglese, ma alla riga 145 c'è una frase dimenticata in italiano: *"associa il valore specificato alla chiave passata."*
- **Action:** Translate line 145 to English ("associates the specified value with the specified key").


## Block 4: Programming Posts (Part 2) (DONE)

### 1. `_posts/en/programming/2014-09-28-java-indexed-structures.md`
- **Grammar, Flow & Typos:** 
  - Sono rimasti dei residui dall'italiano: l'abbreviazione "t.c." (tale che) andrebbe tradotta in "s.t." (such that). Idem per i verbi "Place/Pose" che suonerebbero meglio come "Set".
  - Il termine matematico "ThetaGrande(n)" andrebbe reso più standard ("Theta(n)" o "O(n)").
  - Manca una parentesi chiusa alla fine della riga 44.
- **Action:** Translate Italian residuals ("t.c." -> "s.t.", "Pose/Place" -> "Set"), fix "Tetagrande", and close the parenthesis.

### 2. `_posts/en/programming/2014-09-29-linked-list.md`
- **Formatting & Typos:**
  - Diversi blocchi di codice non si aprono/chiudono correttamente a causa di apici inversi (backtick) mancanti (` ``bash ` invece di ` ```bash ` e ` ``java ` invece di ` ```java `).
  - Anche qui compare "ThetaGrande (n)".
- **Action:** Fix all broken markdown code blocks and normalize "ThetaGrande".

### 3. `_posts/en/programming/2014-09-30-java-stack.md`
- **Grammar & Typos:**
  - Nelle classi citate alla riga 51 manca sistematicamente il suffisso "ue": compare `DelayQue`, `PriorityQue`, `SynchronousQue`, ecc. È un palese errore di troncamento durante la battitura.
  - La notazione logica `S=O` andrebbe corretta in `S=Ø` o `S=\emptyset` per l'insieme vuoto.
- **Action:** Fix Java class names and empty set notation.

### 4. `_posts/en/programming/2014-10-01-java-queue.md`
- **Grammar & Typos:**
  - Frase tradotta male: *"Stacks or Stacks, another of the most common basic types is the Queue or Queue"* -> Ridondante, basta "Stacks... is the Queue".
  - Alla riga 28 c'è un'interfaccia Java chiamata `public interface Coda<E>`. Siccome il post è in inglese, il codice dovrebbe essere in inglese (`Queue<E>`).
- **Action:** Remove redundancy and rename Java interface to `Queue`.

### 5. `_posts/en/programming/2014-10-03-indexed-data-structures.md`
- **Typos:**
  - Alla riga 16 c'è un typo banale: `ArratList` invece di `ArrayList`.
- **Action:** Fix typo.

---
**Note per l'utente:**
Ho completato l'analisi del **Blocco 4**. Questi articoli sulle strutture dati sono molto tecnici, ma proprio per questo saltano all'occhio i "residui" di traduzione dall'italiano all'inglese (es. usare "t.c." invece di "s.t.", nominare una classe Java "Coda" invece di "Queue" in un post inglese) e i problemi di formattazione del markdown con i blocchi di codice rotti. Inoltre ci sono parecchi nomi di classi della JDK troncati in malomodo (es. `PriorityQue`).

Attendo la tua approvazione per applicare i fix e sistemare definitivamente tutti questi aspetti tecnici!
