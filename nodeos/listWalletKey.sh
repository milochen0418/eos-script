#!/bin/bash

WALLET_INFO_FILE=~/eos-script-wallet/wallet_info.txt
NAME=default
if [ $# -ne 0 ]
then 
	NAME=$1
fi
PASSWD=$(cat $WALLET_INFO_FILE | grep $NAME | awk '{print $2}')
TMPJSON=/tmp/pubprivkeys.json
#cleos wallet private_keys --name default --password PW5JuyD4L5YrhrQAYsA3L1vQrV77DLZHhMxUh5XGbU4a4ahWdqvwS

rm -f $TMPJSON 
cleos wallet private_keys --name $NAME --password $PASSWD > $TMPJSON 
#cat $TMPJSON
# convert json to .cvs format
ITER_LIST=$(seq 0 $(cat $TMPJSON  | jq 'length-1') | awk BEGIN{RS=EOF}'{gsub(/\n/,",");print}')
#ITER_LIST=0,1,2,...,length-1
cat $TMPJSON | jq ".[$ITER_LIST][]" |  sed 's/\"//g' | awk 'NR%2==1{printf $1"\t"} NR%2==0{printf $0"\n"}' 


:<<JSONEXAMPLE
For example, the json content is stored in the file path $TMPFILE  would like this
[[
    "EOS6yKTZZihDGdGW4XiF4jt3JMbAeQNB6EY3CgefEoRTwM97ZGiWA",
    "5JFQ3EL792akrYDxA3Kb1qNsMNCBfhadXhqUu26wYhsEaB4T7xL"
  ],[
    "EOS75ZdQjTPNjYRUyjoPjFWxayNbByfEeZqwdfHA24M2fxtZDWfeS",
    "5KA6Q8D9d5P4Hr66PDJ7o5ouW25acZLAMrB1v4ZQYLvDwN1Qkkv"
  ],[
    "EOS7KJukumkMnaoTUPcfxmrTyiK3iTDvY1RiaNrjtqdLKiSupXDPd",
    "5JkmpySyrjeU1Mqqvcrmtk1VRQ3PqMVn9zbhrNJeR3icvXZkCgx"
  ],[
    "EOS8VGCH7tQb6cp4z7xDjL1p9DXdBWeb423HvugaTBCNeKwG9WkLx",
    "5Jou3cBHe7npihX2rbAhFqAhprLnM4o84RXZ24PZuwBzdhaRzgc"
  ]
]
JSONEXAMPLE

:<<ITERLISTDATA
Then the ITER_LIST variable will get ths list 1,2,3,4
ITERLISTDATA

:<<CSVCONVERT
Use the list list and travel it... you can see what happen on it without awk first
And then use awk to parse it into csv file... It would like the following. odd number line would 
be first column in csv and  even number line would be second column in csv.
The converted data would like the following

EOS6yKTZZihDGdGW4XiF4jt3JMbAeQNB6EY3CgefEoRTwM97ZGiWA   5JFQ3EL792akrYDxA3Kb1qNsMNCBfhadXhqUu26wYhsEaB4T7xL
EOS75ZdQjTPNjYRUyjoPjFWxayNbByfEeZqwdfHA24M2fxtZDWfeS   5KA6Q8D9d5P4Hr66PDJ7o5ouW25acZLAMrB1v4ZQYLvDwN1Qkkv
EOS7KJukumkMnaoTUPcfxmrTyiK3iTDvY1RiaNrjtqdLKiSupXDPd   5JkmpySyrjeU1Mqqvcrmtk1VRQ3PqMVn9zbhrNJeR3icvXZkCgx
EOS8VGCH7tQb6cp4z7xDjL1p9DXdBWeb423HvugaTBCNeKwG9WkLx   5Jou3cBHe7npihX2rbAhFqAhprLnM4o84RXZ24PZuwBzdhaRzgc
CSVCONVERT

rm -f $TMPJSON  2>/dev/null

