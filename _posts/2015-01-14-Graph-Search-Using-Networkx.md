---
layout: post
title: Graph Search Using Networkx
---

I'm having fun with a traveling salesman, minimum spanning tree problem over [here](http://github.com/hobson/sidetest/). Check it out for pretty graph diagrams and some cool Networkx python examples.

With a typical retailer website, you can query with a zip code to get a list of the closest N stores. Say you want to "visit" all the stores with as few queries as possible. 

If you use Kruskal's Algorithm with stores as veriticies and zipcodes as edges, it won't be optimal, because one zip would get you 5 vertices, but Kruskal only gives you credit for 1 as it explores the graph. You could give each zip/edge/arc a weight of N or N^2 (length of 1/N or 1/N^2, where N is the number of stores in that zip query (usually limited by some maximum pagination limit).  This edge weight improves things a bit, and is what I've done. But since the website will almost always return the maximum number of records, this weight is pretty uniform across all the edges, so it may not help all that much. What if you added 0-length edges between all stores returned on the first page for a given zip!? Now we're talking!

But wait, you don't get ALL the possible nodes for a given zipcode query. You only get N_limit.  So maybe 1/N is still the right cost metric (length). We'll see. Check out the [repo](http://github.com/hobson/sidetest/) to see what I come up with.
