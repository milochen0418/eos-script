# Environment 
Please use Ubuntu 16.04 to run this eos-script. the eos-script is work on Ubuntu 16.04  
And in Ubuntu 16.04, you need to choose the following packages.  
https://github.com/eosio/eos/releases/download/v1.5.0/eosio_1.5.0-1-ubuntu-16.04_amd64.deb   
https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb  
If your Ubuntu 16.04 is first time to use EOS, please call command keosd first and close it.
If you didn't do it, then some plugin for nodoes will not work.

# Download scripts
$ cd ~  
$ git clone https://github.com/milochen0418/eos-script.git   
$ cd ~/eos-script  

# install basic package in ubuntu 16.04
$ sudo apt-get install aptitude  
$ sudo apt-get install jq

# [Install] EOS package in installation folder
## remove previous packages
$ dpkg -i | grep eosio  
Makesure there is no package of eosio. If there is, you can do it to remove.  
$ sudo aptitude remove EOSIO_PACKAGE  
## start oinstall new packages for eosio  
$ cd ~/eos-script/installation   
$ ./installEosio.sh  
$ ./installCDT.sh  
## The most SIMPLE method is here
$ cd ~/eos-script/installation  
$ ./reinstallAll.sh  

# [Nodoes] start and monitor nodeos 
To make sure nobody use http port first, and then  
## stop nodeos  
$ cd ~/eos-script/nodeos/  
$ ./stopNodeos.sh  
## start and monitor nodeos
$ cd ~/eos-script/nodeos/  
$ ./startNodeos.sh  
$ ./monitorNodeos.sh  
## The most SIMPLE method
$ cd ~/eos-script/nodeos/  
$ ./restartNodeos.sh  

# [Wallet] Wallet Management and WalletKey Management
The folder ~/eos-script-wallet and files in it is created by our wallet management script  
$ cd ~/eos-script/nodeos  

## Show wallets status 
Show wallets status , username and password  
$ ./checkWallet.sh  

## Clean all walelts
Clean all wallets  
$ ./cleanWallet.sh  

## Add new wallet  
$ ./createWallet.sh USER_NAME  
if you don't have USER_NAME, then the default user name is 'default'  

## unlock some wallet  
Unlock the wallet of some user  
$ ./unlockWallet.sh USER_NAME  
 
## open some wallet
open the wallet of some user  
$ ./openWallet.sh USER_NAME  
When you open it, open is mean lock, so if you need to unlock it, just call ./unlockWallet.sh  

## [keys in a wallet] add key for specific wallet user with USER_NAME. the name will be default if you don't set USER_NAME
$ ./addWalletKey.sh USER_NAME  

## [keys in a wallet] list all keys for specific wallet user with USER_NAME. the name will be default if you don't set USER_NAME

$ ./listWalletKey.sh USER_NAME  
field_1 : public key  
field_2 : private key  

## [keys in a wallet] import private key
./importWalletKey.sh WALLET_NAME PRIVATE_KEY
./importWalletKey.sh PRIVATE_KEY

## [keys in a wallet] query private_key in a specific wallet by public key
./queryWalletKey.sh WALLET_NAME PUBLIC_KEY
./queryWalletKey.sh PUBLIC_KEY


## [keys in a wallet] two different wallet can own same public/private key pair. and they can import each other
For example, this is what I do
$ ./listWalletKey.sh default
EOS5P22BTSZmeufVYXVPsD7h6fzq7eeujrzpYQ4d7XJffZfumDK1T   5KE4PS6QG9E1dCeBYpaV5ehUy2vxLgMom3dTVtC7Wqdsj7yxtLB
EOS6iBjwKpjSpoJpVGE4aT9Uu8ioRut7F28QFJHiPRAWa9bMCYx9y   5JjNKVuTnt4xV54mkhgydZDyCiCUsPt78ZxhfYfVFEX7fdTo2jT
EOS8LSL1ybcvCqBeD8YMaANR36Rq25HZ4x6CKxSjp7UQsNe6ejm5A   5K94TBAZyzFMiAkx61iQdGA5krDBCAREmKiUkKJCnt6Sgv2DqJZ
$ ./listWalletKey.sh milochen
EOS5P22BTSZmeufVYXVPsD7h6fzq7eeujrzpYQ4d7XJffZfumDK1T   5KE4PS6QG9E1dCeBYpaV5ehUy2vxLgMom3dTVtC7Wqdsj7yxtLB
EOS6iBjwKpjSpoJpVGE4aT9Uu8ioRut7F28QFJHiPRAWa9bMCYx9y   5JjNKVuTnt4xV54mkhgydZDyCiCUsPt78ZxhfYfVFEX7fdTo2jT
EOS6yKTZZihDGdGW4XiF4jt3JMbAeQNB6EY3CgefEoRTwM97ZGiWA   5JFQ3EL792akrYDxA3Kb1qNsMNCBfhadXhqUu26wYhsEaB4T7xL
EOS75ZdQjTPNjYRUyjoPjFWxayNbByfEeZqwdfHA24M2fxtZDWfeS   5KA6Q8D9d5P4Hr66PDJ7o5ouW25acZLAMrB1v4ZQYLvDwN1Qkkv
EOS7KJukumkMnaoTUPcfxmrTyiK3iTDvY1RiaNrjtqdLKiSupXDPd   5JkmpySyrjeU1Mqqvcrmtk1VRQ3PqMVn9zbhrNJeR3icvXZkCgx
EOS8LSL1ybcvCqBeD8YMaANR36Rq25HZ4x6CKxSjp7UQsNe6ejm5A   5K94TBAZyzFMiAkx61iQdGA5krDBCAREmKiUkKJCnt6Sgv2DqJZ
EOS8VGCH7tQb6cp4z7xDjL1p9DXdBWeb423HvugaTBCNeKwG9WkLx   5Jou3cBHe7npihX2rbAhFqAhprLnM4o84RXZ24PZuwBzdhaRzgc


