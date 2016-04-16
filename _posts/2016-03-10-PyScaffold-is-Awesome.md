---
layout: post
title: PyPi Packaging with PyScaffolding
---

[PyScaffold](https://pypi.python.org/pypi/PyScaffold) (`pip install PyScaffold` or `pyscaffold`) is awesome tooling. It adds a nice `putup` command to your shell. The `putup` command creates a boiler-plate directory structure for any python project. It can even set up .tox and .travis test config files, documentation build scripts, and a django project for you, if you ask it to. And it is very git aware. The only thing I add to my git hooks is a pandoc line to translate my `README.md` into `README.rst` so that both my github-trained fingers and ReST-loving PyPi can be happy.

PyScaffold splits your setup configuration into to files, `setup.py` and `setup.cfg`. Obviously all your edits should go into `setup.cfg`. I love the way it gives you examples for creating shell console scripts that automatically install in the users path when someone `pip install`s your package. For the `guten` package I used this to create command line scripts to launch daemons that can train a bot on massive bodies of text like the Gutenberg Project. 

Peter Downs has a great [HowTo](http://peterdowns.com/posts/first-time-with-pypi.html) on uploading your package to [PyPi](http://pypi.python.org), but PyScaffold and I add a few twists to automate a couple things.

So here's what I did for `sbd`, a sentence boundary detector by Kyle Gorman that I needed up on pypi for my `guten` bot.

```bash
putup --with-tox --with-travis --with-pre-commit --with-numpydoc -l 'mit' -d 'Repackaged sentence boundary detection by Kyle Gorman (originally named "DetectorMorse")' sbd
```

This will name you as the author and copyright holder, so that's the first thing I needed to change to give Kyle the credit for his state-of-the-art sentence segmenter. So edit the AUTHORS.rst file. That brings me to my pre-commit hook. My hook makes sure I never have to write ReST files and instead can stick to GitHub-flavored markdown. But I just edited a `*.rst` file. Anyway copy this hook to your hooks folder if you want to have your README.rst sync up with README.md on every commit.  to  've been copying my hooks from one project to the next 


