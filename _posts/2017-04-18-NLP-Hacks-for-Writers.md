---
layout: post
title: NLP Hacks for Writers
---

# NLP Hacks for Writers

While putting together [_NLP in Action_](https://www.manning.com/books/natural-language-processing-in-action) we found some handy NLP tools to make writing a little easier, more fun. In addition to employing a document summarizer based on Dirichlet Allocation to help us compose summary and introductory sentences, grammar and spell-checkers, code linters, etc, there are easy-to-use online implementations of sophisticated NLP tools that all writers can use. Here are 4 that we went back to time and again.

## [Thomas Mikolov's Word2Vec](http://bionlp-www.utu.fi/wv_demo/)

- [Word2Vec Javascript implementation for 10k common words](http://turbomaze.github.io/word2vecjson/)
- [7 Word2Vec models including GoogleNewsNegative300](http://bionlp-www.utu.fi/wv_demo/)
- [Gensim's demo of the GoogleNews Word2Vec model](https://rare-technologies.com/word2vec-tutorial/#bonus_app)

I loved using Word2Vec to find synonyms for technical and business terms, rather than using a thesaurus. It was great to see what machines think of words rather than going to `dictionary.com`  where you only see what human linguists think. The mix of synonyms was different from what you'd get in a conventional thesaurus. And there were a lot more modern technical terms than what you'd find in WordNet or similar human-curated word similarity models. Plus we could do math on words to compose "synonyms" from combinations of other words, something no conventional thesaurus (or even Princeton's [WordNet](http://wordnet.princeton.edu/) can do. Check out [our book, just released today](https://www.manning.com/books/natural-language-processing-in-action) for more on the magic of word2vec.

## [Princeton's WordNet](http://ws4jdemo.appspot.com/?mode=s&s1=machine+learning&s2=artificial+intelligence)

WordNet is great for validating more conventional English words to make sure their formal definition similarity matches their co-use statistics in Google News articles.

## [Google Trends](https://trends.google.com)

And Google Trends was great for calibrating my impression of global trends for various [NLP approaches](https://t.co/4xIZJjtx38), like the resurgence of deep learning and AI perhaps being driven by data-based statistical approaches becoming more viable at the expense of grammar-based approaches.

## [Google's Ngram Viewer](https://books.google.com/ngrams)

In addition to being a massive source of 5-grams for unsupervised training of word embeddings and multi-word expressions or named-entity recognition, the N-gram viewer is also great for just figuring out the most common way to say something. I used it to learn about the phrase "beneath the words" (analogous to "between the lines") and discovered that it's actually a pretty popular new way to talk about the subtlties of word meaning. 

## NLP Tools for Coders

These tools are great for authors that also know a little bit of python.


