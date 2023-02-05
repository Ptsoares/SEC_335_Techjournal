#!/bin/bash
#Ping a host using Nmap - From Gus Khawaja's example from the Kali Linux Pen Testing Textbook
 
### Global Variables ###
#Store IP address
IP_ADDRESS=$1
 
function ping_host(){
ping_cmd=$(nmap -sn $IP_ADDRESS | grep 'Host is up' | cut -d '(' -f 1)
}
 
function print_status(){
if [[ -z $ping_cmd ]]
then
echo 'Host is down'
else
echo 'Host is up'
fi
}
