#!/bin/bash
# cleos wallet create --to-console
WALLET_INFO_FILE=~/eos-script-wallet/wallet_info.txt
TMP_PASSWD_FILE=/tmp/pass.txt

NAME=default
if [ $# -ne 0 ]
then 
	NAME=$1
fi

mkdir -p ~/eos-script-wallet/
touch $WALLET_INFO_FILE
touch $PASSWD_FILE

if grep --quiet $NAME $WALLET_INFO_FILE
then 
	echo "The wallet name $NAME is repeat."
else 
	cleos wallet create --name $NAME --file $TMP_PASSWD_FILE
	echo -e "$NAME\t$(cat $TMP_PASSWD_FILE)" >> $WALLET_INFO_FILE
fi

#cleos wallet create --name $NAME --file $TMP_PASSWD_FILE
#echo -e "$NAME\t$(cat $TMP_PASSWD_FILE)" >> $WALLET_INFO_FILE
rm -f $TMP_PASSWD_FILE

