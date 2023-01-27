#!/bin/bash
# Adapted bash script from Gus Khawaja in the Kali Linux Pen Testing Textbook
#Ping & get DNS name from a list of IPs saved in a file
 
#Prompt the user to enter a file name and its path.
read -p "Enter the IP addresses file name / path:" FILE_PATH_NAME
 
 
function check_host(){
        #if not the IP address value is empty
        if [[ -n $IP_ADDRESS ]]
        then
                ping_cmd=$(fping -c1 $IP_ADDRESS -q| grep 'min/avg/max' | cut -d '(' -f 1)
                echo '------------------------------------------------'
                if [[ -z $ping_cmd ]]
                then
                        :
                else
                        printf "$IP_ADDRESS\n"
                fi
        fi
}
 
#Iterate through the IP addresses inside the file
for ip in $(cat $FILE_PATH_NAME)
do
        IP_ADDRESS=$ip
        check_host
done
