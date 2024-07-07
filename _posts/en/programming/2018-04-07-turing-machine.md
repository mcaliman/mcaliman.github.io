---
layout: post
lang: en
title:  "Turing Machine"
excerpt: "Basic concepts and information on Turing Machines, accepted language, recursively enumerable and recursiv"
category: Programming
date:   2018-04-07 22:45:33
modified: 2019-05-12 22:45:33
tags: ["Turing Machine"]
comments: true
share: false
updated: true
published: true
---
  
> Kleeneliness is next to Gödeliness 

#  Deterministic Turing Machines (DTM)

A Turing Machine (henceforth abbreviated to `TM`) is a t-upa of 6 elements &rang;Q,&Sigma;,&Gamma;,q<sub>0</sub>,B,F&lang;  where
* Q set of `states` (finite)
* &Sigma; the alphabet of `input`
* &Gamma; alphabet of the `tape` &Sigma;&sube;&Gamma;
* &delta;:Q&#x2A2F;&Gamma;&rarr;Q&#x2A2F;&Gamma;&#x2A2F;{L,R} partial function called transition function
* q<sub>0</sub>&isin;Q initial state
* B&isin;(&Gamma;\&Sigma;) `special symbol` (Blank)
* F&sube;Q set of end states`

&delta;(q,X)=&rang;q',Y,D&lang; where q' is next state, Y overrides X and D&isin;{L,R}
a tabular representation can be given by means of a `transition matrix` equivalent to the 5-uple list &rang;q,X,q',Y,D&lang; 
the `instantaneous description` (or `configuration`) of a TM via the
triple &rho;=&alpha;q&beta; where

* &alpha;&isin;&Gamma;* symbols to the left of the head
* &beta;&isin;&Gamma;* symbols to the right of the head
* q head status

if &beta;&ne;&epsilon; the 

Single step of execution:
Let M=&rang;Q,&Sigma;,&Gamma;,q<sub>0</sub>,B,F&lang; a TM defines the relation &rho;&#8866;<sub>M</sub>&rho;'
induced by the transition function &delta; defined for cases as follows.
Let &alpha;,&beta;&isin;&Gamma;* and x,y,z&isin;&Gamma; we have

* &alpha;qX&beta;&#8866;<sub>M</sub> &alpha;Yq'&beta;     se &delta;(q,X)=&rang;q',Y,R&lang;
* &alpha;q&#8866;<sub>M</sub> &alpha;Yq'                  se &delta;(q,B)=&rang;q',Y,R&lang;
* &alpha;ZqX&beta;&#8866;<sub>M</sub> &alpha;q'ZY&beta;   se &delta;(q,X)=&rang;q',Y,L&lang;
* qX&beta; &#8866;<sub>M</sub> q'BY&beta;                 se &delta;(q,X)=&rang;q',Y,L&lang;

The Reachability Relationship &#8866;<sub>M</sub>* between configurations is defined as the reflexive and transitive closure of the relationship &#8866;<sub>M</sub>
i.e. &rho;&#8866;<sub>M</sub>*q' &hArr; there is a sequence &rho;<sub>0</sub>,...,&rho;<sub>n</sub>&ge;0 t.c.
&rho;<sub>i</sub>&#8866;<sub>M</sub>&rho;<sub>i-1</sub> for i&isin;[1,n-1] , &rho;<sub>0</sub>=&rho;<sub>i</sub>,&rho;<sub>n</sub>=&rho;'

# Language accepted by a TM

Let M=&rang;Q,&Sigma;,&Gamma;,q<sub>0</sub>,B,F&lang; a TM, the language L(M)&sube;&Sigma;* accepted by M is defined as
L(M)={u&isin;&Sigma;* | q<sub>0</sub>u&#8866;&alpha;q&beta;,q&isin;F}
on non-accepted strings the computation may not terminate.
Alternative without final states is where the string is accepted &hArr; the corresponding computation terminates.

# Recursively enumerable languages (r.e.)
A language is r.e. if it is accepted by a TM, on some string it may happen (if not in the language) that the TM does not terminate.

# Recursive languages
A language is recursive if it is accepted by a TM that terminates on every input