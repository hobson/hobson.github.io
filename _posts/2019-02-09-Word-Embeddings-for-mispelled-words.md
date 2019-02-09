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

Universal Sentence Encoders have walked up the "food chain" from words to thoughts. The proposed approach may facilitate the connection to the lower level sustenence of syllables and characters that make up tokens and n-grams.
