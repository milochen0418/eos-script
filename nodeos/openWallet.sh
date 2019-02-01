#!/bin/bash
NAME=default
NAME=default
if [ $# -ne 0 ]
then 
	NAME=$1
fi

cleos wallet open --name $NAME

