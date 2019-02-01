#!/bin/bash
source $(dirname $0)/eosioPrivateKey.sh
./createWallet.sh > /dev/null 2>&1
./unlockWallet.sh >/dev/null 2>&1
./importWalletKey.sh $EOSIO_PRIVATE_KEY > /dev/null 2>&1
EOSIO_PUBLIC_KEY=$(./queryWalletKey.sh default $EOSIO_PRIVATE_KEY public)

#initAccount make sure that
#EOSIO_PUBLIC_KEY
#EOSIO_PRIVATE_KEY
#BOTH KEY IS IN Wallet with name=default





