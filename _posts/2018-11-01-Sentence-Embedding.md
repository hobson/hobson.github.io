---
layout: post
title: Sentence Embedding
---

Sentence embeddings took off in 2017. When Google released their [Universal Sentence Encoder last year](https://static.googleusercontent.com/media/research.google.com/en//pubs/archive/46808.pdf) researchers took notice. Google trained their sentence embedding on a massive corpus of text, everything from wikipedia and news articles to FAQs and forums. And then they refined the accuracy by training it on the Stanford Natural Language Inference corpus. Like word2vec, this enabled NLP enthusiasts to leverage Google's text-scraping and cleaning infrastructure to build their own models using transfer learning. Transfer Learning is just a fancy way by using one model within another. Usually you're just doing "activation" or "inference" with the pretrained model and then using its output as a feature (input) for some other model. 

So is this new embedding any better than the other options? John Christian Fjellestad compiled a nice summary of many of the options, to which I've added the "naive" versions at the top of the lists here. So these lists should progress from earlier to more recent techniques and from less advanced to more advanced.


1. naive word vector embedding [sum](https://github.com/totalgood/nlpia/blob/master/src/nlpia/book/examples/ch06.py)
2. normalized mean of word embeddings: [subtract principal eigenvector](https://github.com/totalgood/nlpia/blob/master/src/nlpia/book/examples/ch06.py)
3. thought vectors (LSTM-based word vector autoencoder)
4. skip thought vectors (next sentence prediction)
5. [Quick-thoughts](https://openreview.net/forum?id=rJvJXZb0W)

And you also have to choose a good word embedding:

1. Word2Vec
2. GloVE
3. FastText
4. [ELMo](http://allennlp.org/elmo)

To do that you need some measure of **good** for your machine learning problem. Fortunately John Fjellestad has coded some machine learning problems that are great for generic **goodness** of a sentence embedding for various problems:

