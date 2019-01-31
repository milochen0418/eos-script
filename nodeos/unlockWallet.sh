#!/bin/bash
#cleos wallet unlock
#cleos wallet unlock --name default --password PW5HuLDWK2QpvHnjMy8fhQULACJZBBrGJ55P4TEdyy3yv4x5HcatH
WALLET_INFO_FILE=~/eos-script-wallet/wallet_info.txt
NAME=default
if [ $# -ne 0 ]
then 
	NAME=$1
fi

PASSWD=$(cat $WALLET_INFO_FILE | grep $NAME | awk '{print $2}')

cleos wallet unlock --name $NAME --password $PASSWD
#cleos wallet unlock --name default --password PW5HuLDWK2QpvHnjMy8fhQULACJZBBrGJ55P4TEdyy3yv4x5HcatH
