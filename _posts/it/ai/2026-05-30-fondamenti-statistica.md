---
layout: post
title: "I Fondamenti della Statistica: Media, Mediana, Moda e Deviazione Standard"
excerpt: "Un viaggio intuitivo nei concetti cardine della statistica: indici di posizione centrale (media, mediana, moda) e misure di variabilità (varianza e deviazione standard)."
category: Ai
date: 2026-05-30
comments: true
share: false
mathjax: true
tags: [statistica, matematica, data-science, it]
permalink: /ai/fondamenti-statistica/
categories: ["it", "ai"]
---

Ogni volta che mi trovo davanti a un dataset, la prima cosa che faccio è cercare di capirne la forma: dov'è il centro? Quanto sono sparsi i valori? Sono domande banali, eppure sbagliare qui significa partire col piede sbagliato in qualsiasi analisi successiva, che sia un modello di machine learning o un semplice report.

In questo post metto in ordine i concetti fondamentali della statistica descrittiva.

1. **Indici di Posizione Centrale** — media, mediana, moda
2. **Misure di Dispersione** — varianza ($\sigma^2$) e deviazione standard ($\sigma$)
3. **Calcolo in Excel** — con un file di esempio scaricabile
4. **Calcolo in R** — script completo, con una funzione per la moda

---

### 1. Indici di Posizione Centrale: Media, Mediana e Moda

Dato un insieme di osservazioni $X = \{x_1, x_2, \dots, x_N\}$, la prima domanda che mi pongo è: *qual è il valore che meglio rappresenta questo gruppo?*

#### La Media Aritmetica ($\mu$)
È il classico "valore medio" che tutti conosciamo fin dalle elementari. Sommo tutti i valori e divido per quanti sono:

$$\mu = \frac{1}{N} \sum_{i=1}^{N} x_i$$

Se la notazione con la sommatoria ($\sum$) non ti è familiare, si tratta semplicemente di questo:

$$\mu = \frac{x_1 + x_2 + x_3 + \dots + x_N}{N}$$

**Esempio**: con i voti $\{2, 4, 4, 6\}$, la media viene:
$$\mu = \frac{2 + 4 + 4 + 6}{4} = \frac{16}{4} = 4$$

Attenzione però: la media è sensibilissima ai valori estremi (*outliers*). Basta un singolo dato anomalo per spostarla parecchio.

#### La Mediana
Prendo i dati, li metto in fila dal più piccolo al più grande, e guardo quale sta al centro. Se sono in numero pari, faccio la media dei due centrali. La cosa bella della mediana è che è **robusta**: un outlier non la sposta di una virgola.

#### La Moda
È il valore che compare più spesso. A differenza degli altri due indici:
* Funziona anche con dati non numerici (es. "qual è il colore preferito?").
* Può non essere unica: due picchi → **bimodale**, più di due → **multimodale**.
* Se ogni valore compare una volta sola, semplicemente non c'è moda (distribuzione **amodale**).

---

### 2. Misure di Dispersione: Varianza ($\sigma^2$) e Deviazione Standard ($\sigma$)

Sapere dov'è il centro non basta. Due gruppi possono avere la stessa media ma comportarsi in modo completamente diverso: uno con valori tutti vicini, l'altro sparso ovunque.

#### La Varianza ($\sigma^2$)
L'idea è semplice: per ogni dato, calcolo quanto dista dalla media, elevo al quadrato (così gli scarti negativi non si cancellano con quelli positivi) e poi faccio la media di tutti questi quadrati:

$$\sigma^2 = \frac{1}{N} \sum_{i=1}^{N} (x_i - \mu)^2$$

Senza la sommatoria, la stessa cosa si scrive così:

$$\sigma^2 = \frac{(x_1 - \mu)^2 + (x_2 - \mu)^2 + \dots + (x_N - \mu)^2}{N}$$

**Esempio**: riprendendo i voti $\{2, 4, 4, 6\}$ con media $\mu = 4$:
$$\sigma^2 = \frac{(2-4)^2 + (4-4)^2 + (4-4)^2 + (6-4)^2}{4} = \frac{4 + 0 + 0 + 4}{4} = 2$$

Il quadrato ha anche un effetto collaterale utile: penalizza di più gli scarti grandi rispetto a quelli piccoli.

#### La Deviazione Standard ($\sigma$)
Il problema della varianza è che è espressa in unità al quadrato (se misuro in metri, la varianza è in $m^2$). Per tornare all'unità originale, ne estraggo la radice quadrata — ed ecco la deviazione standard:

$$\sigma = \sqrt{\sigma^2} = \sqrt{\frac{1}{N} \sum_{i=1}^{N} (x_i - \mu)^2}$$

In pratica, è semplicemente la radice quadrata della varianza:

$$\sigma = \sqrt{\sigma^2}$$

**Esempio**: con varianza $\sigma^2 = 2$, ottengo:
$$\sigma = \sqrt{2} \approx 1.41$$

Per avere un'intuizione concreta, in una distribuzione Gaussiana:
* il $68\%$ circa dei dati cade entro $\pm 1\sigma$ dalla media
* il $95\%$ entro $\pm 2\sigma$
* il $99.7\%$ entro $\pm 3\sigma$

---

### 3. Come Calcolare questi Indici in Excel

Se i dati sono in un foglio Excel (supponiamo nell'intervallo `A1:A100`), queste sono le funzioni da usare

> [!NOTE]
> Ho preparato anche un file Excel con un dataset di prova e tutte le formule già impostate, pronto da scaricare:
> **[Scarica l'Excel di Esempio (esempio_calcolo_statistico.xlsx)]({{ '/assets/files/esempio_calcolo_statistico.xlsx' | relative_url }})**

| Indice Statistico | Funzione Excel (Italiano) | Excel Function (English) | Descrizione |
| :--- | :--- | :--- | :--- |
| **Media** ($\mu$) | `=MEDIA(A1:A100)` | `=AVERAGE(A1:A100)` | Calcola la media aritmetica semplice. |
| **Mediana** | `=MEDIANA(A1:A100)` | `=MEDIAN(A1:A100)` | Restituisce il valore centrale della distribuzione. |
| **Moda** | `=MODA.SNG(A1:A100)` | `=MODE.SNGL(A1:A100)` | Restituisce il valore più frequente. |
| **Varianza** ($\sigma^2$) | `=VAR.POP(A1:A100)` | `=VAR.P(A1:A100)` | Calcola la varianza per l'intera popolazione. |
| **Deviazione Standard** ($\sigma$) | `=DEV.ST.POP(A1:A100)` | `=STDEV.P(A1:A100)` | Calcola la deviazione standard per l'intera popolazione. |

> [!TIP]
> Se stai lavorando su un **campione** e non sull'intera popolazione, per la varianza e la deviazione standard ricordati di utilizzare le funzioni campionarie equivalenti:
> * **Varianza campionaria**: `=VAR.C(A1:A100)` in italiano o `=VAR.S(A1:A100)` in inglese.
> * **Deviazione standard campionaria**: `=DEV.ST.C(A1:A100)` in italiano o `=STDEV.S(A1:A100)` in inglese.

---

### 4. Come Calcolare questi Indici in R

R è il mio strumento di riferimento quando faccio analisi statistica pura. C'è solo una trappola da conoscere:

> [!IMPORTANT]
> In R, `mode()` restituisce il *tipo* dell'oggetto (es. `"numeric"`), **non** la moda statistica. Per quella serve una funzione ad hoc. Inoltre `var()` e `sd()` usano di default il denominatore $N-1$ (versione campionaria).

Ecco lo script completo:

```R
# Definisco il dataset di esempio (lo stesso del file Excel)
dati <- c(12, 15, 15, 17, 18, 20, 20, 20, 22, 23, 24, 25, 25, 26, 28, 30, 31, 35, 40, 50)

# 1. Indici di Posizione Centrale
media   <- mean(dati)
mediana <- median(dati)

# Funzione personalizzata per calcolare la moda statistica
calcola_moda <- function(x) {
  tabella_frequenze <- table(x)
  moda_valori <- names(tabella_frequenze)[tabella_frequenze == max(tabella_frequenze)]
  return(as.numeric(moda_valori))
}
moda <- calcola_moda(dati)

# 2. Misure di Dispersione Campionarie (con denominatore N-1)
varianza_campionaria <- var(dati)
dev_std_campionaria  <- sd(dati)

# 3. Misure di Dispersione per la Popolazione (con denominatore N)
n <- length(dati)
varianza_popolazione <- var(dati) * (n - 1) / n
dev_std_popolazione  <- sd(dati) * sqrt((n - 1) / n)

# Stampo i risultati in console
cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("Moda:", moda, "\n")
cat("Varianza Popolazione (sigma^2):", varianza_popolazione, "\n")
cat("Deviazione Standard Popolazione (sigma):", dev_std_popolazione, "\n")
cat("Varianza Campionaria (s^2):", varianza_campionaria, "\n")
cat("Deviazione Standard Campionaria (s):", dev_std_campionaria, "\n")
```


### Conclusioni

Media, mediana, moda, varianza e deviazione standard: niente di complicato, ma sono i mattoni su cui si costruisce tutto il resto. Ogni volta che inizio un'analisi, parto sempre da qui. Se questi concetti sono chiari, il salto verso la statistica inferenziale e il machine learning diventa molto più naturale.

---

### Fonti e Letture Consigliate
* [Statistica Descrittiva - Wikipedia](https://it.wikipedia.org/wiki/Statistica_descrittiva)
* [Deviazione Standard - Wikipedia](https://it.wikipedia.org/wiki/Deviazione_standard)
