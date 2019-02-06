#!/bin/bash
IS_CLEAN_DEB="no"
if [ $# -ne 0 ]; then
	if [ $1 = "-f" ]; then
		IS_CLEAN_DEB=yes
	fi
fi 
if [ $IS_CLEAN_DEB = "yes" ]; then
	echo "clean *.deb you download before"
	rm -f *.deb
fi 

echo "Uninstall all eosio related package"
./uninstallAll.sh
echo "Install all eosio related package"
./installAll.sh
