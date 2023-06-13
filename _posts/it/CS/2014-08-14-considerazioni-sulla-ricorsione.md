---
layout: post
lang: it
title:  "Considerazioni sulla ricorsione"
excerpt: ""
category: ComputerScience
date:   2014-08-14 22:45:33
tags: [Italian,Programming languages]
comments: true
share: true
---

Nei linguaggi di programmazione la ripetizione di comandi o statement viene realizzata tramite cicli, realizzati normalmente con costrutti del tipo `for`,`foreach` e `white`. Per particolari problemi la ricorsione rappresenta una valida arlternativa, più elegante, naturale  e semplice da realizzare.
Abbiamo la ricorsione quando una funzione (in Java un metodo) richiama se stesso.

Un esempio classico di ricorsione è la funzione fattoriale: dato un numero n si denota con `n!` il risultato del prodotto di tutti i numeri interi da `1` ad `n`, per convenzione il fattoriale di `0`, cioè il `0!` è pari a `1`.

Il fattoriale può essere calcolato ricorsivamente osservando che `!n = n * !(n-1)`.
Un possibile implementazione in Java è la seguente

```java
public static int factorial(int n){
   if(n==0) return 1;
   else return n*factorial(n-1);
}
```


Utilizzando la definizione ricorsiva di un problema ed implementandolo tramite chiamata ricorsiva di un metodo possiamo evitare analisi complesse e l’utilizzo di cicli innestati. In altre parole, non necessariamente rinunciamo all’efficienza e otteniamo codice più leggibile e compatto.

Esistono tre forme di ricorsione

1. lineare
2. binaria
3. multipla

La più semplice è la lineare, un esempio lo abbiamo appena visto: il calcolo del fattoriale. Dal punto di vista della definizione possiamo affermare che siamo in presenza di ricorsione lineare quando i metodi ricorsivi sono definiti in modo tale da effettuare al più una sola chiamata ricorsiva ogni volta che essi sono chiamati.

In altre parole e più formalmente, quando abbiamo schemi di questo tipo.

```java
int m(int i){
   if(g(i) return x;
   return m(f(i) + y;
}
```

Un ulteriore esempio di ricorsione lineare è rappresentato dalla somma di elementi di una lista

```java
int sum(int[] a,n){
   if(n=1) return a[0];
   else sum(a,n-1) + a[n-1]        
}
```

L’inversione di un array, o meglio dell’ordine dei suoi elementi

```java
void reverse(int[] a,i,j){
   if(i<j) {
        swap(a[i],a[j]);
       reverse(a,i+1,j-1);        
   }
   return;        
}
```

Il metodo reverse nella fattispece utilizza la ricorsione lineare e fa uso della ricorsione di coda, cioè la chiamata ricorsiva è l’ultima operazione effettuata dal metodo.

La ricorsione binaria si ha quando si fa uso di due chiamate ricorsive. Un esempio classico è la successione di Fibonacci.

```java
f[0] = 0
f[1] = 1
f[i] = f[i-1] + f[i-2] (per ogni i>1)
```

Un implementazione di esempio in Java è la seguente

```java
int fibonacci(int k){
   if(k<=1) return k;
   else return fibonacci(k-1) + fibonacci(k-2);
}
```

Infine la ricorsione multipla non è che una generalizzazione della ricorsione binaria, in quando si definisce tale quando si fa uso di più di due chiamate ricorsive.

Durante la mia carriera in diverse occasioni ho avuto modo di sentir parlare della ricorsione come e peggio del diavolo, qualcosa di estremamente complesso e pericoloso, ma i danni peggiori personalmente li ho visti causati da metodi iterativi con una mezza dozzina di cicli annidati e condizioni di guardia in costrutti while così complesse da risultare incompresibili, figuariamoci debuggabili.
