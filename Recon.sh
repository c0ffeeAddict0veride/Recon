#!/bin/bash

#Usage ./Frist.sh domain

echo "updating piz wait....."
sleep 1 
echo "add password"
sleep 1
sudo apt update 
sudo apt upgrade
echo "done"
sleep 1 
clear

echo '
__________
\______   \ ____   ____  ____   ____
 |       _// __ \_/ ___\/  _ \ /    \
 |    |   \  ___/\  \__(  <_> )   |  \
 |____|_  /\___  >\___  >____/|___|  /
        \/     \/     \/           \/
 coded by c0ffeeAddict0veride version 1.0 
'


sleep 1

TARGET=$1
nikto -h $TARGET

echo "Done"
sleep 1

cd knock
python3 knockpy.py $TARGET
cd
sleep 1
subtxt=$1
httptxt=$1
read -p 'lol knockpy can be shit so enjoy assett finder this will also be helpful :) '
read -p 'subtxt file name: ' subtxt
read -p 'httptxt file name: ' httptxt
echo "running assetfinder"
sleep 1
assetfinder --subs-only $TARGET | tee -a $subtxt 
echo "***ruuning httprobe***"
sleep 1
cat $subtxt | httprobe | tee -a $httptxt
sleep 1 
echo "Done"
read -p 'look over data piz'
cd
sleep 1
clear
echo "running Nmap"

nmap $TARGET
nmap $TARGET -sV -p 80
nmap $TARGET -sC -p 80
nmap $TARGET -sV -p 443
nmap $TARGET -sC -p 443
nmap -sV --script=http-enum $TARGET -p 443
nmap -sV --script=vulners $TARGET

echo "Done"
read -p 'look over data'
echo "damm this is gonna die in "
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1

read -p 'looked over data?'
sleep 1
echo "rip"
sleep 1
clear

sleep 1

echo "Running nuclei"

nuclei -u $TARGET


echo "Done"

sleep 1

echo "Running dirsearch"

dirsearch --url https://$TARGET/ -x 403,500,301,302,400,404,423

sleep 1

echo "Done"
read -p 'you know what to do'
sleep 1 
echo "bye"
clear

echo "Running subzy"

sleep 1

subzy -target $TARGET

echo "Done"

# systems crash on big targets now InjectX is one of the most impactful

echo "Running sniper"

read -p 'sniper being annoying af add password and pray that theres not a system crash :('

sudo sniper -t $TARGET

sleep 1

echo "Done"
sleep 1
echo "updating piz wait....."
sleep 1 
echo "add password"
sleep 1
sudo apt update 
sudo apt upgrade
echo "done"
sleep 1 
clear

read  -p ' look over ur shit cuz XSRFProbe gonna eat up the terminal '

echo "here it comes lol"
sleep 1

cd  XSRFProbe
cd  xsrfprobe
cd bin

# issue's with this need fixing
python3 xsrfprobe -u  $TARGET
cd
cd
cd
echo "Done"

sleep 1

echo "XSS shit"

cd  XSStrike

python3 xsstrike.py -u $TARGET --fuzzer
python3 xsstrike.py -u $TARGET --crawl
cd
sleep 1 
xsser -u https://$TARGET/XSS
# pramenters need fixing for target
cd

echo "Done"
read -p 'look over data'
sleep 1 
clear
echo " USE SHODAN!!! "
sleep 1
echo "wapiti"
sleep 1 
cd
wapiti -u https://$TARGET/

echo "Done"
read -p 'look over data'
sleep 1
echo "updating..."
echo "add password"
sleep 1
sudo apt update 
sudo apt upgrade
clear
read -p ' ffuf about to eat the terminal cuz its fat so look over data '

sleep 1

ffuf -w fuzzlist.txt -u https://$TAREGT/FUZZ

echo "Done"
sleep 1 
read -p 'look over data'
sleep 1     
clear 
echo "tetsing JS files on site (JavaScript Enumeration)"
waybackurls $TARGET | grep "\\.js" | xargs -n1 -I@ curl -k @ 
sleep 1 
echo "done"
read -p 'look over data'
sleep 1 
clear 
echo "this might take 40 years"
sleep 2
nmap -p- -sC -o scan -iL  $subtxt 
read -p 'look over'
clear
echo "this might take 50 years"
sleep 1 
sniper -f $subtxt -m massvulnscan
echo "done"
sleep 1 
read -p 'look over data'
sleep 1 
clear 

read -p "done"
