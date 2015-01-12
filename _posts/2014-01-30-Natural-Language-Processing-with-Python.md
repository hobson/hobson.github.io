---
layout: post
title: Love Python? Interested in NLP?
---

I gave an introduction to [Natural Language Processing with python](http://www.hobsonlane.com/pug/) at the [PDX python user group](http://www.meetup.com/pdxpython/) and showed how to use two of [Bostock](http://bost.ocks.org/mike/)'s awesome graph optimization and visualization tools in his [D3 library](http://d3js.org/). Here's a screenshot of one of my favorites:

![Force-directed-graph-of-word-document-connections]({{ site.baseurl }}/images/word-doc-graph.png)

I showed how to do a quick-and-dirty frequency analysis of the US presidential inaugural speeches (available as one of the stock corpora in the NLTK package). Thank you, [Lizhong](http://web.mit.edu/lizhong/www/) for posing this interesting problem. He's working on an unsupervised classification algorithm that he hopes will be able to classify the presidential speeches by the political party of their speaker. I'm taking my own approach here and don't think it makes sense to expect unsupervised classification to produce any particular clustering that a human could dream up. But I like trying to figure out why the clusters came out the way they did. Check out [the visualizations](). What patterns do you see? Does this match what you expected to see?

Word counts were organized into a large, sparse matrix called an [occurrence matrix](http://www.hobsonlane.com/pug/pug/docs/slidedeck-pdxpy/index.html#11) (or [TFIDF](http://stanford.edu/~rjweiss/public_html/IRiSS2013/text2/notebooks/tfidf.html), in NLTK terminology). Python's [numpy](http://www.numpy.org/) library has plenty of SVD and other matrix manipulation functions that can help you reduce the dimensions of this huge matrix (the total vocabulary in all the speeches) into 100 or so of the most important terms and documents. 

For this demo, and per the advice of Lizhong, I kept it simple and merely [computed the entropy](https://github.com/hobson/pug/blob/master/pug/nlp/inaugural.py) ("surprise" or information content or randomness) of the word frequency distributions across the speeches, to select the most interesting words. This approach leaves a lot of interesting information behind, but it's a quick way to avoid having to chug through a massive SVD. 

Search for...

1. ["Latent Semantic Indexing"](http://en.wikipedia.org/wiki/Latent_semantic_analysis)
1. ["Principal Component Analysis"](http://en.wikipedia.org/wiki/Principal_component_analysis)
1. ["Singular Value Decomposition"](http://en.wikipedia.org/wiki/Singular_value_decomposition)

...if you want to try a more sophisticated approach. Hint: These are all the same basic mathematical operation.

You can visualize this a lot of different ways, but two approaches of (Mike Bostock)[http://bl.ocks.org/mbostock] that I like are his ["force directed graph"](http://www.hobsonlane.com/pug/pug/miner/static/occurrence_force_graph.html) and just a plain old [colorized matrix](http://www.hobsonlane.com/pug/pug/miner/static/doc_cooccurrence.html). Click around and see what you think. Can you guess which US Presidents will be the "outliers" in each of these visualizations? Hint: he's Tricky.