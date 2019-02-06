#!/bin/bash
cleanWallet.sh && stopNodeos.sh && ./reinstallAll.sh && restartNodeos.sh && monitorNodeos.sh
