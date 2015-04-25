---
layout: post
title: Graph Theory Basics, and Speech Recognition with Neural Nets
---

Here are the highlights from this week's ["Talking Machines"](http://www.thetalkingmachines.com/) on twitter at (). Thank you [Thunder](https://github.com/ThunderShiviah/) for turning me on to this awesome podcast! 

The guests talked fast and used a lot of acronyms so bear with me.

Graphs
------

Katherine Gorman and Kyle Adams talked about graph theory and approaches to selecting a model for a given Data Science problem. Kyle recommends trying off-the-shelf implementations of simple algorithms like Logistic Regression, Support Vector Machines, or Random Forests. Graph Limits are an interesting area of research, for dealing with large networks.

You can then branch your decision tree as you discover these two main classes of "difficult problems"

1. Logistic Regrssion will fail on big nonlinearities.
1. a. just add nonlinearities (kernels or transformations) to your LR, SVM
1. b. use neural nets or other nonlinear techniques
2. High dimensionality, has two solutions
2. a. Image processing doesn't reduce the dimensions, just uses convolutional neural nets to segment the dimensions
2. b. Genetics -- shrink most weights down to zero to find strongest influencers 

Probabilistic matrix factorization and SVD are both used for dimension reduction and latent feature identification.

Neural Nets for Speech
----------------------

In the second half they interviewed George Dahl who shook up the world of speech recognition by employing deeper neural nets in place of Gaussian Mixture Models to solve the Merck problem.


[Kaldi](http://kaldi.sourceforge.net/about.html) has recently incorporated neural nets. So we have an open source project to use for state-of-the art LVCSR research.

[Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) and [George Dahl](http://www.cs.toronto.edu/~gdahl/) at Torronto worked on phoenem recognition on [TIMIT](https://en.wikipedia.org/wiki/TIMIT)
Lee Dang at Microsoft understood TIMIT and hired Abdur and George to try their technique on large vocabularies (Bing searches)

"The biggest problems with the current approach are the GMM, HMM, N-gram language model" (everything except the beam search decoder part of the pipeline which is pretty good).

Bioinformatics ignored neural nets until George Dahl and Ruslan (Rus) Salakhutdinov won the Merck challenge on Kaggle.
Russ Sulukudena 15% improvement on baseline by Merck
Bayesean Neural Nets useful on large datasets as opposed to conventional multilayer perceptron Neural Nets.

Alphabet Soup
-------------

LR: Logistic Regression
SVM: Support Vector Machines
FMLLR: ? ? Linear Logistic Regression
VMMI: ?
GMM: Gaussian Mixture Model, first step in speech recognition, creates training set
HMM: Hidden Markhov Model, N-gram language model, 
MCMC: Markov Chain Monte Carlo
MCRBM: Monte Carlo Restricted Boltzman Machine
[TIMIT](https://en.wikipedia.org/wiki/TIMIT): Texas Instruments and Mass. Inst. Tech, speech recognition data set and problem
LVCSR: Large Vocabulary Continuous Speech Recognition
NNLM: Neural Net Language Models
RNN: Recurrent Neural Net
QSAR: Quantitative Structural Activity Relation prediction (the Merck kaggle challenge)
GBRBM: Gaussian Bernouli Restricted Boltzman machine

People
------

Dong Yu fixed hard-coded 1250 limit on 4-bit symbols in the encoder.
Peter Orbans -- network theory
John Hopfield -- went to University of Toronto  
Geoffrey (Geoff) Hinton -- researcher at University of Toronto http://www.cs.toronto.edu/~hinton
Alex Graves -- using RNN for for a language model
Russ Salakhutdinov -- colaborated with Geof and George Dahl on the Merck challenge
[Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) -- collaborator with George Dahl on neural nets in speech recognition

