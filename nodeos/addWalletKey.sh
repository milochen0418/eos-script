#!/bin/bash

NAME=default
if [ $# -ne 0 ]
then 
	NAME=$1
fi

cleos wallet create_key --name $NAME



