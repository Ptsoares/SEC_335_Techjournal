#!/bin/bash

# This is a bash script for the ethical hacking and pen. testing course SEC-335. When you provide a network prefix and a DNS server, the script will return the hostnames for the valid servers.

prefix=$1
dns=$2

echo "DNS resolution for" $1
for i in $(seq 1 254); do
    timeout .1 bash -c "echo nslookup $prefix.$i $dns" 2>/dev/null
done
