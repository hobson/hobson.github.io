---
layout: post
title: Data Science Group Talk -- Neural Nets Demystified
---

[Portia](https://twitter.com/pkafei) [Burton](http://www.plbanalytics.com/) asked me to speak about Neural Nets at the next [Data Science Group](http://www.meetup.com/Portland-Data-Science-Group/) meetup. So here's the abstract... 

Neural Nets Demystified
-----------------------

I've used neural nets to solve 4 problems recently and I'll share lessons learned from each of them and try to reveal them for what they are... a blunt, broad tool for any problem that just won't yield to more targeted data analysis tools.

I've used neural nets to...

1. predict building energy consumption (e.g. to turn on Tesla battery packs at the right time)
2. [predict the weather in Portland](http://hobsonlane.com/PyCon-2015-Lightning-Talk-Video-and-Attribution/), so your thermostat can tell when to pack an umbrella
3. sentence segmentation (Kyle Gorman's [DetectorMorse](https://github.com/cslu-nlp/DetectorMorse))

And neural nets have been applied recently in fields where they've not been considered before

1. George Dahl surpassed existing [speech recognition](http://hobsonlane.com/Graph-Theory-Basics-and-Advanced-Speech-Recognition-with-Neural-Nets/) technology by inserting a deep net into the Microsoft Bing speech-processing pipeline to replace Gaussian Mixture Models
2. [Google's $400M purchase of Deep Mind](http://www.technologyreview.com/news/524026/is-google-cornering-the-market-on-deep-learning/) whose main demonstration was an video game playing neural net

So I'll discuss all these examples and explain the similarities between the neural network structures (topologies) that solved these problems and comparable models used in the past for these problems (linear regressions and naive Bayes classifiers). In the end, the "forward" model is usually a bunch of weighted terms summed together and then transformed with some nonlinear function before being passed along as new features to another layer of transformation and summing. And it has been proven that a 3-layer neural net with a nonlinear activation function is capable of modeling any nonlinear function, given enough nodes or neurons. The only question is whether you can wait around for it to find its way out of all the local minima that exist in such a nonlinear manifold (multi-dimensional surface).

I'll show some color maps of the neuron connection weights as they evolve during back propagation for a simple problem where they values make intuitive sense (sentence segmentation). And then I'll show what the more inscrutable weight matrices look like for a complicated problem like weather prediction. Finally I share some techniques for structuring and pruning neural nets to match the structure of the problem to improve their solution accuracy and training speed.

