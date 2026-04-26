---
layout: post
title:  "Test MathJax"
excerpt: "Debug post to check MathJax 4 rendering"
category: Debug
date:   2026-04-26
comments: false
share: false
published: true
tags: [test, mathjax]
---

# MathJax 4 Test Page

This page is used to verify that MathJax 4 is correctly loading and rendering formulas with different delimiters.

## 1. Inline Math with Single Dollar
Check if this renders: $x^2 + y^2 = z^2$ (Syntax: `$x^2 + y^2 = z^2$`)

## 2. Inline Math with Double Dollar (Kramdown Style)
Check if this renders: $$a^2 + b^2 = c^2$$ (Syntax: `$$a^2 + b^2 = c^2$$` inside a paragraph)

## 3. Block Math
Check if this renders:
$$
\int_{a}^{b} f(x) \, dx = F(b) - F(a)
$$
(Syntax: `$$` on separate lines)

## 4. Complex Symbols (Turing Machine test)
Check if this renders:
$\langle Q, \Sigma, \Gamma, q_0, B, F \rangle$

## 5. LaTeX Environment
Check if this renders:
\begin{equation}
E = mc^2
\end{equation}

## Debug Info
- Script URL: `https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js`
- Configuration: Check the console for `window.MathJax.version`
