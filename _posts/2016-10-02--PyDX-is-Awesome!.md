---
layout: post
title: PyDX is Awesome!
---

Watched a lot of great talks about Python this weekend some of the memeorable ones:

- [Portia Burton's Talk](http://lanyrd.com/2016/pydx/sfmtdw/) on the Future of Cryptocurrency
- [Servo Behind the Scene by E. Dunham](http://edunham.net/pages/talks.html) (Mozilla): How to Automate Your DevOps with Bots
- "A Gentle Introduction to Python Performance" by Nathaniel Smith
- "Machine Learning for Absolute Beginners" by Hailey Buckingham
- "Moneyball.py" by Jeremy Tanner (from [SendGrid](http://sendgrid.com/))
- "Adding Celery to your Salad" by Hannes Hapke
- "Wayback Machine" by Barbara Miller

And my talk

- [There's Hope for Chatbots](http://totalgood.github.io/hope)

Slides and videos will be online soon, I'm sure. So check back for more links.

Rami and I had a few questions for Nathan but didn't want to ask publicly... so how about an unread blog post about it ;)

- `set`s are `dict`s without values, only keys
- I don't think you can depend on any sort order for `set`s
- appending to

One thing that I learned was that you can append tuples like

```python
>>> tuple('ABC') + tuple('DEF')
('A', 'B', 'C', 'D', 'E', 'F')
```

