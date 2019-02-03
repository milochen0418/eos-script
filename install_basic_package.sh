#!/bin/bash

# install these basic packages in your new ubuntu 16.04
sudo apt-get install aptitude  
sudo apt-get install jq
sudo apt-get install locate 
sudo apt-get install curl wget git 
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install libstdc++6
sudo updatedb


