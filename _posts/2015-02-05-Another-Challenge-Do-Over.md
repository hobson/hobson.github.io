---
layout: post
title: Another Challenge Do-Over
---

I failed another coding challenge and couldn't just put it out of my mind. The challenge is this. You're given a passage with any number of sentences and words in it, but some of the words have slashes between them instead of spaces to indicate "or", like "The brown/black/crazy cat crossed the road." Your objective is to parse those strings and return a list of strings with all the possible alternative interpretations of the phrases. The unspoken, unmet challenge is to then process these alternatives to be the logical interpretations that a human would make, to resolve ambiguities when the slashed words aren't all the same part of speech and aren't intended to be just swapped for one another. Perhaps the ambiguity is whether the slash means "or" or "and". In the 30 minutes I had, I never got past the recursion and book-keeping of the parsing. But here's what I came up with, complete with doctests that pass.

I'm not sure what it'll be useful for, but it's in [pug.nlp.util.slash_product()](https://github.com/hobson/pug/blob/dj1.8/pug/nlp/util.py) on the dj1.8 branch:

    def slash_product(string_or_seq, slash='/', space=' '):
        """Return a list of all possible meanings of a phrase containing slashes
        TODO:
            - Code is not in standard Sedgewick recursion form, I don't think
            - Simplify by removing one of the recursive calls?
            - Simplify by using a list comprehension?
            - Reuse the exact same (various) whitespace characters when joining.
              e.g. need to split and rejoin on newlines without replacing with spaces.
              Don't use `join` except forslashes; or retain the various space chars during `split`.

        >>> slash_product("The challenging/confusing interview didn't end with success/offer")  # doctest: +NORMALIZE_WHITESPACE
        ['The challenging interview didn't end with success',
         'The challenging interview didn't end with offer',
         'The confusing interview didn't end with success',
         'The confusing interview didn't end with offer']
        >>> slash_product('I say goodbye/hello cruel/fun world.')  # doctest: +NORMALIZE_WHITESPACE
        ['I say goodbye cruel world.',
         'I say goodbye fun world.',
         'I say hello cruel world.',
         'I say hello fun world.']
        >>> slash_product('I say goodbye/hello/bonjour cruelness/fun/world')  # doctest: +NORMALIZE_WHITESPACE
        ['I say goodbye cruelness',
         'I say goodbye fun',
         'I say goodbye world',
         'I say hello cruelness',
         'I say hello fun',
         'I say hello world',
         'I say bonjour cruelness',
         'I say bonjour fun',
         'I say bonjour world']
        """
        # Terminating case is a sequence of strings without any slashes
        if not isinstance(string_or_seq, basestring):
            # If it's not a string and has no slashes, we're done
            if not any(slash in s for s in string_or_seq):
                return list(string_or_seq)
            ans = []
            for s in string_or_seq:
                # slash_product of a string will always return a flat list
                ans += slash_product(s)
            return slash_product(ans)
        # Another terminating case is a single string without any slashes
        if not slash in string_or_seq:
            return [string_or_seq]
        # The third case is a string with some slashes in it
        i = string_or_seq.index(slash)
        head, tail = string_or_seq[:i].split(space), string_or_seq[i+1:].split(space)
        alternatives = head[-1], tail[0]
        head, tail = space.join(head[:-1]), space.join(tail[1:])
        return slash_product([space.join([head, word, tail]).strip(space) for word in alternatives])