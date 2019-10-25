---
layout post
title: Smarter Chatbot
author: Hobson Lane
date: Oct 24, 2019
subtitle: SD Python Monthly Meetup
---

# A Smarter Chatbot

San Diego Python Monthly Meetup
by Hobson Lane
Oct 24, 2019

# Props to **Parul Pandey**

- [tutorial](https://medium.com/analytics-vidhya/building-a-simple-chatbot-in-python-using-nltk-7c8c8215ac6e) and
- [code](https://github.com/totalgood/Building-a-Simple-Chatbot-in-Python-using-NLTK/blob/master/chatbot.py).


# Human Initiative

![ ](dark-transparent-bot-initiative.svg)


# Bot Initiative

![ ](dark-transparent-bot-initiative.svg)

# Language Models

- Bag of Words
- TFIDF
- Word2Vec
- Universal Sentence Encoder

# Bag of Words Vectors (TF)

Term frequency (count):

```python
bow_vectors = [
    {'hello': 1, 'world': 1, '!': 1}
    {'goodbye': 1 'cruel': 2, 'world': 1, '.': 3}
    ]
```

# TFIDF (TF / DF)

```python
bow_vectors = [
    {'hello': 1, 'world': 1, '!': 1}
    {'goodbye': 1 'cruel': 2, 'world': 1, '.': 3}
    ]
```

# Parul's QA Bot


```python
flag=True
print("ROBO: My name is Robo. I will answer your queries about Chatbots. If you want to exit, type Bye!")
while(flag==True):
    user_response = input()
...
    else:
        flag=False
        print("ROBO: Bye! take care..")
```

# WordVec

Single layer neural net (equivalent to PCA):

- predict next word
- predict previous word
- predict word 2 positions ago
- ...

# WordVec Example

```python
nlp = spacy.load('')
doc1 = nlp("Hello world!")
df = pd.DataFrame([term.vector for term in doc],
                  index=[term.text for term in doc])
            0     1    ...       298   299
Hello  2.52e-01  0.10  ... -5.19e-01  0.34
world -6.68e-03  0.22  ...  1.41e-03  0.10
!     -2.66e-01  0.34  ... -6.29e-02  0.16
```

# DocVec Example

```python
doc1 = nlp("Hello world!")
pd.DataFrame(df.sum(), columns=['doc1']).T
       0     1    ...   298  299
doc1 -0.02  0.66  ... -0.58  0.6
```

# DocVec Example

```python
doc2 = nlp('Goodbye cruel cruel world ...')
pd.DataFrame(df2.sum(), columns=['doc2']).T
      0     1    ...   298   299
doc2 -1.4  0.48  ... -0.52 -0.94
```

# SpaCy Rocks!

```python
docvec2 = nlp('Goodbye cruel cruel world ...').vector
pd.DataFrame(docvec2, columns=['doc2']).T
       0    1    ...  298   299
doc2 -0.28  0.1  ... -0.1 -0.19
```

# Universal Sentence Encoder (USE)

Deep LSTM recurrent neural networks trained to:

- Answer questions
- Summarize sentences
- Guess missing words

# Next steps

- Remember state
- Smarter conversation manager
- "Game play" with goal states (user satisfaction)

# Dialog Tree

![ ](headache.png)

# Props to **Alfred Francis**

- [Knowledge - based architecture(AI)](https: // tutorials.botsfloor.com / opensource - ai - chat - bot - framework - with-natural - language - understanding - and-conversational - abilities - 7c6b71e2c461)
- [ai - chatbot - framework](https: // github.com / alfredfrancis / ai - chatbot - framework)
