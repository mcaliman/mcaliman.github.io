---
layout: post
title:  "Turing Machine"
excerpt: "Basic concepts and information on Turing Machines, accepted language, recursively enumerable and recursiv"
category: Programming
date:   2018-04-07
comments: true
share: false
modified: 2024-07-11
published: true
tags: [computer-science, theory, en, Updated]
---
  
> Kleeneliness is next to Gödeliness 

#  Deterministic Turing Machines (DTM)

A Turing Machine (henceforth abbreviated to `TM`) is a sestuple $\langle Q, \Sigma, \Gamma, q_0, B, F \rangle$ where:
* $Q$ set of `states` (finite)
* $\Sigma$ the alphabet of `input`
* $\Gamma$ alphabet of the `tape` $\Sigma \subseteq \Gamma$
* $\delta: Q \times \Gamma \to Q \times \Gamma \times \{L, R\}$ partial function called transition function
* $q_0 \in Q$ initial state
* $B \in (\Gamma \setminus \Sigma)$ `special symbol` (Blank)
* $F \subseteq Q$ set of end states

$\delta(q, X) = \langle q', Y, D \rangle$ where $q'$ is next state, $Y$ overrides $X$ and $D \in \{L, R\}$
a tabular representation can be given by means of a `transition matrix` equivalent to the 5-uple list $\langle q, X, q', Y, D \rangle$ 
the `instantaneous description` (or `configuration`) of a TM via the
triple $\rho = \alpha q \beta$ where:

* $\alpha \in \Gamma^*$ symbols to the left of the head
* $\beta \in \Gamma^*$ symbols to the right of the head
* $q$ head status

Single step of execution:
Let $M = \langle Q, \Sigma, \Gamma, q_0, B, F \rangle$ a TM defines the relation $\rho \vdash_M \rho'$
induced by the transition function $\delta$ defined for cases as follows.
Let $\alpha, \beta \in \Gamma^*$ and $x, y, z \in \Gamma$ we have:

* $\alpha q X \beta \vdash_M \alpha Y q' \beta$     if $\delta(q, X) = \langle q', Y, R \rangle$
* $\alpha q \vdash_M \alpha Y q'$                  if $\delta(q, B) = \langle q', Y, R \rangle$
* $\alpha Z q X \beta \vdash_M \alpha q' Z Y \beta$   if $\delta(q, X) = \langle q', Y, L \rangle$
* $q X \beta \vdash_M q' B Y \beta$                 if $\delta(q, X) = \langle q', Y, L \rangle$

The Reachability Relationship $\vdash_M^*$ between configurations is defined as the reflexive and transitive closure of the relationship $\vdash_M$.
i.e. $\rho \vdash_M^* \rho'$ $\iff$ there is a sequence $\rho_0, \dots, \rho_n$ with $n \ge 0$ tale che:
$\rho_i \vdash_M \rho_{i-1}$ for $i \in [1, n-1]$, $\rho_0 = \rho, \rho_n = \rho'$

# Language accepted by a TM

Let $M = \langle Q, \Sigma, \Gamma, q_0, B, F \rangle$ a TM, the language $L(M) \subseteq \Sigma^*$ accepted by $M$ is defined as:
$L(M) = \{u \in \Sigma^* \mid q_0 u \vdash^* \alpha q \beta, q \in F\}$
on non-accepted strings the computation may not terminate.
Alternative without final states is where the string is accepted $\iff$ the corresponding computation terminates.

# Recursively enumerable languages (r.e.)
A language is r.e. if it is accepted by a TM; on some string it may happen (if not in the language) that the TM does not terminate.

# Recursive languages
A language is recursive if it is accepted by a TM that terminates on every input

Revision: 2026-04-25
