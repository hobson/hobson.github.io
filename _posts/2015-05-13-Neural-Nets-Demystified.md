---
layout: post
title: Neural Nets Demystified
---

Here are some thoughts about the upcoming PDX Data Science talk ["Neural Nets Demystified."](/Data-Science-Meetup--Neural-Nets-Demystified/)

---------

Advantages

* Easy
    * You don't need to know math!
* General
    * One model can apply to many problems
* Advanced
    * They achieve the best results

---------

Disadvantage #1: Slow training

* 24+ hr for Kaggle example on laptop
* 90x30x20x10 model degrees freedom
    + 90 input dimensions (regressors)
    + 30 "hidden" nodes for layer 1
    + 20 nodes for layer 2
    + 10 output dimensions (predicted values)

----------

Disadvantage #2: They don't scale (unparallelizable)

* Fully-connected NNs can't be hyper-parallelized (GPU)
    * Large matrix multiplications
    * Layers depend on all elements of previous layers

----------

Disadvantage #3: They overfit

* Too manu nodes = overfitting

---------

What is the big O?

* Degrees of freedom grow with number of nodes & layers
* Each layer's nodes connected to each previous layer's
* That a lot of wasted "freedom"

# O(N^2)

--------

Not so fast, big O...

{% highlight python %}
>>> np.prod([30, 20, 10])
6000
>>> np.sum([30, 20, 10])**2
3600
{% endhighlight %}


----------

Rule of thumb 

NOT `N**2` 

But `M * N**2`

N: number of nodes
M: number of layers

---------

`assert(M * N**2 < len(training_set) / 10.)`

I'm serious... put this into your code.
I wasted a lot of time training models for Kaggle that overfitted.

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

+ limit connections 

jargon: *receptive fields*

+ limit weights 

jargon: *weight sharing*

All the rage: *convolutional networks*

----------

Unconventional structure to play with

New ideas, no jargon yet, just crackpot names

* limit weight ranges (e.g. -1 to 1, 0 to 1, etc)
* weight "snap to grid" (snap learning)

-----------

Joke: "What's the difference between a scientist and a crackpot?"

-----------

Ans: "P-value"

* High-**P**robability null hypothesis
* Not **P**ublished
* Not **P**eer-reviewed
* No **P**yPi **p**ackage

I'm a crackpot!

-----------

