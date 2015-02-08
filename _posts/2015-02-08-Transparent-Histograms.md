---
layout: post
title: Another Challenge Do-Over
---

Spent a lot of this week working on prettifying bar charts, histograms and animations for some reveal.js slides.  

This [`pug` module](https://github.com/hobson/pug/blob/dj1.8/pug/invest/plot.py) on dj1.8 branch (upgrading to Django 1.8) provides a lot of kwarg customization for transparency that work with dark backgrounds like those in modern presentations.

It's not on pypi yet, so you have to install manually:

    pip install pandas
    pip install --editable=git+http://github.com/hobson/pug.git@dj1.8#egg=pug --exists-action=w

There's also a function for creating a gif animation of a pandas Panel (sequence of DataFrame tables). Each line chart is a "frame" of the animation.

