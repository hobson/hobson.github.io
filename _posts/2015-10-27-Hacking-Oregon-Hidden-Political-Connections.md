---
layout: post
title: Hacking Oregon's Hidden Political Connections
lang: en
revealjs-url: ''  # for absolute path to lib/ and css/ folders use '/'
theme: black
transition: fade  # none/fade/slide/convex/concave/zoom
center: false
---

# [Hacking Oregon's Hidden Political Connections](http://totalgood.github.io/talks/2015-10-27-Hacking-Oregon-Hidden-Political-Connections.html)

- iPython Notebooks: bit.ly/[totalgood](https://github.com/totalgood/talks/tree/master/notebooks)
- by [Hobs](mailto:hobs@totalgood.com?Subject=Hack%20Oregon)

---

## Agenda

1. Pandas as a relational DB

- Identify foreign keys automatically
- Use FKs to do join SQL-like queries

---

## Agenda

2. Intersect large sets

- AM emails in BehindTheCurtain DB?
- 10 GB mysql dump >> dozens of CSVs
- Load 50M emails efficiently
- Intersect emails with public records

---

# Agenda

3. Destructure and Restructure DB

- Why?
- How?
- Restructure (TFIDF)
    - Raw python
    - Sklearn

---

# Agenda

4. TFIDF to detect similarity between records

- cluster Oregon PACs by their "mission"
- d3 force-directed graph of PAC similarity
- compare to DAG of financial transactions

---

# Agenda

5. Measure similarity between similarity matrices

Say: NLP Similarity

vs.

Do: Financial Transactions

---

# 3. Why Destructure a DB: Why?

- Why squish multiple fields into a string?
- You will vectorize later anyway, right?

## Because

- Dimensions are vaguely defined/understood
- Information "smear" across fields/dimensions

---

# 3. Destructure a DB: How?

1. Ignore numbers/dates
2. Stringify each field
3. Stem words
4. Ignore words (are you sure?)
5. Concatenate
6. Split
7. Vectorize/Count

# 3. Restructure the DB: TFIDF

Compute sparse TFIDF

- Explicit python builtins: `Counter`, `defaultdict`
- sklearn

# 4. TFIDF Similarity

Large dimensions are scary

- Everything is far apart
- Euclidean distance is meaningless
- Our brains fail

---

# 4. TFIDF Similarity

Vector distances

- **L_1**, L_2, [L_0,  L_inf, L_sup]
- [Fractional Distance](http://citeseer.ist.psu.edu/viewdoc/download?doi=10.1.1.23.7409&rep=rep1&type=pdf)

---

# 4. TFIDF Similarity

## Cosine Similarity (similarity = 1 / distance)

- Equivalent:
    - Pierson Correlation
    - | **v_1** dot **v_2** | (projection)
    - angle between **v1** and **v2**
- Bounded: [-1, +1]

---

cluster Oregon PACs by their "mission"
- d3 force-directed graph of PAC similarity
- compare to DAG of financial transactions

---

# Thank You!

- [Thunder](mailto:melange.au.bleu@gmail.com?Subject=Hack%20Oregon)
- [Hack Oregon](http://hackoregon.org)
    - Pizza, data, and a cause!
- [Jeremey Tanner](http://jeremytanner.com/)
    - Awesome [PyDx](pydx.org) talk on "Python for Evil"
- [Grimm](mailto:allen@grimmscience.com?Subject=Hack%20Oregon)
- [Total Good](http://totalgood.com)
    - Summer 2015 grant
    - [RFP for Winter 2016](http://totalgood.com/blog/invitation-for-machine-intelligence-grant-proposals-winter-2016/)!

---

