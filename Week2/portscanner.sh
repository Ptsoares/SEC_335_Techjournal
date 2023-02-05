#!/bin/bash

# This is a modified bash script provided in the ethical hacking and pen. testing course SEC-335.
# Outside reference: https://linuxhint.com/prompt-for-input-bash/

read -e -p "Enter the hosts (target) file:" HOSTFILE

read -e -p "Enter the ports (tcp/udp) file:" PORTFILE

echo "host:port"
for host in $(cat $HOSTFILE); do
  for port in $(cat $PORTFILE); do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host:$port"
  done
done
