---
layout: post
lang: en
title:  "Big Data, Data Science, Databases the fundamentals #2"
excerpt: "Before DBMSs, how was it done?..."
category: "Data Science"
date:   2016-06-01 22:45:33
tags: ["Data Science","Big Data","Database"]
comments: false
share: false
---
  
Before DBMSs, how was it done? Or rather how is it still done in many systems still in use? The part of the king was played by operating systems, applications saved to files, in some format, often proprietary, and one or more dedicated applications took care of reading, writing, modifying and deleting the data. This all worked well if everything resided on one machine and did not have to communicate with the rest of the world, i.e. when there were no problems of competing access to data. In general, the problems were redundancy, inconsistency, difficulty in accessing data, concurrent access and data protection.

DBMS systems solved these problems by allowing centralised and shared data representation.

When we talk about BigData we also talk about non-relational NRDBMS or NoSQL databases, without schema, but exactly how can we define the schema or logical schema of a database? As the description of the structure of the database, a high-level abstraction is called a data model. The schema does not tell us what the database contains but how it is made by abstracting the implementation using some high-level formalism, for example, the schema of a phonebook database could be described as: first name (a string of 30), last name(a string of 30), phone (integer of 20)

And when we want to refer to the data and not the structure? In that case, we speak of the database instance, i.e. a set of data at a given time, since databases change over time as a result of insertions, modifications and deletions.



