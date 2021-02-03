#!/bin/bash

IPCIDR="x.x.x.x/x"

#This script gets all IPs in the provided subnet
#Run `ipconfig` or `ip addr show` and grab the IP CIDR for the desired subnet

#Script - start

#Ping scan all of network with Nmap | alternatively you could use fping
#Uncomment below line to install necessary tool
#sudo yum install nmap -y
#sudo yum install fping -y

#start nmap ping scan
nmap -sn $IPCIDR > nmapscan.txt

#parse nmap output file
grep "^Nmap" nmapscan.txt | grep -v done | awk -F ' ' '{print $5}' > ips.lst

#Now you have a file of your ips/hosts on the subnet that were reachable
#I suggest backgrounding this script

