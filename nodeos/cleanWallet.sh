#!/bin/bash

WALLET_INFO_FILE=~/eos-script-wallet/wallet_info.txt
TMP_PASSWD_FILE=/tmp/pass.txt

rm -rf ~/eosio-wallet
mkdir -p ~/eos-script-wallet/
rm -f $WALLET_INFO_FILE
rm -rf ./eos-script-wallet
