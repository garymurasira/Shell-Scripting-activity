#!/bin/bash
set -e

location=~/secure_vault

while true; do

echo "1.Add Secret"
echo "2.Update Secret"
echo "3.Add Log Entry"
echo "4.Access Keys"
echo "5.Exit"
echo ""
read -p "Select an option[1-5]:" option

	case $option in
		1)
			read -p "Enter the secret you want to add:" new_secret 
			echo "$new_secret" >> "$location/secrets.txt"
			echo "Secret Added"
			echo ""
			;;
		2)
			read -p "Enter the old secret:" old_secret
			read -p "Enter the new secret to replace with:" new_secret

			if grep -q "$old_secret" "$location/secrets.txt"; then
				sed -i "s/$old_secret/$new_secret/g" "$location/secrets.txt"
				echo "Secret was updated successfully"
				echo ""
			else
				echo "No match found"
				echo ""
			fi
			;;
		3)
			read -p "Log Entry message:" entry_log
			echo "$(date):$entry_log" >> "$location/logs.txt"
			echo "The Entry log was added"
			echo ""
			;;
		4)
			echo "ACCESS DENIED 🚫"
			echo ""
			;;
		5)
			echo "Exiting"
			echo ""
			break 
			;;
		*)
			echo "Enter a valid option [1-5]"
			;;
	esac
done
