#!/bin/bash
EOS_SCRIPT_PATH=$HOME/eos-script/nodeos
PATH=$PATH:$EOS_SCRIPT_PATH

echo "echo \$PATH"
echo "There should be $EOS_SCRIPT_PATH in your \$PATH"
echo "If there is not, please use this way."
echo "source ./use-eos-script.sh"
