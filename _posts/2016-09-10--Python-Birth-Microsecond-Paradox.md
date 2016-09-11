---
layout: post
title: Python-Birth-Microsecond-Paradox
---

[Cole](http://uglyboxer.github.io/) got bit by the Birthday Paradox when using python `random.randint()` and `time.time()` to generate a random number to tag a DB record with a unique has[Open Data](http://storage.googleapis.com/books/ngrams/books/datasetsv2.html)!

Read the docs and found that python uses system time (`time.time() has microsecond resolution) to seed their random number generator on some machines. If the machine has a random number source, it'll use that instead. The servers where this happened must not have a random source, so appending a random number from python's `random` package to a microsecond-resolution timestamp won't add any randomness at all. If the two processes happen to start at the same microsecond they'll produce the same answer. I couldn't force the collision on my machine.

The "birthday paradox" is what it's called when these collisions happen more often than you expect, like when generating an random integer between 1 and 365. So it doesn't apply here. And it's not really a paradox (nor is the Birthday Paradox). But it was fun to try to reproduce it on my recent HP laptop. Getting two processes to run simultaneously on separate cores turned out to be harder than I imagined. I couldn't trick tmux into doing it, and the stack overflow answers seemed broken to me. But here's my quick fail at repro:

This is the tmux approach I couldn't get working

```bash
#!/bin/sh 
tmux new-session -s collider -d 'python -c "import random; print(random.randint(0,1000000000));"'
tmux new-window -s collider 'python -c "import random; print(random.randint(0,1000000000));"'
```

So I just loaded up the OS process queue with a bunch of python interpreter tasks in the hopes a few of them would pass through cores at the same time.

```bash
for ((i=0; i<100; i++))
do 
    python -c "import random; print(random.randint(0,1000000000));" > /tmp/collider.${i}.log &
done

for ((i=0; i<100; i++))
do 
    python -c "import time; print(repr(time.time()));" > /tmp/collidetime.${i}.log &
done
```

No luck with collisions (so my motherboard and python interpreter are too clever for my trickery), `uniq` can't find any dupes.

```bash
cat /tmp/collider.*.log | sort | uniq -c
#      1 105969327
#      1 126048218
# ...
#      1 146990491
#      1 148685188
```

BINGO! The clock did a 2-step for the same microsecond a 3 times out of 100:

```bash
cat /tmp/collidetime.*.log | sort | uniq -c | grep -e '\b[2-9]\b'
#      2 1473613474.737581
#      2 1473613474.743379
#      2 1473613474.755999
```

Did I do anything wrong?  What can Cole do to avoid this in the future (on a machine without a random source, like an AWS EC2 instance)?
