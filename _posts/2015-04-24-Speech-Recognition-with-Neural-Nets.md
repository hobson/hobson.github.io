---
layout: post
title: Speech Recognition with Neural Nets
---

Here are the highlights from this week's ["Talking Machines"](http://www.thetalkingmachines.com/) on twitter at (). Thank you [thunder](https://github.com/ThunderShiviah/) for turning me on to this awesome podcast! This is a work in progress, so bear with me. The guests talked fast and used a lot of acronyms.

Katherine Gorman and Kyle Adams talked about graph theory and approaches to selecting a model for a given Data Science problem. George recommends trying off the shelf implementations of simple algorithms like Logistic Regression, Support Vector Machines, or Random Forests. 

Two complications will trip you up at this initial stage:

1. Logistic Regrssion will fail on big nonlinearities.
1. a. just add nonlinearities (kernels to your LR, SVM)
1. b. 
2. High dimensionality, has two solutions
2. a. Image processing doesn't reduce the dimensions, just uses convolutional neural nets to segment the dimensions
2. b. Genetics -- shrink most weights down to zero to find strongest influencers 

In the second half they interviewed George Dahl who shook up the world of speech recognition by employing deeper neural nets in place of Gaussian Mixture Models to solve the Merck problem.

Probabilistic matrix factorization and SVD are both used for dimension reduction and latent feature identification.

References:
Peter Orbans -- network theory
Graph Limits
John Hopfield -- went to University of Toronto  
Geoffrey (Geoff) Hinton -- researcher at University of Toronto http://www.cs.toronto.edu/~hinton
Alex Graves -- using RNN for for a language model

[Abdel-rahman Mohamed](http://www.cs.toronto.edu/~asamir/) and [George Dahl](http://www.cs.toronto.edu/~gdahl/) at Torronto worked on phoenem recognition on [TIMIT](https://en.wikipedia.org/wiki/TIMIT)
Lee Dang at Microsoft understood TIMIT and hired Abdur and George to try their technique on large vocabularies (Bing searches)

The biggest problems with the current approach is the GMM, HMM, N-gram language model, Beam search decoder

FMLLR, VMMI
GMM: Gaussian Mixture Model, first step in speech recognition, creates training set
HMM: Hidden Markhov Model, N-gram language model, 
MCMC: Markov Chain Monte Carlo
MCRBM: Monte Carlo Restricted Boltzman Machine
[TIMIT](https://en.wikipedia.org/wiki/TIMIT): Texas Instruments and Mass. Inst. Tech, speech recognition data set and problem
LVCSR: Large Vocabulary Continuous Speech Recognition
NNLM: Neural Net Language Models
RNN: Recurrent Neural Net
QSAR: Quantitative Structural Activity Relation prediction (the Merck kaggle challenge)

Gaussian Bernouli Restricted Boltzman machine

Dong Yu fixed hard-coded 1250 limit on 4-bit symbols in the encoder.
Kaldi/Caldie

Bioinformatics ignored neural nets until George Dahl and Ruslan (Rus) Salakhutdinov won the Merck challenge on Kaggle.
Russ Sulukudena 15% improvement on baseline by Merck
Bayesean Neural Nets because of large datasets.