---
layout: post
title: Graph Theory Basics, and Speech Recognition with Neural Nets
---

Here are the highlights from this week's ["Talking Machines"](http://www.thetalkingmachines.com/) on twitter at (https://twitter.com/tlkngmchns). Thank you [Thunder](https://github.com/ThunderShiviah/) for turning me on to this awesome podcast! 

The guests talked fast and used a lot of acronyms so bear with me.

Graphs
------

Katherine Gorman and Kyle Adams talked about graph theory and approaches to selecting a model for a given Data Science problem. Kyle recommends first trying simple, off-the-shelf implementations of simple algorithms like Logistic Regression, Support Vector Machines, or Random Forests. 

You can then branch your decision tree as you discover these two main classes of "difficult problems"

1. Logistic Regrssion will fail on big nonlinearities.
1. a. just add nonlinearities (kernels or transformations) to your LR, SVM
1. b. use neural nets or other nonlinear techniques
2. High dimensionality, has two solutions
2. a. Image processing doesn't reduce the dimensions, just uses convolutional neural nets to segment the dimensions
2. b. Genetics -- shrink most weights down to zero to find strongest influencers 

Probabilistic matrix factorization and SVD are both used for dimension reduction and latent feature identification. Graph Limits are an area of research in graph theory -- techniques for dealing with large networks.

Neural Nets for Speech
----------------------

In the second half they interviewed George Dahl who shook up the world of speech recognition by employing neural nets in place of Gaussian Mixture Models. He used this technique to when the Kaggle challenge posed by Merck and then later employed this technique to improve upon speech recognition algorithms at Microsoft for Bing.

The open source package [Kaldi](http://kaldi.sourceforge.net/about.html) has recently incorporated neural nets into its speech recognition algorithm. This was the only open source impelementation of Dahl's approach that he mentioned. The others are at Microsoft, IBM, and Google.

[Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) and [George Dahl](http://www.cs.toronto.edu/~gdahl/) at Torronto worked on phone recognition for [TIMIT](https://en.wikipedia.org/wiki/TIMIT).
Lee Dang at Microsoft understood TIMIT, a dataset of only a few hours of speech segmented into phones. Phones are actual uterances of phonemes. Lee hired Abdel and George on an internship to try their technique on large vocabularies (Bing searches). It continued to work well once they solved a low level bug in the code (hardcoded symbol limit of 1250).

"The biggest problems with the current approach are the GMM, HMM, N-gram language model" (everything except the beam search decoder part of the pipeline which is pretty good).

Bioinformatics ignored neural nets until George Dahl and Ruslan (Rus) Salakhutdinov won the Merck challenge on Kaggle.
Russ Sulukudena 15% improvement on baseline by Merck
Bayesean Neural Nets useful on large datasets as opposed to conventional multilayer perceptron Neural Nets.

Alphabet Soup
-------------

FMLLR: ? ? Linear Logistic Regression
GBRBM: Gaussian Bernouli Restricted Boltzman machine
GMM: Gaussian Mixture Model, first step in speech recognition, creates training set
HMM: Hidden Markhov Model, N-gram language model, 
LR: Logistic Regression
LVCSR: Large Vocabulary Continuous Speech Recognition
MCMC: Markov Chain Monte Carlo
MCRBM: Monte Carlo Restricted Boltzman Machine
NNLM: Neural Net Language Models
QSAR: Quantitative Structural Activity Relation prediction (the Merck Kaggle challenge)
RNN: Recurrent Neural Net
SVM: Support Vector Machines
[TIMIT](https://en.wikipedia.org/wiki/TIMIT): Texas Instruments and Mass. Inst. Tech, speech recognition data set and problem
VMI?: Verbmobil-I? VM-I was the first integrated system to perform spontaneous speech to speech translation/transcoding

People
------

Dong Yu -- fixed hard-coded 1250 limit on 4-bit symbols in the encoder.
Peter Orbans -- network theory
John Hopfield -- went to University of Toronto  
[Geoffrey (Geoff) Hinton](http://www.cs.toronto.edu/~hinton) -- researcher at University of Toronto 
Alex Graves -- using RNN for for a language model
Russ Salakhutdinov -- colaborated with Geof and George Dahl on the Merck challenge
[Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) -- collaborator with George Dahl on neural nets in speech recognition

