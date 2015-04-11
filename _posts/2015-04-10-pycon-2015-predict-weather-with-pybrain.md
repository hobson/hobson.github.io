---
layout: post
title: PyCon 2015 -- Predict Weather With [pybrain](//github.com/pybrain/pybrain)
---

[PyCon 2015](http://us.pycon.org/2015/) WiFi went down before I could edit the [slides.com](//slides.com/hobsonlane/pycon2015-predict-weather-with-pybrain.html) reveal.js slides. So the slides didn't reflect the latest version of pug-ann. Here are the [slides](/images/pycon2015-predict-weather-with-pybrain.html). TLDR: a 6-node neural net can predict the max temperature in Portland a day in advance with about 5 deg C (10 deg F) 1-sigma error.  Which really is pretty poor. You'll want to add some additional features (inputs) to your net to improve it's accuracy. You might also want to add a nonlinear node. I'm looking forward to implementing some auto-tuning wrappers that will do this "feature engineering" for you.

Appologies if you attempted to `import pug.data.weather` and found that it had been moved to `pug.ann.data.weather`.