#!/bin/bash

NAME=default
PUBLIC_KEY=""
if [ $# -eq 0 ]
then 
	exit 1;
fi
if [ $# -eq 1 ]
then
	PUBLIC_KEY=$1
fi
if [ $# -eq 2 ]
then
	NAME=$1
	PUBLIC_KEY=$2
fi


PRIVATE_KEY=$(./listWalletKey.sh $NAME | grep $PUBLIC_KEY | awk '{printf $2}' )
echo -e "$PRIVATE_KEY";



