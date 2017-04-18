---
layout: post
title: Python-Birth-Microsecond-Paradox
---

[Cole](http://uglyboxer.github.io/) got bit by the Birthday Paradox when using python `random.randint()` and `time.time()` to generate a random number to tag a DB record with a unique ID. I think [Hannes](http://hanneshapke.github.io/) does something similar to ensure user-provided files are all unique, even a user uploads the exact same file twice.

I [read the docs](https://docs.python.org/2/library/random.html) and found that python uses system time, and `time.time()` has microsecond resolution (hence the title of this post) to seed the random number generator on some machines during `import random`. If the machine and OS provides a random number source, it'll use that instead. The servers where this happened must not have a random source, so appending a random number from python's `random` package to a microsecond-resolution timestamp won't add any randomness at all. If the two processes happen to start at the same microsecond they'll produce the same answer. I couldn't force the collision on my machine.

Here's the docs. TLDR: skip to the bottom of this post.

---------------------------

#### random.seed(*x*)

Initialize the basic random number generator. Optional argument, *x*, can be any [hashable](https://docs.python.org/2/glossary.html#term-hashable) object. If *x* is omitted or `None`, current system time is used; current system time is also used to initialize the generator when the module is first imported.  If randomness sources are provided by the operating system, they are used instead of the system time. See the [`os.urandom()`](https://docs.python.org/2/os.html#os.urandom) function for details on availability.

---------------------------

The "birthday paradox" is what it's called when these collisions happen more often than you expect, like when generating a random integer between 1 and 365 in a room full of friends for their birthdays. So the concept doesn't apply here. And this collision problem is not really a paradox anyway. But it was fun to try to reproduce it on my recent HP laptop. Getting two processes to run simultaneously on separate cores turned out to be harder than I imagined. I couldn't trick tmux into doing it, and the stack overflow answers seemed broken to me. But here's my quick fail at repro:

This is the tmux approach I couldn't get working

```bash
#!/bin/sh 
tmux new-session -s collider -d 'python -c "import random; print(random.randint(0,1000000000));"' &
tmux new-window -s collider 'python -c "import random; print(random.randint(0,1000000000));"'
```

So I just loaded up the OS process queue with a bunch of python interpreter processes in the hopes a few of them would pass through cores at the same time.

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

## BINGO!

The clock did a 2-step for the same microsecond, 3 times out of 100:

```bash
cat /tmp/collidetime.*.log | sort | uniq -c | grep -e '\b[2-9]\b'
#      2 1473613474.737581
#      2 1473613474.743379
#      2 1473613474.755999
```

Did I do anything wrong?  What can Cole do to avoid this in the future (on a machine without a random source, like an AWS EC2 instance)?
