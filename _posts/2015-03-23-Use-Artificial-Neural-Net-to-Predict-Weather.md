---
layout: post
title: Use Artificial Neural Net to Predict Weather
---

For February's Python User Group I did a lightning talk live demo using [`pybrain`](http://pybrain.org/) to [predict the weather](http://slides.com/hobsonlane/pybrain#/). It took a whole weekend to pay off the code quality debt from the hacking  I was doing during Kyle Gorman's awesome NLP talk. 

## Debt repaid

1. Improve prediction accuracy
2. Modularizing/generalize the approach
3. Eliminate validation cheating
    1. no future data used in training
    2. nonoverlapping validation and training data sets

## Gotchas with time-series data

With time-series data and "tapped delay lines" (a linear, finite impulse response filter), it's easy to accidentally polute your training set with validation data and vice versa. For instance, if you don't segment your data manually, `pybrain` segments it using random sampling. Since each of your samples in the dataset provided to pybrain includes time samples that are also included in N other sample vectors, where N is order of your filter or the number of tapped delay lines in your block diagram of the filter.

So I reworked the function that builds a neural net from a `pybrain` dataset as well as the function that builds a dataset from a pandas time-series dataframe. I also added a `delays` argument to specify the irregularly sampled time-series rows to use in your FIR filter. I tested it by predicting the weather here in Camas, WA (daily max temp) to within 6%. Not super-great, but the model is pretty simple and only takes 5 lines to exercise the general functions for gathering the data then training and testing the model. Perhaps there's still some "cheating" hidden in the pybrain training and data segmentation.

The working weather prediction example is in the master branch of the [`pug-ann`](http://github.com/hobson/pug-ann) package within the [`pug`](http://github.com/hobson/pug) namespace package. It depoends on the [`pug-nlp`](http://github.com/hobson/pug-nlp) subpackage too. To install the bleeding edge just: 

    pip install -e git+git@github.com:hobson/pug-nlp.git@master#egg=pug-nlp-master
    pip install -e git+git@github.com:hobson/pug-ann.git@master#egg=pug-nlp-master

Try it out on your city, or explore other model configurations to help me improve the accuracy. You might also find the [wunderground](http://wunderground.com) API wrapper useful if you need historical weather data on your project. I'll push it up to the cheese shop this week to make it as easy to install as: `pip install pug`.

## TODO

I'm looking forward to wrapping these helpers with meta-helpers:

1. A ["pruner"](http://stats.stackexchange.com/a/136542/15974) to eliminate useless inputs (features), nodes (activation functions), and connections (weights).
2. An ["explorer"](http://stats.stackexchange.com/q/181/15974) to try new inputs and node/connection types to explore all the possabilities and improve performance.

I also want to:

1. Build a non-overlapping time series dataset segmenter for validation a nd cross-validation testing
2. Build a `pybrain` training algorithm that take any user-specified error function rather than the MSE calc it uses by default
