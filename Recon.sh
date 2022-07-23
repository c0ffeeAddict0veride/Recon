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
 coded by sud0.0veride version 1.5
'


sleep 1

TARGET=$1
nikto -h https://$TARGET/
dnsrecon --domain $TARGET
echo "Done"
sleep 1

cd knock
python3 knockpy.py $TARGET
cd
sleep 1
subtxt=$1
httptxt=$1
subfinder (){
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
}
subfinder
sleep 1
clear
echo "running Amass"
sleep 1
clear
echo "running Amass"
sleep 1
amass enum -d $TARGET
read -p 'look over data'
sleep 1
clear
sleep 1

echo "running Nmap"

nmap $TARGET
nmap $TARGET -sC
sudo nmap -sS $TARGET
nmap $TARGET -sV -p 80
nmap $TARGET -sC -p 80
nmap $TARGET -sV -p 443
nmap $TARGET -sC -p 443
nmap -sV --script=http-enum $TARGET -p 443
nmap -sV --script=vulners $TARGET
nmap -v -Pn -sT $TARGET

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

scanner (){
       cat $httptxt | nuclei -severity unknown,low,medium,high,critical -etags "intrusive"
}
scanner

read -p 'you done?'
echo "Done"

sleep 1

echo "Running dirsearch"

dirsearch --url https://$TARGET/ -x 403,500,301,302,400,404,423

sleep 1

echo "Done"
read -p 'you know what to do'
sleep 1
clear
sleep 1
echo "ruuning hakrawler"
echo https://$TARGET/ | hakrawler
sleep 1
read -p 'Done?'
sleep 1
echo "bye"
clear

echo "Running subzy"
echo "dont forget to look out for EXIF bugs!!!!"
sleep 1

subzy -target $TARGET

echo "Done"

read -p 'more nikto lol'


 nikto -h https://$TARGET/ -Tuning 0
 nikto -h https://$TARGET/ -Tuning 1
 nikto -h https://$TARGET/ -Tuning 2
 nikto -h https://$TARGET/ -Tuning 3
 nikto -h https://$TARGET/ -Tuning 4
 nikto -h https://$TARGET/ -Tuning 5
 nikto -h https://$TARGET/ -Tuning 7
 nikto -h https://$TARGET/ -Tuning 8
 nikto -h https://$TARGET/ -Tuning a
 nikto -h https://$TARGET/ -Tuning b 
 nikto -h https://$TARGET/ -Tuning c 


read -p 'done?'
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
xss(){
echo "XSS shit"
echo "Running XSStrike"
#commands one
cd XSStrike
python3 xsstrike.py -u https://$TARGET --crawl
sleep 1
echo "Done with Crawl now running Fuzzer"
read -p 'Add Prameter if you dont have one skip:' PRAMETER
sleep 1
python3 xsstrike.py -u https://$TARGET/$PRAMETER --fuzzer
cd
sleep 1
echo "Done"
sleep 1
read -p 'Look over data press enter to continue'
sleep 1
clear
echo "Running xsser"
read -p 'Add Prameter if you dont have one skip:' PRAMETER
xsser https://$TARGET/$PRAMETER
sleep 1
xsser -u https://$TARGET/XSS
sleep 1
}
xss
read -p 'Look over data press enter to continue'
echo "Done"
sleep 1
clear
echo " USE SHODAN AND METASPLOIT!!! "
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
echo "now running recon-ng"
sleep 1
cd recon-ng
python3 recon-ng
cd
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
