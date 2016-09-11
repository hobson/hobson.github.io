#!/bin/sh 

# # This is the tmux approach I couldn't get working
# tmux new-session -s collider -d 'python -c "import random; print(random.randint(0,1000000000));"'
# tmux new-window -s collider 'python -c "import random; print(random.randint(0,1000000000));"'

# So I thought ma
for ((i=0; i<100; i++))
do 
    python -c "import random; print(random.randint(0,1000000000));" > /tmp/collider.${i}.log &
done

for ((i=0; i<100; i++))
do 
    python -c "import time; print(repr(time.time()));" > /tmp/collidetime.${i}.log &
done

# no python random collisions on my machine
cat /tmp/collidetime.*.log | sort | uniq -c | grep -e '\b+[2-9]\b'

# but there were 3 out of 100 time.time() "collisions" on my 4-core 2.5GHz i7 CPU
cat /tmp/collidetime.*.log | sort | uniq -c | grep -e '\b[2-9]\b'
#      2 1473613474.737581
#      2 1473613474.743379
#      2 1473613474.755999
