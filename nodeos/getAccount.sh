#!/bin/bash
source $(dirname $0)/initAccount.sh
cleos get account $1
