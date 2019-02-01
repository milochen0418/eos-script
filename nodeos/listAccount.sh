#!/bin/bash
source $(dirname $0)/initAccount.sh
:<<JSON_EXAMPLE
$ cleos get accounts $EOSIO_PUBLIC_KEY
{
  "account_names": [
    "alice",
    "bob",
    "milochen"
  ]
}

$ cleos get accounts $EOSIO_PUBLIC_KEY | jq '.account_names[]' | sed 's/"//g'
alice
bob
milochen
JSON_EXAMPLE

cleos get accounts $EOSIO_PUBLIC_KEY | jq '.account_names[]' | sed 's/"//g'

