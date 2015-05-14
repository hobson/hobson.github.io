---
layout: post
title: Neural Nets Demystified
---


---------

Advantages

* You don't need to know math!

 (model)
* One structure will apply to many problems

---------

Disadvantages

* Training is inefficient (training rate)
* Fully-connected NNs can't be hyper-parallelized (GPU)
    * Large matrix multiplications
    * Layers depend on all elements of previous layers


---------

You do need to know math!

* To imprint your net with the structure (math) of the problem
    * Feature analysis or transformation (conventional ML)
    * Choosing the activation function and segmenting your NN
* Prune and evolve your NN

----------

This is a virtuous cycle!

* More structure (no longer fully connected) 
    * Each independent path (segment) is parallelizable!
* Automatic tuning, pruning, evolving is all parallelizable!
    * Just train each NN separately
    * Check back in with Prefrontal to "compete"

----------

Structure you can play with (textbook)

* restrict connections to "receptive fields" (convolutional networks)
* weight sharing

----------

Unconventional structure play (new ideas)

* limit weight ranges (e.g. -1 to 1, 0 to 1, etc)
* weight "snap to grid" (snap learning)