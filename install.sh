#!/bin/bash

echo "######################################"
echo " WELCOME TO RIN'S FIRST FOSS PROJECT"
echo "######################################"

echo "this is a reflector updating script for pacman, which can be run with the command 'reflect'"

#initializes a user read-response
read -p "would you like to install or uninstall this project from your machine? (i/u) " answer

#location of apps
reflectapp="/home/$USER/reflector-updater/reflect"
reflectbin="/usr/bin/reflect"

#installs the app, if app not found, error command is shown
install() {
	if [ -e "$reflectapp" ]; then
		echo "installing reflector-updater...."
		sudo cp $reflectapp $reflectbin
		sudo chmod +x $reflectbin
	else
		echo "error: ~/reflector-updater/reflect File not found!"
	fi
}
#uninstalls the app, if app is not found, error command is shown
uninstall() {
	if [ -e "$reflectbin" ]; then
		echo "uninstalling reflector-updater...."
		sudo rm $reflectbin
	else
		echo "error: /usr/bin/reflect Not found!"
	fi
}
	
#uses case to make sure user inputs i or u, and will not accept any other commands
case "$answer" in

	i) 
		install 
		;;
	u)	uninstall
		;;
	*)
		echo "Invalid response"
		reading
		;;
esac
