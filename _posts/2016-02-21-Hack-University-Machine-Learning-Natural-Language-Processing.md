---
layout: post
title: HUML Day 4 -- Natural Language Processing
---

# Finally Rolling

So we're having a lot of fun, finally. The students are all able to run python, ipython notebooks, and install python packages, even on Windows! Thank you [Anaconda](http://anaconda.org)! And we worked on a project to mine the Hack University slack channels for conversation text. We even got a simple generative model working, comparable to the one in Grus's _Data_Science_from_Scratch_, Chapter 20.

But the dirth of humanish text on our Slack channel has inspired me to seek out text that was a bit more thoughtfully generated. 

## Download It All

I went big.  My server (and ISP) is running flat out to download the entire [Gutenberg collection](http://www.gutenberg.org/wiki/Gutenberg:Mirroring_How-To). I put together a [python app](http://github.com/totalgood/guten) to build the excludes list (based on an ls-R file in the root directory). I don't want to download any of the images or ISOs or even AVIs that are floating around on Gutenberg. My bot's pretty bookish and only cares about `*.txt`, not even HTML. I kicked off the `rsync -avz` process and detached `tmux` about 15 minutes ago. 

## Watch Out

Unfortunately it wiped out a few archival photos before I realized that it was syncing the entire drive rather than a subfolder. The `sync` part of `rsync` involve a lot of `rm -rf`.  And, **man**, those trailing slashes on the end of an `rsync` destination path are dangerous. Got that fixed, but I'm beginning to worry that my `--exclude-from` list is too thorough. `find . -type f` returns 0 regular files. But there are about 30k directories in a deep tree so far, growing at about 1k per minute, so maybe it just does the tree first:

```bash
$ find . -type d | wc -l
28443
$ find . -type d | wc -l
34118
$ find . -type d | wc -l
34123
$ find . -type f
$ find . -type f | wc -l
0
$ find . -type d | wc -l
34941
```

Like a watched pot, things seem to be slowing down. Better stop multi-tasking the samba server with finds.

Of course I'm getting lots of warnings about being unable to set the datetime on my NAS drive, but maybe that's normal.

```bash
2/2/0/8/22081/22081-h/images/
2/2/0/8/22081/22081-page-images/
2/2/0/8/22082/
rsync: mkstemp "/media/$USER/nas/guten/2/2/0/8/22082/.22082.txt.bE6NwA" failed: Operation not permitted (1)
rsync: failed to set times on "/media/$USER/nas/guten/2/2/2/5/22254/22254-h/images": Operation not permitted (1)
rsync: failed to set times on "/media/$USER/nas/guten/2/2/2/5/22255": Operation not permitted (1)
2/2/0/8/22083/
```

I hope it's OK to use the `-z` option with Gutenberg's ftp server. I guess I'll know in the morning.

## Morning After

Turns out the problem was that I was trying to preserver, owner, group, device and other linux file properties. I only want the text, so I revised the recommended rsync for my CIFS FAT32 drive:

```bash
rsync -rgvz --delete-before --fake-super --exclude-from=data/excludes.txt ftp@ftp.ibiblio.org::gutenberg /media/$USER/nas/guten/
```

But that didn't work either. In the end, I just dumbed down rsync by limitting it to DOS capabilities:

```bash
rsync -rvz --delete-during --exclude-from=data/excludes.txt ftp@ftp.ibiblio.org::gutenberg /media/$USER/nas/guten/
```

Now the machines are finally working together to give me some human text in machine-readable form!
