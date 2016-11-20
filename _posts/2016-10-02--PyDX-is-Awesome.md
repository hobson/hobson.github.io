---
layout: post
title: [PyDX](http://pydx.org) is Awesome!
---

Watched a lot of great Python talks this weekend. Here are some memorable ones:

- [Portia Burton's Talk](http://lanyrd.com/2016/pydx/sfmtdw/) on the Future of Cryptocurrency
- [Servo Behind the Scene by E. Dunham](http://edunham.net/pages/talks.html) (Mozilla): How to Automate Your DevOps with Bots
- "A Gentle Introduction to Python Performance" by Nathaniel Smith
- "Machine Learning for Absolute Beginners" by Hailey Buckingham
- "Moneyball.py" by Jeremy Tanner (from [SendGrid](http://sendgrid.com/))
- "Adding Celery to your Salad" by Hannes Hapke
- "Wayback Machine" by Barbara Miller

And my talk...

- [There's Hope for Chatbots](http://totalgood.github.io/hope)

My talk was a big disappointment for me and some in the audience because I couldn't get the Django interface to [hope](http://github.com/totalgod/hope) working. The talk is more of an overview of current chatbot tech rather than a *HOWTO*. But Cole's LSTM-brained bot trained on movie dialog was a nice highlight and conclusion for the talk. 

There's a double reversal on [Chatterbot](http://github.com/gunthercox/ChatterBot)'s repsonse.in_response_to self relationship for the `Statement(Model)` through `Response(Model)` asymmetrical relation. And something's going on in the DjangoStorage plugin that sort-of untangles it, but I wasn't able to unmigrate all my training data etc. Cowboy coding **fail** again. Gotta start writing tests first. Will get it going soon.

Slides and videos will be online soon at [PyDX](http://blog.pydx.org/talk-list/), I'm sure. So check back for more links.

Rami and I had a few questions for Nathan but didn't want to ask publicly... so how about an unread blog post about it ;)

- `set`s are `dict`s without values, only keys
- I don't think you can depend on any sort order for `set`s
- appending to

One thing that I learned was that you can append tuples like

```python
>>> tuple('ABC') + tuple('DEF')
('A', 'B', 'C', 'D', 'E', 'F')
```

