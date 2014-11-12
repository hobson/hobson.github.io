---
layout: post
title: Love Python? Interested in NLP?
---

Here are the highlights of a [tutorial on Natural Language Processing](http://www.hobsonlane.com/pug/) that I gave at the [PDX python user group](http://www.meetup.com/pdxpython/).

At this tutorial we learned how to quickly [count up all the words](http://www.hobsonlane.com/pug/pug/docs/slidedeck-pdxpy/index.html#9) in the US presidential inaugural speeches from an NLTK data set. Thank you, [Lizhong](http://web.mit.edu/lizhong/www/) for introducing me to this interesting historical corpus (set of documents).

Then the fun begins, for both the mathematician and visualization enthusiast. The word counts can be organized into a large, but sparse matrix called an [occurrence matrix](http://www.hobsonlane.com/pug/pug/docs/slidedeck-pdxpy/index.html#11) (or [TFIDF](http://stanford.edu/~rjweiss/public_html/IRiSS2013/text2/notebooks/tfidf.html), in NLTK terminology). Python's [numpy](http://www.numpy.org/) library has plenty of SVD and other matrix manipulation functions that can help you pair this down to the most important terms and documents. 

For this demo, and per the advice of Lizhong, I kept it simple and merely [computed the entropy](https://github.com/hobson/pug/blob/master/pug/nlp/inaugural.py) (randomness) of the word frequency distributions across the speeches, to select the most interesting words. This approach leaves a lot of interesting information behind. 

Search for...

1. ["Latent Semantic Indexing"](http://en.wikipedia.org/wiki/Latent_semantic_analysis)
1. ["Principal Component Analysis"](http://en.wikipedia.org/wiki/Principal_component_analysis)
1. ["Singular Value Decomposition"](http://en.wikipedia.org/wiki/Singular_value_decomposition)

...if you want to try a more sophisticated approach. Hint: 3 of these are the same thing.

You can visualize this a lot of different ways, but two approaches of (Mike Bostock)[http://bl.ocks.org/mbostock] that I like are his ["force directed graph"](http://www.hobsonlane.com/pug/pug/miner/static/occurrence_force_graph.html) and just a plain old [colorized matrix](http://www.hobsonlane.com/pug/pug/miner/static/doc_cooccurrence.html). Click around and see what you think. Can you guess which US Presidents will be the "outliers" in each of these visualizations? Hint: he's Tricky.