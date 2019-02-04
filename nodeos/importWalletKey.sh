#!/bin/bash

NAME=default
PRIVATE_KEY=""
if [ $# -eq 0 ]
then 
	exit 1;
fi
if [ $# -eq 1 ]
then
	PRIVATE_KEY=$1
fi
if [ $# -eq 2 ]
then
	NAME=$1
	PRIVATE_KEY=$2
fi



#PRIVATE_KEY=$(listWalletKey.sh $NAME | grep $PUBLIC_KEY | awk '{printf $2}' )
#echo -e "$NAME\t$PUBLIC_KEY\t$PRIVATE_KEY";


cleos wallet import --private-key $PRIVATE_KEY --name $NAME

