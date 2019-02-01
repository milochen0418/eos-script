#!/bin/bash
source $(dirname $0)/initAccount.sh
if [ $# -ne 1 ]
then 
	exit 1
fi 
cleos create account eosio $1 $EOSIO_PUBLIC_KEY
