---
layout: post
title: Hacking Oregon's Hidden Political Connections
lang: en
revealjs-url: ''  # for absolute path to lib/ and css/ folders use '/'
theme: black.css
transition: fade  # none/fade/slide/convex/concave/zoom
center: false
---

# [Hacking Oregon's Hidden Political Connections](http://totalgood.github.io/talks/2015-10-27-Hacking-Oregon-Hidden-Political-Connections.html)

- [Data](http://totalgood.github.io/hackor)
- Code: [bit.ly/hackor-notebooks](https://github.com/totalgood/hackor/tree/master/)
- [RFP](http://totalgood.com/blog/invitation-for-machine-intelligence-grant-proposals-winter-2016/)
- [Hack Oregon](http://hackoregon.com) by [Cat](http://www.zoominfo.com/p/Catherine-Nikolovski/-2111007541)
- [Behind the Curtain](http://behindthecurtain.hackoregon.com) by [Ken](https://www.linkedin.com/in/kwhaler)
- [Force Directed Graph](http://hobsonlane.com/pug/pug/miner/static/pac_nlp_force_graph.html)


by [Hobs](http://totalgood.com)


<sub><sup>v0.0.3</sup></sub>

---

# Agenda:

For Hack Oregon we explored the data in unusual ways

1. Pandas as a DB
2. Find Connections (FKs, PKs, *other* DBs)
3. TFIDF on a DB table
4. TFIDF similarity
5. Similarity Similarity

# Intro: 1

Pandas as a relational DB

- Identify foreign keys automatically
- Use FKs to do join SQL-like queries

---

# Intro: 2

Intersect large sets

- AM emails in BehindTheCurtain DB?
- 10 GB mysql dump >> dozens of CSVs
- Load 50M emails efficiently
- Intersect emails with public records

---

# Intro: 3

Restructure a DB

- Why?
- How?
- Restructure (TFIDF)
    - Raw python
    - Sklearn

---

# Intro: 4

TFIDF to detect similarity between records

- cluster Oregon PACs by their "mission"
- d3 force-directed graph of PAC similarity
- compare to DG of financial transactions

---

# Intro: 5

Similarity between similarity matrices

**SAY**  
(TFIDF)

vs.

**DO**  
(Transactions)

---

# 3. Restructure DB

## Why?

- Squish fields into a string?
- Vectorizing later anyway, right?

## Because

- Dimensions are vaguely defined/understood
- Information "smear" across fields/dimensions

---

# 3. Restructure DB: How?

1. Ignore numbers/dates
2. Stringify each field
3. Stem words
4. Ignore words (are you sure?)
5. Concatenate
6. Split
7. Vectorize/Count

# 3. Restructure DB: TFIDF

- Must be sparse to fit in memory
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

# 5. Similarity Similarity

Cluster Oregon PACs by their "mission"

- d3 force-directed graph of PAC similarity
- compare to DG of financial transactions

---

# Thank You!

- [Thunder](http://github.com/ThunderShiviah)
- [Grimm](https://github.com/TheGrimmScientist)
- [Cat](https://github.com/catnik/) and [Hack Oregon](http://hackoregon.org)
    - Pizza, data, and a cause!
- [Jeremey Tanner](http://jeremytanner.com/)
    - [PyDx](pydx.org) talk "Python for Evil"
- [Total Good](http://totalgood.com)
    - Summer 2015 grant
    - [Open RFP](http://totalgood.com/blog/invitation-for-machine-intelligence-grant-proposals-winter-2016/)!

---

