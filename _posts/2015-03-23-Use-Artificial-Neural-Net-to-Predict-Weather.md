---
layout: post
title: Use Artificial Neural Net to Predict Weather
---

For February's Python User Group presentation night I did a live demo during a lightening talk about using [pybrain to predict the weather](http://slides.com/hobsonlane/pybrain#/). I've finally gotten back to it to improve the prediction accuracy and reduce the possability of cheating--using future data during model training or having validation and training test sets that overlap. So this weekend I reworked the functions that build neural net from a dataset and build a dataset from a time-series dataframe (including "tapped delay lines") with [`pybrain`](http://pybrain.org/). And then tested it by predicting the weather here in Camas, WA (daily max temp) to within 6%. Not super-great, but the model is pretty simple and only takes 5 lines to exercise the general functions for gathering the data then training and testing the model.

The working weather prediction example is in the master branch of the [`pug-ann`](http://github.com/hobson/pug-ann) package within the [`pug`](http://github.com/hobson/pug) namespace package. It depoends on the [`pug-nlp`](http://github.com/hobson/pug-nlp) subpackage too. To install the bleeding edge just: 

    pip install -e git+git@github.com:hobson/pug-nlp.git@master#egg=pug-nlp-master
    pip install -e git+git@github.com:hobson/pug-ann.git@master#egg=pug-nlp-master

Try it out on your city, or explore other model configurations to help me improve the accuracy. You might also find the [wunderground](http://wunderground.com) API wrapper useful if you need historical weather data on your project. I'll push it up to the cheese shop this week to make it as easy to install as: `pip install pug`.

I'm looking forward to wrapping these helpers with meta-helpers:

1. A ["pruner"](http://stats.stackexchange.com/a/136542/15974) to eliminate useless inputs (features), nodes (activation functions), and connections (weights).
2. An ["explorer"](http://stats.stackexchange.com/q/181/15974) to try new inputs and node/connection types to explore all the possabilities and improve performance.
