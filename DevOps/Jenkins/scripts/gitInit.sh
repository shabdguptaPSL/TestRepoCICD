#!/bin/bash


#load configuration from file

config_file="gitInitConfig.txt"
if [ -f "$config_file" ]; then
	source "$config_file"
else
	echo "Error: Config file '$config_file' not found."
	exit 1
	
fi
#Access parameters from the config file
echo "GITURL: $GITURL"
echo "LOCALREPOPATH: $LOCALREPOPATH"

cd "$LOCALREPOPATH"

git clone $GITURL

git pull