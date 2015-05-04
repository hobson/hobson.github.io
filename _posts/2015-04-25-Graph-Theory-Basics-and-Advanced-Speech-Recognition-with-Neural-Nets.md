---
layout: post
title: Graph Theory Basics, and Speech Recognition with Neural Nets
---

Here are the highlights from this week's ["Talking Machines"](http://www.thetalkingmachines.com/) podcast from [@tlkngmchns](https://twitter.com/tlkngmchns). Thank you [Thunder](https://github.com/ThunderShiviah/) for turning me on to this awesome podcast! 

Graphs (Networks)
-----------------

Kyle Adams (Harvard) started the podcast with an overview of graph theory. The only thing I got out of it was that "graph limits" are a recent area of research in graph theory -- techniques for dealing with large networks.

Where to Start?
---------------

Katherine Gorman and Kyle Adams answered a caller's question about selecting a model for a given Data Science problem. Kyle recommends first trying simple, off-the-shelf implementations of simple algorithms like Logistic Regression, Support Vector Machines, or Random Forests.

Then there are two main forks in the "decision tree" when you encounter a one of the two main classes of "difficult problems."

1. Significant nonlinearities (logistic Regression will fail)
    1. Try adding nonlinearities (kernels or transformations) to your LR, SVM
    2. Pursue neural nets or other nonlinear techniques
2. High dimensionality
    1. If you need all the dimensions (e.g. image processing), use convolutional neural nets to segment the dimensions
    2. If your data is sparsely influential (e.g. bioinformatics) -- shrink most weights down to zero to extract strongest influencers 
    3.  Use probabilistic matrix factorization and SVD extract latent features. 

Neural Nets for Speech
----------------------

In the second half they got to the meat of the podcast, an interview with George Dahl. Dr. Dahl (just defended) shook up the world of speech recognition by employing neural nets in place of Gaussian Mixture Models. He used this technique to win the Kaggle challenge posed by Merck. He later employed this technique to improve upon speech recognition algorithms in Bing at Microsoft.

The open source package [Kaldi](http://kaldi.sourceforge.net/about.html) has recently incorporated neural nets into its speech recognition algorithm. This was the only open source implementation of Dahl's approach that he mentioned. The others are at Microsoft, IBM, and Google.

[Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) and [George Dahl](http://www.cs.toronto.edu/~gdahl/) at Toronto worked on phone recognition for [TIMIT](https://en.wikipedia.org/wiki/TIMIT).
Lee Dang at Microsoft understood TIMIT, a dataset of only a few hours of speech segmented into phones. Phones are actual utterances of phonemes. Lee hired Abdel and George on an internship to try their technique on large vocabularies (Bing searches). It continued to work well once they solved a low level bug in the code, a hard-coded symbol/phone(?) limit of 1250 or 4000 bits.

"The biggest problems with the current pipeline are the GMM, HMM, N-gram language model." Basically, everything except the beam search decoder part of the pipeline "which is pretty good."

Bioinformatics ignored neural nets until George Dahl and Ruslan (Rus) Salakhutdinov won the Merck challenge on Kaggle.
Russ Sulukudena 15% improvement on baseline by Merck
Bayesian Neural Nets useful on large datasets as opposed to conventional multilayer perceptron Neural Nets.

Alphabet Soup
-------------

**FMLLR**: Linear Logistic Regression

**GBRBM**: Gaussian Bernoulli Restricted Boltzmann machine

**GMM**: Gaussian Mixture Model, first step in speech recognition, creates training set

**HMM**: Hidden Markov Model (equivalent to an N-gram language model?)

**LR**: Logistic Regression

**LVCSR**: Large Vocabulary Continuous Speech Recognition

**MCMC**: Markov Chain Monte Carlo

**MCRBM**: Monte Carlo Restricted Boltzmann Machine

**NNLM**: Neural Net Language Models, N-gram Language Model?

**QSAR**: Quantitative Structural Activity Relation prediction (the Merck Kaggle challenge)

**RNN**: Recurrent Neural Net

**SVM**: Support Vector Machines

**[TIMIT](https://en.wikipedia.org/wiki/TIMIT)**: Texas Instruments and Mass. Inst. Tech, speech recognition data set and problem

**VMI?**: Verbmobil-I? VM-I was the first integrated system to perform spontaneous speech to speech translation/transcoding

People
------

* Dong Yu -- fixed hard-coded 1250 limit on 4-bit symbols in the encoder.
* Peter Orbans -- network theory
* John Hopfield -- went to University of Toronto  
[Geoffrey (Geoff) Hinton](http://www.cs.toronto.edu/~hinton) -- researcher at University of Toronto 
* Alex Graves -- using RNN for for a language model
* Russ Salakhutdinov -- collaborated with Geof and George Dahl on the Merck challenge
* [Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) -- collaborator with George Dahl on neural nets in speech recognition

