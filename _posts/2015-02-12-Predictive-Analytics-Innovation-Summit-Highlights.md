---
layout: post
title: Predictive Analytics Innovation Summit highlights
---

The first day at [#PASanDiego](https://theinnovationenterprise.com/summits/predictive-analytics-innovation-summit-san-diego2015/) organized by [@IE_analytics](https://theinnovationenterprise.com/) has been interesting. I haven't heard a lot of controversial insights, it's been useful nontheless.  

Haile Owusu set the pace with his description of Mashable's prediction of content share saturation point. Their models rely on very few fields/features to accomplish pretty impressive accuracy on their predictions. However, they didn't describe how they avoid corrupting their performance analysis of their prediciton algorithms by acting on them and only promoting those articles that their algorithm flags as highly sharable.

Ihab Ilyas from @Tamr_Inc described their system for automating the processing of mining large EWSes (Enterprise Warehouses) in a pretty powerful way. They preprocess all fields iwth statistical sampling and metadata computation to reduce the time required for correlation and relationship identification. This is the innermost loop in the O(N^2) problem of finding connections between fields (when you have millions of fields). And they first identify clusters or groups of records "talking about the same thing", like a customer, in multiple different tables and databases. We do something similar at SHARP, but rely a lot more on human interraction.

Michael Li (formerly FourSquare, now his own training/consulting company) looked at the spread (standard deviation) in regression results where he predicts the "utility" of Data Scientists that a company is interviewing/hiring. Like nearly everyone at the conference, Michael emphasized the benefit of advanced degrees. I guess a conference where most speakers are PHDs will tend to trust that "feature" as an indicator of future performance.

Sastry described Stubhub's hybrid db structure (EWS + hadoop) and his hope that they can eventually move to a pure hadoop infrastructure.  But he acknowledged that data volume ingestion is not a problem for traditional databases and EWSes. Hadoop is most valuable when you need to process the data to extract business insight. Replace hadoop with Postgres and Sastry could've been describing our hybrid architecture. I imagine many large corporations are in the same boat.

Eric Daly descrbed Sony's movie greenlighting algorithm and prediction of DVD/online release success, and the seasonality of release success. Surprisingly the only features they use so far in their regression is rating (R vs PG-13), genre, and box-office ticket sales on opening weekend. I must have misunderstood his use of "box office" as an input feature, because that seems to be more of a target variable rather than predictor feature.

Arijit Sengupta, CEO at BeyondCore engaged the audience (literally) in his thesis that humans should get out of the way of computers which are better at finding correlations/patterns. He dropped the bomb that "1.9M business managers can't understand a data science report."

Alex Garcia spoke after lunch and talked about Walmart's gradual shift from emphasis on short term financial performance (as target metric in all regressions/analyses) to long term impact on all 4 aspects important to company (employees, customers, suppliers, and financials). That's a good way of bypassing the difficult problem of long-term forecasting of financials, which would otherwise capture all these impacts of a particular business process change. We should look at those 4 metrics at SHARP with each of our actions.

Jessica Kirkpatrick, from Chegg, presented a polished presentation about finding/hiring/training Data Scientists in a world is being overwhelmed with data.

Indrajit Roy from HP described R as a funcitonal programming language. I'd never thought of it that way. HP has an interesting SAAS tool that provides R tools for analyzing your data with only "15 minutes of configuration... but find yourself a nice IT person."

There's a lot here I can refer back to in [my presentation](http://slides.com/hobsonlane/data-analytics-war-stories#/) if only I can remember it all.
