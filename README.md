# Environment 
Please use Ubuntu 16.04 to run this eos-script. the eos-script is work on Ubuntu 16.04

# Download scripts
$ cd ~  
$ git clone https://github.com/milochen0418/eos-script.git   
$ cd ~/eos-script  

# install basic package in ubuntu 16.04
$ sudo apt-get install aptitude  

# Install EOS package in installation folder
## remove previous packages
$ dpkg -i | grep eosio  
Makesure there is no package of eosio. If there is, you can do it to remove.  
$ sudo aptitude remove EOSIO_PACKAGE  
## start oinstall new packages for eosio  
$ cd ~/eos-script/installation   
$ ./installEosio.sh  
$ ./installCDT.sh  

# start and monitor nodeos 
To make sure nobody use http port first, and then  
  
$ cd ~/eos-script/nodeos/  
$ ./startNodeos.sh  
$ ./monitorNodeos.sh  



