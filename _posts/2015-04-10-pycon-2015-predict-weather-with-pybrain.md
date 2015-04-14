---
layout: post
title: PyCon 2015 -- Predict Weather With [pybrain](//github.com/pybrain/pybrain)
---

Here are the [latest slides](/images/pycon2015-predict-weather-with-pybrain.html) for a [PyCon 2015](http://us.pycon.org/2015/) lightning talk on neural nets "Predict Weather with pybrain" (with a little help from [pug-ann](http://github.com/hobson/pug-ann)). Appologies if you attempted to follow along and execute the code on the slides. WiFi dropped before I could save updated [slides.com](//slides.com/hobsonlane/pycon2015-predict-weather-with-pybrain.html) reveal.js slides. So the slides didn't reflect the latest version of pug-ann. I've gotta start hand-editing locally. The typos were embarrassing. TLDR: a 6-node neural net can predict the max temperature in Portland a day in advance with about 5 deg C (10 deg F) 1-sigma error. 

This performance seems poor to me. I think I could do better by hand with the same data and same lack of meteorology knowledge. You'll want to add some additional features (inputs) to your net to improve accuracy. You might also want to add a nonlinear node. I'm looking forward to implementing some auto-tuning wrappers that will do this "feature engineering" for you.

Appologies if you attempted to `import pug.data.weather` and found that it had been moved to `pug.ann.data.weather`.

Thanks to this "conference-driven development" I've got an awesome set of research ideas to pursue... an "imprinting" technique to transfer the structure of the data to the neural net so it can train more efficiently and predict more accurately. And thanks to DataRobot for the "existence proof" that automating away a data scientists job is possible. And thanks to Melanie Mitchell for turning me onto convolution neural net structures. My research ideas is just a simple twist on "receptive fields" and "shared weights" that are the key to convolution neural nets... a Weiner or Gaussian or cosine kernal on the shared weights (another convolution layer) should really improve robustness and flexability and efficiency (parallelizablity).  Seems like you need something to blend/smooth those hard edges in time/space/feature-dimension for the receptive fields.
