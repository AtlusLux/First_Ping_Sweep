#!bin/bash/

PREFIX=$1

echo "Scanning $PREFIX.0/24....."

for n in $(seq 1 255);
     do TARGET=$PREFIX.$n && ping -c 1 $TARGET  1>> /dev/null &&
       echo $TARGET" is UP!" 1>> live_hosts.txt ||
           echo $TARGET" is DOWN!" 1>> down_hosts.txt; done
cat live_hosts.txt
cat down_hosts.txt
