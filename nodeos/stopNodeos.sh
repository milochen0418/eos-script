#!/bin/bash
for i in $(ps -ef | grep nodeos | grep eosio | awk '{print $2}')
do 
	kill -9 $i; 
done
rm -rf ~/eos
