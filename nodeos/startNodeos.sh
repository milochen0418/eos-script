#!/bin/bash
echo "Please do $ ps -ax | grep keosd   and  $ ps -ax | grep nodeos"
echo "If keosd is exist, it will take http port. and the following code is no userful"
echo "Use thsudo kill -9 PID to kill these proces first" 

nodeos -e -p eosio \
--plugin eosio::producer_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::http_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
--data-dir /home/joanmirochen/eos/contracts/eosio/data \
--config-dir /home/joanmirochen/eos/contracts/eosio/config \
--access-control-allow-origin='*' \
--contracts-console \
--http-validate-host=false \
--verbose-http-errors \
--filter-on='*' >> nodeos.log 2>&1 &


echo "After exec nodeos, please use ./monitorNodeos.sh to observe log"
