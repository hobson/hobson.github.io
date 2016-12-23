---
layout: post
title: XZ 7Zip Performance on the Latest Python 3.6 Source Code Release
---

With the Python 3.6 release today, I noticed the source package compression extension wasn't one I was familiar with. Turns out it's the old 7zip format updated for 'nix file metadata (owner, permissions, sticky bit, etc). So I played around with it to see how it performs at its maximal and extremely maximal compression levels.

It looks like `-e9` is 0.4% smaller, 20% slower at compression, 3% slower for decompression, compared to `-9` on a typical laptop. Here're the timing runs on the Python source code directory structure.

Compression:

    $ T0=`date +%s%3N` && XZ_OPT=-9 tar cJf python3.6.tar.9xz Python-3.6.0 && T1=`date +%s%3N`
    $ python -c "print((float($T1) - float($T0)) / 1000.)"
    43.87
    $ T0=`date +%s%3N` && XZ_OPT=-e9 tar cJf python3.6.tar.e9xz Python-3.6.0 && T1=`date +%s%3N`
    $ python -c "print((float($T1) - float($T0)) / 1000.)"
    53.861

Decompression:

    $ T0=`date +%s%3N` && tar xf python3.6.tar.9xz && T1=`date +%s%3N`
    $ python -c "print((float($T1) - float($T0)) / 1000.)"  && rm -rf Python-3.6.0
    1.395
    $ rm -rf Python-3.6.0
    $ T0=`date +%s%3N` && tar xf python3.6.tar.e9xz && T1=`date +%s%3N`
    $ python -c "print((float($T1) - float($T0)) / 1000.)"  && rm -rf Python-3.6.0
    1.443

File Size:

    $ rm -rf Python-3.6.0
    $ T0=`date +%s%3N` && tar xf Python-3.6.0.tar.xz && T1=`date +%s%3N`
    $ python -c "print((float($T1) - float($T0)) / 1000.)" && rm -rf Python-3.6.0
    1.49
    $ ls -al ?ython*
    -rw-rw-r-- 1 hobs hobs 16378500 Dec 23 13:06 python3.6.tar.9xz
    -rw-rw-r-- 1 hobs hobs 16314420 Dec 23 13:05 python3.6.tar.e9xz
    -rw-rw-r-- 1 hobs hobs 16805836 Dec 23 12:24 Python-3.6.0.tar.xz
    $ du -hs Python-3.6.0
    119M  Python-3.6.0
    $ du -s --block-size=1 Python-3.6.0
    123944960 Python-3.6.0

So the maximum compresion ratio for Python source code and folder structures is **1/7.6** or **13%**.

```python
>>> 16314420. / 123944960.
0.13162632833154328
>>> (16314420. / 123944960.) ** -1
7.59726426069698
```
