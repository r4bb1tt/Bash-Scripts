#!/bin/bash

# Version: 0.0.1

# Author: R4bb1TT

# Email: josh.threadgate@linux.com

# Script Variables

DEFAULT_ANSWER=""
SKELETON_CSS="https://raw.githubusercontent.com/r4bb1tt/Skeleton/master/css/skeleton.css"
NORMALIZE_CSS="https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css"

# save, clear screen
tput smcup
clear

# Start of script
echo -n "Hello, "$USER". This script will create a default Harp project. \n"
read -p "Do you want to proceed? (Y/n) " RESP
if [ "$RESP" = "$DEFAULT_ANSWER" ]; then

# This creates the required JSON file
touch harp.json

# This creates a folder for the development of the project
echo -n "Creating the folder structure\n"
mkdir public

# Change to the PUBLIC directory
cd public

# This creates the required directory structure
mkdir _includes
mkdir css
mkdir img
mkdir js

# This creates the partial files
cd _includes
touch head.ejs
touch nav.ejs
touch footer.ejs

# Return to PUBLIC Directory
cd ../

# This creates the base files that are required
touch 404.ejs
touch index.ejs


read -p "Do you need a CSS framework? (Y/n) " RESP
	if [ "$RESP" = "$DEAULT_ANSWER" ]; then
		read -p "Do you want to use Skeleton CSS (Y/n) " RESP 
		if [ "$RESP" = "$DEFAULT_ANSWER" ]; then
# This Downloads the CSS framework
cd css
echo -n "Downloading the CSS starter kit\n"
wget -q "SKELETON_CSS" -O skeleton.css
			else
				echo "#######################################"
				echo "You need to manually install a CSS file"
				echo "#######################################"
		fi

		read -p "Do you want to use Normalize CSS (Y/n) " RESP 
		if [ "$RESP" = "$DEFAULT_ANSWER" ]; then
# This downloads the master version of normailze.css
echo -n "Downloading Normalize.css\n"
wget -q "NORMALIZE_CSS" -O normalize.css
			else
				echo "#######################################"
				echo "You need to manually install Normalize"
				echo "#######################################"

		fi
fi
# Return to PUBLIC directory
cd ../

# Return to ROOT directory
cd ../

# restore
tput rmcup

# Exiting
exit 0


# Exit due to FAILURE
else
  echo "Better luck next time."
  exit 1
fi
