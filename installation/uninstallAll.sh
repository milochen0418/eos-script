#!/bin/bash
for i in  $(dpkg -l | grep eosio | awk '{print $2}'); do 
	sudo aptitude remove $i ;
done
