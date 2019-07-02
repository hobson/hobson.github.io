---
layout: post
title: Nessvectors for San Diego Python User Group
---

I had a lot of fun playing with words at the monthly Python User group meeting in San Diego this week. Congratulations to Torin Panick [@torrinp](https://twitter.com/torrinp) for winning a free copy of [NLP in Action](bit.ly/nlpia-py). For those of you that missed out, I'll give out one free eBook code and a 42% discount code next time. And I'll be a bit more organized about the competition ;).

The slides and code are here if you want to try your own tip-of-the-tongue game: [PDF](https://github.com/hobson/hobson.github.io/blob/master/_posts/talk-2019-06-27--san-diego-python-user-group.pdf?raw=true) [ODP](https://github.com/hobson/hobson.github.io/blob/master/_posts/talk-2019-06-27--san-diego-python-user-group.odp?raw=true) [py](https://github.com/totalgood/nlpia-lite/blob/master/src/nlpia/book/examples/ch06_nessvectors_2019_06_san_diego_python_user_group.py)

If you're wondering, a "nessvector" isn't a real NLP thing. That's just what I call an explainable word vector that has your own custom "dimensions". The examples we used during the meetup had dimensions for "peopleness", "animalness", "placeness", and "femaleness":

```python
>>> nessvector('cat')
placeness     -1.560885
peopleness    -0.216057
animalness     2.906886
conceptness   -1.442183
femaleness     0.312240
```

Lots of animalness femaleness (femininity) and not any placeness at all.

What do you think a "dog" nessvector will look like? More or less femininity than a cat?

```python
>>> nessvector('dog')
placeness     -1.453316
peopleness    -0.589015
animalness     3.112393
conceptness   -1.225242
femaleness     0.155180
```

What about "herb"?

```python
>>> nessvector('herb')
placeness     -0.340492
peopleness     0.036387
animalness     0.647465
conceptness   -0.356363
femaleness     0.013003
```

And for the 20 questions game, what about "tiger"?

```python
>>> nessvector('tiger')
placeness     -1.283883
peopleness    -0.140355
animalness     2.350045
conceptness   -1.342111
femaleness     0.416304
```
