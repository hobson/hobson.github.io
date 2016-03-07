---
layout: post
title: Smaller than Baby Steps with Julia
---

Julia has some impressive performance stats, so I gave it a whirl, or half a whirl.

Since I now have a lot of text to mine I need to at least be able to segment strings into tokens and count occurrences of those words in sentences, phrases, paragraphs, chapters, and books. Unfortunately Julia can't match the human compiler performance of python for this simple task that for python is simply a matter of `split`, `Counter` and a generator or two. I couldn't get Julia to even concatenate an array of strings together:
 split or join a string using the weird Perl syntax:

```julia
$ julia
               _
   _       _ _(_)_     |  A fresh approach to technical computing
  (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
   _ _   _| |_  __ _   |  Type "help()" for help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 0.3.11
 _/ |\__'_|_|_|\__'_|  |  
|__/                   |  x86_64-linux-gnu

julia> s = ["this", "is", "an", "array", "of", "strings"]
6-element Array{ASCIIString,1}:
 "this"   
 "is"     
 "an"     
 "array"  
 "of"     
 "strings"

julia> " ".join(s)
ERROR: type ASCIIString has no field join

julia> " $s"
" ASCIIString[\"this\",\"is\",\"an\",\"array\",\"of\",\"strings\"]"

julia> 
```

Or split a sentence into tokens using the cool built in Perl regex capability:

```julia
julia> ismatch(r"^\s*(?:#|$)", "# a comment")
true

julia> match(r"^\s*(?:#|$)", "# a comment")
RegexMatch("#")

julia> regex = r"[^ ]+"
r"[^ ]+"

julia> captures(regex, "This is an sentence of workds (tokens).")
ERROR: captures not defined

julia> m = match(regex, "This is an sentence of workds (tokens).")
RegexMatch("This")

julia> m.captures
0-element Array{Union(SubString{UTF8String},Nothing),1}

julia> m = match(regex, "This is an sentence of workds (tokens).")
RegexMatch("This")

julia> m.captures
0-element Array{Union(SubString{UTF8String},Nothing),1}
```

I'm affraid Python is too deeply engrained in my thinking. So it's back to Python and gensim for the total `guten` literature mining work.