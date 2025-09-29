#!/bin/bash
set -e

location=~/secure_vault

if [[ -d "$location" ]]; then
	echo "Directory Exists!!"
	echo ""
else 
	echo "Directory 'secure_vault' not found"
	exit 1
fi

permission_updater() {

echo "Current Files Permissions Status"
ls -l "$location"
echo " "

read -p "Do you want to update permissions of the files(yes or no):" choice
echo " "

	if [[ "$choice" == "yes" ]]; then
		echo "N.B: if you press Enter without input, default permissions will be set instead!!"
		read -p "Enter new permission for keys.txt:" perm1
			chmod "${perm1:-600}" "$location/keys.txt"
			echo "keys.txt file permission updated to ${perm1:-600}"
			echo ""

		read -p "Enter new permission for secrets.txt:" perm2
			chmod "${perm2:-640}" "$location/secrets.txt"
			echo "secrets.txt file permission updated to ${perm2:-640}"
			echo""

		read -p "Enter new permission for logs.txt:" perm3 
			chmod "${perm3:-644}" "$location/logs.txt"
			echo "logs.txt file permission updated to ${perm3:-644}"

		echo " "
		echo "Updated File Permission Status"
		ls -l "$location"

	elif [[ "$choice" == "no" ]]; then
		echo "No permission updated"

	else
    		echo "Invalid response. Please enter 'yes' or 'no'."
    		exit 1
	fi

}

permission_updater
