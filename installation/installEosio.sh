#!/bin/bash
#if [ $(lsb_release -a | grep Release | awk '{print $2}' ) = "16.04" ]; then echo YES; fi

UBUNTU_VER=$(lsb_release -a | grep Release | awk '{print $2}')

if [ $UBUNTU_VER = "16.04" ]; then
	if [ ! -e eosio_1.5.0-1-ubuntu-16.04_amd64.deb ]; then 
		wget https://github.com/eosio/eos/releases/download/v1.5.0/eosio_1.5.0-1-ubuntu-16.04_amd64.deb
	fi
	#wget https://github.com/eosio/eos/releases/download/v1.5.0/eosio_1.5.0-1-ubuntu-16.04_amd64.deb
	sudo apt install -y ./eosio_1.5.0-1-ubuntu-16.04_amd64.deb
	exit 0
fi


if [ $UBUNTU_VER = "18.04" ]; then
	if [ ! -e eosio_1.6.0-1-ubuntu-18.04_amd64.deb ]; then 
		wget https://github.com/EOSIO/eos/releases/download/v1.6.0/eosio_1.6.0-1-ubuntu-18.04_amd64.deb
	fi
	sudo apt install -y ./eosio_1.6.0-1-ubuntu-18.04_amd64.deb
	exit 0
fi

echo "eosio package install failed because eos-script only support for Ubuntu 16.04 and Ubuntu 18.04"
exit 1;
