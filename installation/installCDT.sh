#!/bin/bash
if [ ! -e eosio.cdt-1.4.1.x86_64.deb ]; then 
	wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb
fi
#wget https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb
sudo apt install -y ./eosio.cdt-1.4.1.x86_64.deb
