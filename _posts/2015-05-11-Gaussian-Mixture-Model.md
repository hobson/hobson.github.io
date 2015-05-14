---
layout: post
title: Gaussian Mixture Model
---

Working on this Kaggle challenge (Otto Product Categorization), it's becoming clear that the most appropriate hard-coded model is a Bayesian Classifier. And you don't need the "gamification" clues to tell you that. Though the clues helped. "I'm a strict Bayesian, you know" was the acknowledgment message I received last week with my first benchmark-range submission. Clever.

Anyway you've got counts of 93 discrete events (binary dimensions). These are most likely words, but could be anything, I guess, like counts of user types that purchase each product in the Otto inventory. I'm guessing they just found the 93 words with the most entropy in their short product descriptions and want us to do NLP to identify their category accurately.

We need to estimate a probability for each of 9 categories (classes) with 63k training set product models (where the category is known) and 200k+ "test" products where the category isn't provided. The prior probabilities for the categories, p_1 through p_9, can be easily estimated from the training set, but if the sample they provided isn't representative we'll need to iterate on the priors based on our predicted categorizations of the much larger "test set" data.

Now, for a Bayesian classifier, where you have to choose only one category, you'd want to estimate the likelihood ratio for each category and each record (product). According to Simon Haykin's book "Neural Networks and Learning Machines" the likelihood ratio is 

