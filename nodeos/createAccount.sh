#!/bin/bash
source $(dirname $0)/initAccount.sh
if [ $# -eq 0 ]
then 
	exit 1
fi 

if [ $# -eq 1 ]
then 
	ACCOUNT_NAME=$1
	cleos create account eosio $ACCOUNT_NAME $EOSIO_PUBLIC_KEY
	exit 0
fi



ACCOUNT_NAME=$1
ACTIVE_NAME=$2
cleos create account eosio $ACCOUNT_NAME $EOSIO_PUBLIC_KEY -p $ACTIVE_NAME@active
exit 0

