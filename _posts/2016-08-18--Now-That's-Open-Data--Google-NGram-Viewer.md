---
layout: post
title: Now THAT's Open Data -- The Google NGram Viewer Corpus
---

Now THAT's [Open Data](http://storage.googleapis.com/books/ngrams/books/datasetsv2.html)!

```bash
FINISHED --2016-08-18 15:30:00--
Total wall clock time: 3d 23h 19m 17s
Downloaded: 6833 files, 3.2T in 3d 14h 55m 31s (10.7 MB/s)
Converted links in 0 files in 0 seconds.
```

It's 10% of [all the books published up until 2008](https://en.wikipedia.org/wiki/Google_Ngram_Viewer), on one (*large*) harddrive. It's only the N-grams, rather than full text with punctuation, like Gutenberg. But N = 5. So you could reconstruct a lot of the books from that, if it weren't for that pesky minimum document (book) frequency threshold of 40 books...

For those less hordy than me, you can just query the data through the slick API for fun things like officiating a "race" between [Python, Ruby, C/C++, and Perl](https://books.google.com/ngrams/graph?content=Python+development%2CRuby+development%2CC+development%2CPerl+development&year_start=1800&year_end=2008&corpus=15&smoothing=2&share=&direct_url=t1%3B%2CPython%20development%3B%2Cc0%3B.t1%3B%2CRuby%20development%3B%2Cc0%3B.t1%3B%2CC%20development%3B%2Cc0%3B.t1%3B%2CPerl%20development%3B%2Cc0):

Unfortunately, I'd already used quite a bit of the 4T USB drive (downloading the Gutenberg Project books, among other things). So I scrolled further up the terminal log to see:

```bash
storage.googleapis.com/books/ngrams/books/googlebooks-spa-all-5gram-20090715-99.csv.zip: No space left on deviceCannot write to ‘storage.googleapis.com/books/ngrams/books/googlebooks-spa-all-5gram-20090715-99.csv.zip’ (Success).

hobs@adder:/media/nas/data/corpora/googlebooks$ df -h
Filesystem                   Size  Used Avail Use% Mounted on
//totalgood/disk1_pt1/       3.7T  3.7T   20K 100% /media/nas
```

Time to RAID up, I guess, before I rerun

```bash
wget -r --accept gz,zip --mirror --adjust-extension --convert-links --no-parent --backup-converted --level 1 http://storage.googleapis.com/books/ngrams/books/datasetsv2.html
```
