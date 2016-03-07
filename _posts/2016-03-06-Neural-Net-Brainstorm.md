---
layout: post
title: Neural Net Brainstorm
---

Cole's class on neural nets inpsired some "out of the box" thinking about how brains work and how we train neural nets. Students asked about the performance of regularization vs random dropout, and the computational bottlenecks for random dropout.

Cole revealed that random-dropout is much 
That got us thinking about the way worm, ant, and human brains accomplish generalization (regularization or random dropout). Because it's the one big challenge of AI right now. Generalizing from a few examples to many. Some thoughts:

  1. dreaming in REM sleep
      - waves of synchronized activation/deactivation cycles
  2. day-dreaming (planning, worrying, reminiscing)
  3. environmental/cultural regularization 
      - alcohol rewires brains with something like random dropout
      - emotional trauma permanently rewires brains (PTSD) 

All of these seem to reinforce or destroy connections randomly in a way similar to random dropout. Regularization might be more more like the "global" brain chemical soup, the overall brain biochemistry, that prevents runaway neuron firing (epilepsy, schizophrenia, etc).

So Deep Learning might learn from these biological learning approaches. Perhaps models would train/converge more quickly, and with greater generality from fewer examples if there were structure in the random dropouts. One expedient option is to not spend precious processing cycles trying to squeeze random numbers out of a random number generator. Another might be to have a greater portion of dropouts but a fewer permutations of the dropout mask, rotating through those masks in a repeatable way, but in a way that allows each training example to "experience" each mask, like a wrapping rolling window where the data set size is one more than a multiple of the window width.

Also, would it make sense to combine regularization with semi-random or almost-cyclical dropout?
