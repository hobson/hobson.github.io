---
layout: post
title: Artificial Neural Nets for Prediction with Python (pybrain)
---

I've [fork](https://github.com/hobson/pybrain)ed the [pybrain package](https://github.com/pybrain/pybrain) and started to hobsonify it to suit my tastes, make it more pythonic, and correct some documentation errors that render some shortcuts unusable.

For my employer, I'm using neural nets to predict utility bills and optimally control a system that minimizes that bill by clipping the load. Utility bills are usually a highly nonlinear function of the peak power consumption for the day. So our system should save a lot of money and help save the planet by allowing utilities to run more efficiently and emit less greenhouse gas.

At home I'm training nets on stock market historical data, similar to the [work I did](https://github.com/hobson/coursera/tree/master/invest1) for Tucker Balch's computational investing [class](https://class.coursera.org/compinvesting1-004).

One way to get deeper nets to train on a highly-stochastic datasets (like ticker historical prices) is to "restart" the backpropagation training after it converges (or even if it doesn't). In pybrain this seems to use a different portion of your dataset for the training and convergence-testing portions of the learning. This helps pybrain wander out of local minima and find smaller minima elsewhere in the terrain.