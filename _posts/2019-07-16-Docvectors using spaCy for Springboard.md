---
layout: post
title: Docvectors using spaCy for Springboard
---

One of my [Springboard](springboard.com) mentees asked how she should compute document vectors using the word2vec vectors availble within a parsed document object from the spaCy parser. Our

You can do it yourself by summing up all the word vectors:

```python
>>> !python -m spacy download en_core_web_md
>>> import spacy
>>> nlp = spacy.load("en_core_web_md")
>>> docs = ['Hello world!', 'Another doc, another $.', 'Goobye world...']
>>> pd.DataFrame((pd.DataFrame([w.vector for w in nlp(doc)]).sum(axis=0) for doc in docs))
    0     1     2     3     4     5     6    ...   293   294   295   296   297   298   299
0 -0.02  0.66 -0.18 -0.26  0.78 -0.35  0.77  ... -0.23  0.68  0.06  0.40  0.06 -0.58  0.60
1 -0.94  0.83 -0.57  0.33  1.50  0.61 -0.78  ... -0.11 -1.91  0.32 -0.19 -0.38 -1.28 -0.33
2 -0.00  0.47  0.19 -0.43  0.32 -0.31  0.46  ... -0.82  0.25  0.31  0.05  0.07  0.05  0.24
```

Or you can just use the doc vector computed internally by Spacy the exact same way (except Spacy calculates the `.mean()` rather than the `.sum()`:

```python
>>> pd.DataFrame((nlp(doc).vector for doc in docs)).round(2)
    0     1     2     3     4     5     6    ...   293   294   295   296   297   298   299
0 -0.01  0.22 -0.06 -0.09  0.26 -0.12  0.26  ... -0.08  0.23  0.02  0.13  0.02 -0.19  0.20
1 -0.16  0.14 -0.10  0.05  0.25  0.10 -0.13  ... -0.02 -0.32  0.05 -0.03 -0.06 -0.21 -0.06
2 -0.00  0.16  0.06 -0.14  0.11 -0.10  0.15  ... -0.27  0.08  0.10  0.02  0.02  0.02  0.08
[3 rows x 300 columns]
```

Notice that the first document vector computed by spacy is 1/3 the magnitude in each dimension than the sums that we computed for those dimensions, because "Hello world!" tokenizes into 3 tokens 'Hello', 'world', and '!'. So if you replace `sum()` with `mean()`, you should get the exact same values that spacy returns for the document vectors:

```python
>>> pd.DataFrame((pd.DataFrame([w.vector for w in nlp(doc)]).sum(axis=0) for doc in docs))
    0     1     2     3     4     5     6    ...   293   294   295   296   297   298   299
0 -0.01  0.22 -0.06 -0.09  0.26 -0.12  0.26  ... -0.08  0.23  0.02  0.13  0.02 -0.19  0.20
1 -0.16  0.14 -0.10  0.05  0.25  0.10 -0.13  ... -0.02 -0.32  0.05 -0.03 -0.06 -0.21 -0.06
2 -0.00  0.16  0.06 -0.14  0.11 -0.10  0.15  ... -0.27  0.08  0.10  0.02  0.02  0.02  0.08
```

Also, notice that mispelled words that don't exist in the spacy dictionary, like "Goobye" don't crash the loop. Spacy just returns an all-zero vector for those words.

See the [spaCy documentation](https://spacy.io/usage/vectors-similarity) for more details.
