
from random import randint
h, t = 0, 0
N, M = 4, 1000
for i in range(M):
    flip0 = randint(0, 1)
    for j in range(N-1):
        flip1 = randint(0, 1)
        if flip0:
            h += flip1
            t += not flip1
        flip0 = flip1
print h / float(h + t)
