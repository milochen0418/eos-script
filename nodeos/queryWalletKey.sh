#!/bin/bash

NAME=default
SOME_KEY=""
KEY_TYPE=private
if [ $# -eq 0 ]
then 
	exit 1;
fi
if [ $# -eq 1 ]
then
	SOME_KEY=$1
fi
if [ $# -eq 2 ]
then
	NAME=$1
	SOME_KEY=$2
fi
if [ $# -eq 3 ] 
then
	NAME=$1
	SOME_KEY=$2
	KEY_TYPE=$3
fi



PRIVATE_KEY=$(./listWalletKey.sh $NAME | grep $SOME_KEY | awk '{printf $2}' )
PUBLIC_KEY=$(./listWalletKey.sh $NAME | grep $SOME_KEY | awk '{printf $1}' )
if [ "$KEY_TYPE" = "private" ] 
then
	echo -e "$PRIVATE_KEY"
	exit 0;
fi
if [ "$KEY_TYPE" = "public" ] 
then
	echo -e "$PUBLIC_KEY"
	exit 0;
fi


echo -e "$PUBLIC_KEY\t$PRIVATE_KEY";
exit 0;


