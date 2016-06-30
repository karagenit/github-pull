#!/bin/bash

# Fix Symlink Running
cd "$(dirname "$(realpath "$0")")"

# Config
DOCS_DIR=./docs/
GH_MODE="D_KEY"

# Set Config by Command Line Args
while [ $1 ]
do
	if [ "$1" = "-u" ]; then
		GH_MODE="USER"
	fi

	shift
done

# Create Directory

if [ ! -d "$DOCS_DIR" ]; then
	mkdir $DOCS_DIR
fi

# Setup Repo Directory
if [ -d "${DOCS_DIR}.git/" ]; then
	git -C $DOCS_DIR reset --hard HEAD
else
	git -C $DOCS_DIR init
fi

# Pull From Github
if [ "$GH_MODE" = "USER" ]; then
	echo -n "Username: "
	read uname
	echo -n "Password: "
	read -s pword
	git -C $DOCS_DIR pull https://${uname}:${pword}@github.com/frc868/reference.git
fi

if [ "$GH_MODE" = "D_KEY" ]; then
	echo Attempting SSH Key Access
	git -C $DOCS_DIR pull git@github.com:frc868/reference.git
fi
