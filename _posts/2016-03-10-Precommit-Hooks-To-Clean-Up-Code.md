---
layout: post
title: Rabbit Hole of Automation
---

I got carried away with automating my development process when I discovered this [pre-commit hook](https://github.com/FalconSocial/pre-commit-python-sorter) that makes sure your python `import`s are sorted, like [Two Scoops](http://www.amazon.com/Two-Scoops-Django-Best-Practices/dp/0981467342) recommends. I noticed a `hooks.yaml` file that revealed that `FalconSocial`'s hook is actually a plugin for Yelp's awesome [pre-commit framework](https://github.com/pre-commit/pre-commit). 

I almost dove into the hole and started modularizing my hook, and even translating it into python and putting it up on [pypi](http://peterdowns.com/posts/first-time-with-pypi.html). But it's not ready yet... and I've got a [class](https://github.com/totalgood/guten) to teach on how to read and learn from the massive trove of human-generated ASCII text in Gutenberg.