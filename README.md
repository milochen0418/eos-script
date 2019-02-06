
# Easy Usage
## Step 1. First time to use 
$ cd ~/  
$ git clone https://github.com/milochen0418/eos-script  
$ source ~/eos-script/nodeos/use-eos-script.sh  
$ cd ~/eos-script/  
$ ./install_basic_package.sh  
$ cd ~/eos-script/  
$ ./envReboot.sh  

recall the following script whenever you want to have new clean environment (no wallet, account, key ... everything was been clean. And packages also be reinstall again) 
$ ./envReboot 

## Step 2. Start to test first smart contract
Open another terminal
$ cd /tmp  
go to any folder your want. we go to tmp folder here  
  
$ git clone https://github.com/milochen0418/eos-contract-helloworld  
$ cd eos-contract-helloworld  
$ source ~/eos-script/nodeos/use-eos-script.sh   
Use the eos script  

$ ./build.sh  
The building result will show in hello subfolder  
  
$ createAccount.sh user1
$ createAccount.sh user2
To create two account, user1 and user2 
  
$ ./deploy.sh user1
To deploy your built result to user1 account.

user2 call function in user1 contract   (user1 is a contract name. also account name too... the same?)
$ cleos push action user1 hi '["user"]' -p user2@active
$ cleos push action user1 hiauth '["user"]' -p user2@active  <-- this should not be work after calling it 
$ cleos push action user1 hiauth '["user2"]' -p user2@active <-- this should be work after calling it
If you want to redploy it in new clear environment, then   
you can reset environment by calling   
./envReboot.sh in the volder  ~/eos-script/installation/  




Another complicated detail should not care about by new developer in following. 

# Environment 
Please use Ubuntu 16.04 to run this eos-script. the eos-script is work on Ubuntu 16.04  
And in Ubuntu 16.04, you need to choose the following packages.  
https://github.com/eosio/eos/releases/download/v1.5.0/eosio_1.5.0-1-ubuntu-16.04_amd64.deb   
https://github.com/EOSIO/eosio.cdt/releases/download/v1.4.1/eosio.cdt-1.4.1.x86_64.deb  
If your Ubuntu 16.04 is first time to use EOS, please call command keosd first and close it.
If you didn't do it, then some plugin for nodoes will not work.


# install these basic packages in your new ubuntu 16.04
$ sudo apt-get install aptitude  
$ sudo apt-get install jq
$ sudo apt-get install locate 
$ sudo apt-get install curl wget git 
$ sudo apt-get install software-properties-common
$ sudo add-apt-repository ppa:ubuntu-toolchain-r/test
$ sudo apt-get update
$ sudo apt-get install libstdc++6
$ sudo updatedb

Or you can run install_basic_package.sh provided by eos-script project
# Download scripts
$ cd ~  
$ git clone https://github.com/milochen0418/eos-script.git   
$ cd ~/eos-script  

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
reinstallAll.sh script will use the *deb you downloaded before, If you want to re-download *.deb   
and install them, then use this command  
$ ./reinstallAll.sh -f  

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
./queryWalletKey.sh WALLET_NAME SOME_KEY KEY_TYPE  
KEY_TYPE= private OR public  
for example   
$ ./queryWalletKey.sh default EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV private  
5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3  
It's mean search private key 
   
$ ./queryWalletKey.sh default EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV public  
EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV    
It's mean search public key  
  
$./queryWalletKey.sh default EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV any  
EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV   5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3  
It's mean show public key, \t and then show private key  


## [keys in a wallet] two different wallet can own same public/private key pair. and they can import each other
For example, this is what I do  
$ ./listWalletKey.sh default  
<font size="3">  
EOS5P22BTSZmeufVYXVPsD7h6fzq7eeujrzpYQ4d7XJffZfumDK1T   5KE4PS6QG9E1dCeBYpaV5ehUy2vxLgMom3dTVtC7Wqdsj7yxtLB  
EOS6iBjwKpjSpoJpVGE4aT9Uu8ioRut7F28QFJHiPRAWa9bMCYx9y   5JjNKVuTnt4xV54mkhgydZDyCiCUsPt78ZxhfYfVFEX7fdTo2jT  
EOS8LSL1ybcvCqBeD8YMaANR36Rq25HZ4x6CKxSjp7UQsNe6ejm5A   5K94TBAZyzFMiAkx61iQdGA5krDBCAREmKiUkKJCnt6Sgv2DqJZ  
</font>  
$ ./listWalletKey.sh milochen  
<font size="3">  
EOS5P22BTSZmeufVYXVPsD7h6fzq7eeujrzpYQ4d7XJffZfumDK1T   5KE4PS6QG9E1dCeBYpaV5ehUy2vxLgMom3dTVtC7Wqdsj7yxtLB  
EOS6iBjwKpjSpoJpVGE4aT9Uu8ioRut7F28QFJHiPRAWa9bMCYx9y   5JjNKVuTnt4xV54mkhgydZDyCiCUsPt78ZxhfYfVFEX7fdTo2jT  
EOS6yKTZZihDGdGW4XiF4jt3JMbAeQNB6EY3CgefEoRTwM97ZGiWA   5JFQ3EL792akrYDxA3Kb1qNsMNCBfhadXhqUu26wYhsEaB4T7xL  
EOS75ZdQjTPNjYRUyjoPjFWxayNbByfEeZqwdfHA24M2fxtZDWfeS   5KA6Q8D9d5P4Hr66PDJ7o5ouW25acZLAMrB1v4ZQYLvDwN1Qkkv  
EOS7KJukumkMnaoTUPcfxmrTyiK3iTDvY1RiaNrjtqdLKiSupXDPd   5JkmpySyrjeU1Mqqvcrmtk1VRQ3PqMVn9zbhrNJeR3icvXZkCgx  
EOS8LSL1ybcvCqBeD8YMaANR36Rq25HZ4x6CKxSjp7UQsNe6ejm5A   5K94TBAZyzFMiAkx61iQdGA5krDBCAREmKiUkKJCnt6Sgv2DqJZ  
EOS8VGCH7tQb6cp4z7xDjL1p9DXdBWeb423HvugaTBCNeKwG9WkLx   5Jou3cBHe7npihX2rbAhFqAhprLnM4o84RXZ24PZuwBzdhaRzgc  
</font>  



# [Account] Account Management
$ cd ~/eos-script/nodeos
## list account
$ ./listAccount.sh  
## create account  
$ ./createAccount.sh  
## get account info  
$ ./getAccount.sh ACCOUNT_NAME

## Some configuration
### eosioPrivateKey.sh  
Every new EOSIO chain has a default "system" user called "eosio". This account is used to setup the chain by loading system contracts that dictate the governance and consensus of the EOSIO chain. Every new EOSIO chain comes with a development key, and this key is the same. Load this key to sign transactions on behalf of the system user (eosio).   
In above description,   
The variable EOSIO_PRIVATE_KEY  we set in eosioPrivateKey is development key for this eosio account in EOSIO chian.  
### initAccount.sh
source initAccount.sh will make sure you has basic wallet setting with info of eosio(account name, private key in default wallet , public key in default wallet)   
The shell script who sourcing initAccount.sh will have EOSIO_PRIVATE_KEY and EOSIO_PUBLIC_KEY. The implementation of create account need to use EOSIO_PUBLIC_KEY.  

