#!/bin/bash


UBUNTU_VER=$(lsb_release -a | grep Release | awk '{print $2}')

if [ $UBUNTU_VER = "16.04" ]; then
	if [ ! -e eosio.cdt-1.4.1.x86_64.deb ]; then 
		wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb
	fi
	#wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb
	sudo apt install -y ./eosio.cdt-1.4.1.x86_64.deb
	exit 0;
fi


if [ $UBUNTU_VER = "18.04" ]; then
	if [ ! -e eosio.cdt-1.5.0-1_amd64.deb ]; then 
		#wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb
		wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.5.0/eosio.cdt_1.5.0-1_amd64.deb
	fi
	#wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb
	sudo apt install -y ./eosio.cdt-1.5.0-1_amd64.deb
	exit 0;
fi



