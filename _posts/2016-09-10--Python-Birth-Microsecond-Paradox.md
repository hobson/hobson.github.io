---
layout: post
title: Python-Birth-Microsecond-Paradox
---

[Cole](http://uglyboxer.github.io/) got bit by the Birthday Paradox when using python `random.randint()` and `time.time()` to generate a random number to tag a DB record with a unique ID. I think [Hannes](http://hanneshapke.github.io/) does something similar to ensure user-provided files are all unique, even a user uploads the exact same file twice.

I [read the docs](https://docs.python.org/2/library/random.html) and found that python uses system time (`time.time()` has microsecond resolution, hence the title of this post) to seed their random number generator on some machines during import. If the machine has a random number source, it'll use that instead. The servers where this happened must not have a random source, so appending a random number from python's `random` package to a microsecond-resolution timestamp won't add any randomness at all. If the two processes happen to start at the same microsecond they'll produce the same answer. I couldn't force the collision on my machine.

Here's the docs. TLDR: skip to the bottom of this post.

<html>
<dt id="random.seed">
<code class="descclassname">random.</code><code class="descname">seed</code><span class="sig-paren">(</span><span class="optional">[</span><em>x</em><span class="optional">]</span><span class="sig-paren">)</span><a class="headerlink" href="#random.seed" title="Permalink to this definition">¶</a></dt>
<dd><p font-size: "75%"">Initialize the basic random number generator. Optional argument <em>x</em> can be any
<a class="reference internal" href="../glossary.html#term-hashable"><span class="xref std std-term">hashable</span></a> object. If <em>x</em> is omitted or <code class="docutils literal"><span class="pre">None</span></code>, current system time is used;
current system time is also used to initialize the generator when the module is
first imported.  If randomness sources are provided by the operating system,
they are used instead of the system time (see the <a class="reference internal" href="os.html#os.urandom" title="os.urandom"><code class="xref py py-func docutils literal"><span class="pre">os.urandom()</span></code></a> function
for details on availability).</p>
</dd>
</html>

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