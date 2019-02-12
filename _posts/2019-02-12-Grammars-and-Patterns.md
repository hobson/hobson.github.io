---
layout: post
title: Word Patterns
---

Word patterns are what you can use to match or generate phrases. They're usually called grammars, in math and computer science courses. But this post is about word grammars rather than character grammars. And the word grammar means something very precise to a lot of people, so I don't want to step on any toes by using the word incorrectly. So I'll just talk about word patterns.

Word patterns work best on short, focused text documents, so I'm going to talk about word patterns for sentences, sometimes called *phrase structure grammars* (PSGs).

And word patterns are useful for 2 things:

1. matching
2. generating

The _matching_ part is mostly used to extract information, like a name, date, or serial number. It can also be used to measure well-formedness (grammatical correctness), but that can be hard. It's hard to compose formal grammar rules that capture all the possible well-formed sentences without accidentally including some bad sentences. Natural language grammars depend on the meaning of words. And that isn't easily captured in formal word patterns. The matching part can also be used to _search_ within a lot of sentences to narrow your sentences down to a few that match your pattern and use that to make some decisions, like what your chatbot should say in response.

That brings us to the *generating* use for word patterns. It turns out you can generate the word sequences that match your word patterns. The word patterns gives you the rules for doing that generation. Sometimes it can be so broad that the number of possible patterns you could generate would be too big for you to ever actually produce. But you can still generate a *sample* of all these phrases or sentences. You might do this sometimes to generate a response from your chatbot.

Now you just need a pattern specification language. Regular expressions work great for character patterns. But for word patterns we need to use something like `SpaCy` or `Lark`. The NLPIA book talks a log about `SpaCy`. `Lark` uses the [EBNF](https://www.wikiwand.com/en/Extended_Backus%E2%80%93Naur_form) (Extended Backus Naur Form) syntax and that's the syntax used by Python's own parser generator (interpreter). Frederico Tomassetti has a pretty awesome and [thorough explanation](https://tomassetti.me/parsing-in-python/) of all your options. Here, you're just going to learn about `Lark`.

Here's a paraphrasing of the `Lark` documentation for what a word pattern looks like:

```text
rule_name : list of rules and {terminal_name}s to match
          | another possible list of items
          | ...

terminal_name: "token"
```

And here's the first line of the python parser generator EBNF grammar:

```lark
single_input: NEWLINE | simple_stmt | compound_stmt NEWLINE
```
That looks like it might be compatible with the Lark parser generator. It's pretty simple, basically a valid statement can be a blank line (only a `NEWLINE`), or it can be a `simple_stmnt` (defined further down in the grammar), or it can be a `compound_stmt` (also defined further down) that combines a bunch of `simple_stmt` phrases and terminates them with a NEWLINE.

Here's the EBNF word pattern from a [lark tutorial](https://github.com/lark-parser/lark/blob/master/docs/json_tutorial.md) on using Lark to match another syntax you might be familiar with, `JSON`:

```lark
value: dict
     | list
     | STRING
     | NUMBER
     | "true" | "false" | "null"

list : "[" [value ("," value)*] "]"

dict : "{" [pair ("," pair)*] "}"
pair : STRING ":" value

%import common.ESCAPED_STRING   -> STRING
%import common.SIGNED_NUMBER    -> NUMBER
%import common.WS
%ignore WS
```

Be sure to `pip install lark-parser` **NOT** `lark`! The [PyPi package `lark`](https://pypi.org/project/lark/) is only for transforming HTML into redis requests. The [`lark-parser` package](https://pypi.org/project/lark-parser/) package is the one you want.

```python
from lark import Lark
json_parser = Lark(r"""
    value: dict
         | list
         | ESCAPED_STRING
         | SIGNED_NUMBER
         | "true" | "false" | "null"

    list : "[" [value ("," value)*] "]"

    dict : "{" [pair ("," pair)*] "}"
    pair : ESCAPED_STRING ":" value

    %import common.ESCAPED_STRING
    %import common.SIGNED_NUMBER
    %import common.WS
    %ignore WS

    """, start='value')
```

That's pretty nifty. Only a few lines to define a pattern that can match a pretty wide range of documents (all the valid JSON strings out there).

Let's try it out:

```python
>>> tree = json_parser.parse(r'[{"key": "value"}, {"ans": 42}]')
>>> tree
Tree(value, [Tree(list, [Tree(value, [Tree(dict, [Tree(pair, [Token(ESCAPED_STRING, '"key"'), Tree(value, [Token(ESCAPED_STRING, '"value"')])])])]), Tree(value, [Tree(dict, [Tree(pair, [Token(ESCAPED_STRING, '"ans"'), Tree(value, [Token(SIGNED_NUMBER, '42')])])])])])])
```

Nice! Now if only I could turn that back into a nice pretty-printable string with indentation. ;-)

```python
>>> print(tree.pretty())
value
  list
    value
      dict
        pair
          "key"
          value	"value"
    value
      dict
        pair
          "ans"
          value	42
```
