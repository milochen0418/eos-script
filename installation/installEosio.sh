#!/bin/bash

if [ ! -e eosio_1.5.0-1-ubuntu-16.04_amd64.deb ]; then 
	wget https://github.com/eosio/eos/releases/download/v1.5.0/eosio_1.5.0-1-ubuntu-16.04_amd64.deb
fi
#wget https://github.com/eosio/eos/releases/download/v1.5.0/eosio_1.5.0-1-ubuntu-16.04_amd64.deb
sudo apt install -y ./eosio_1.5.0-1-ubuntu-16.04_amd64.deb
