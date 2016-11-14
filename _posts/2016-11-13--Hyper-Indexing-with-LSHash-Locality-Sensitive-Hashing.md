---
layout: post
title: Hyper-Indexing with LSHash (Locality Sensitive Hashing)
---

Indexing topic vectors from an LSI Model is more difficult than it seems.  My first instinct was to use the 3D indexer plugin for PostgreSQL, `PostGIS`. After all that's the typical example I keep in my head for indexing. You create a discrete "on or off" label for each location based on whether it is present or absent within a grid point. This allows you to efficiently find it (and any nearby points) with a query with a `WHERE grid = 'A11'` for a letter/int 2D indexing system that you see on old paper road maps from AAA. 

I assumed this simple approach would extend out to multiple dimensions, but it doesn't. Turns out, it's not possible to efficiently index and search on hyperdimensional space (out beyond a few dimensions). But you can push the limits with a python package calls `LSHash` which implements Locality Sensitive Hashing. This approach isn't theoretically as efficent as R*Tree (the current state of the art for multi-dimensional indexing), but it's pretty darn powerful up to 8 dimensions.

```python
import numpy as np
from lshash import LSHash

tenthclosest = []  # for each test, record distance to the 10th closest point for a random query
for D in range(2, 11):  # Run tests for 2D through 10D
    X = np.random.normal(size=(200000, D))  # Fill the N-D space with 200k random vectors
    lsh = LSHash(hash_size=int(64 / D) + D, input_dim=D, num_hashtables=D)

    # query vector
    q = np.random.normal(size=(D,))
    q /= np.linalg.norm(q)

    distances = []
    for x in X:
        lsh.index(x)
        x /= np.linalg.norm(x)  # topic vectors are typically normalized
        distances += [1 - np.sum(x * q)]  # keep track of all the cosine distances to double check

    distances = sorted(distances)
    closest = lsh.query(x, distance_func='cosine')
    N = len(closest)
    rank = min(10, N)
    tenthclosest += [[D, N - 1, closest[rank - 1][-1] if N else None, distances[rank - 1]]]
    print(tenthclosest[-1])
```

For 8D space and higher you'll need millions of points in your space to have a chance of finding anything nearby. And the lshash will be less and less useful at these higher dimensions because it won't be possible to partition the space with a reasonable number of hyperplanes so that the returned points truly are the closest points. 

```python
>>> tenthclosest
[
  [2, 9480, 1.8566308490619576e-09, 1.8566308490619576e-09]
  [3, 1791, 9.3939812061627492e-05, 9.3939812061738515e-05]
  [4, 2492, 0.0016495388314403669, 0.0016495388314402559]
  [5, 1042, 0.0062851055257979738, 0.0062851055257979738]
  [6, 1161, 0.01919247547800762, 0.01919247547800762]
  [7, 1298, 0.037779915230408245, 0.037190703103046285]   # the hashes didn't find them all
  [8, 932, 0.040481502423105997, 0.040481502423105997]
  [9, 1230, 0.066732165658179299, 0.066732165658179188]   # the hashes didn't find them all
  [10, 835, 0.10840345965900211, 0.095584594509859677]    # the hashes didn't find them all
]
```

So the lesson here is.

- LSH partitions the space with hyperplanes through the origin, so it works best for normalized vectors
- As the number of dimensions increases your need more hashtables to ensure you can find points in neighboring grid cells in case some queries lie near the boundary of a grid in one of the hashtables
- As the number of dimensions increases the number of hyperplanes you need to slice the space decreases proportionately
- As the number of dimensions incrases the distance to the nearest points will increase exponentially, even for dimension-insensitive metrics like cosine distance.