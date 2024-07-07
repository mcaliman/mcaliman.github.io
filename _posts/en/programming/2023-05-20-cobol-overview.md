---
layout: post
lang: en
title: "Cobol overview"
excerpt: ""
date: 2023-05-20 05:25:44
revised: true
category: Programming 
tags: ["Cobol","Programming Languages"]
permalink: /cobol/overview/
comments: false
share: false
published: true
---

> Computers are good at following instructions, but not at reading your mind.
>
> – Donald Knuth


COBOL (an acronym for COmmon Business-Oriented Language) is a programming language developed in 1959 by a working group composed of elements of the US industry and some US government agencies to create a programming language suitable for processing commercial data. Grace Murray Hopper played a primary role in the development and design of the language.

COBOL is a procedural programming language, business-oriented and with strong typing. Its syntax is verbose and descriptive, trying to approach natural language. A COBOL program is divided into four divisions: identification, environment, data and procedure.

```COBOL
IDENTIFICATION DIVISION.
PROGRAM-ID. COMPOUND-INTEREST.

ENVIRONMENT DIVISION.

DATA DIVISION.

WORKING-STORAGE SECTION.
01  INITIAL-AMOUNT PIC 9(5)V99 COMP-3.
01  INTEREST-RATE PIC 9(3)V9 COMP-3.
01  YEARS PIC 9(4) COMP-3.
01  FINAL-AMOUNT PIC 9(7)V99 COMP-3.

PROCEDURE DIVISION.

    DISPLAY "Enter the initial amount: "
    ACCEPT INITIAL-AMOUNT
    DISPLAY "Enter the interest rate (as a percentage): "
    ACCEPT INTEREST-RATE
    DISPLAY "Enter the number of years: "
    ACCEPT YEARS

    MOVE INITIAL-AMOUNT TO FINAL-AMOUNT
    PERFORM VARYING YEARS FROM 1 BY 1
        UNTIL YEARS = 0
        COMPUTE FINAL-AMOUNT = FINAL-AMOUNT * (1 + INTEREST-RATE / 100)

    DISPLAY "The final amount after " YEARS " years is: " FINAL-AMOUNT

    STOP RUN.
```


COBOL has undergone continuous evolution: in 1968, 1974 and 1985 the American National Standards Institute (ANSI) defined the Cobol68, Cobol74 and Cobol85 standards, also adopted by the International Organization for Standardization (ISO). With ISO/IEC 1989-2002, started in 1989 and completed in 2002, we have reached the definitive international standard.

Research information online shows that COBOL was still used in 70% of all business transactions in 2013 and 85% of business applications worldwide would have been written in COBOL. Even today many companies are looking for COBOL programmers to replace historical developers because 75% of rewriting processes in a more modern language have proven to be unsuccessful or the cost of replacement is too high to sustain. 

Although I agree that the cost of rewriting can be high and prohibitive in some contexts, I have successfully worked on rewriting several COBOL and RPG programs in Java.

Here are some links to websites that provide information about COBOL:

- [COBOL - Wikipedia](https://en.wikipedia.org/wiki/COBOL)
- [COBOL Programming - TutorialsPoint](https://www.tutorialspoint.com/cobol/index.htm)
- [COBOL Resource Hub - Micro Focus](https://www.microfocus.com/en-us/trend/cobol-resource-hub)

Even if you don’t like the COBOL language (I don’t like it), don’t underestimate the strategic importance of knowing its basics. You too could work on a project to rewrite a COBOL program in your preferred language.
