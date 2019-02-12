---
layout: post
title: Infinite-vocabulary word embeddings
---

Word embeddings are at the core of the most impressive natural language models. Dialog systems, abstractive summarizers, universal sentence embeddings, question answering systems and even unsupervised knowledge extraction  engines all rely on broad vocabularies of word embeddings. But even the 1M word vocabulary of Word2vec and GloVE embeddings isn't broad enough to solve the most useful challenges for natural language processing, such as medical record summarization, or even dialog engines that can handle the ever expanding vocabulary of teenagers.

Examples of architectures built on top of the wordvector foundation

- CNNs
- LSTMs
- GRUs
- GANS
- encoder-decoder

It may be possible to keep NLP pipelines up to speed on the ever changing and mistaken world of human language with online incremental learning of word embeddings. An initial seed of word embeddings can be perpetually refined to continually improve the precision of existing embeddings to match a particular domain's use of words (such as medical texts). In addition, new tokens can be added to the vocabulary as they become commonplace in communication among multiple people. This can be accomplished with a simple hybrid architecture of character-based LSTM models with the feedforward (fully-connected) network required for the embedding vector.

Word vectors gave us embeddings that capture the meaning of individual words. Sentence encoders built on that foundation by giving us nonlinear embeddings of short word vector sequences. These thought vectors extract much more of the meaning left behind by linear combinations word vectors. But some important chunks of meaning are invisible to this high level representation of meaning and thought. When new words are encountered they must be treated as blanks or approximated with other word vectors. The most effective approach developed to date has been to simple select a random word vector from your vocabulary to represent the new word. This noise minimizes the discontinuity in the encoder's learned model of the thought within a sentence. 

We propose a more thoughtful encoding new words into a word vector. We propose to **learn** a character sequence encoding that generates word vectors. And we suggest that employing existing word vector representations to represent the new words to give the character-based model a head start on learning the semantics of character sequences.

One logistics challenge when training character-based encodings of words is similar to the challenge faced when generating skip-grams for the original training of word vectors. Statistics of word usage must be used to optimize the selection of token boundaries, particularly for compound words and optimal n-grams that minimize the loss of information resulting from this windowing of character sequences. For a character-based model that does not depend upon tokenizers for this windowing, it is particularly critical. The character-based model will also learn the boundaries of tokens from the tokenizer that was used to train the original word vectors. And this model can be used to continue segmenting unfamiliar sequences of characters into tokens that capture comparable amounts of meaning, thought.

Once this character-based word vector encoder can predict word vectors boundaries and the word vectors themselves with sufficient accuracy it can be unleashed from the original word vector vocabulary. Dealing with semantic drift of the word vectors as well as the tokenizer may be a detriment or desirable flexibility of the new approach.
Our algorithm can encode new words and find new compound words while simultaneously incrementally adjusting the "legacy" word vectors. 
