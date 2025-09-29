#!/bin/bash
	#CREATING DIRECTORY AND ENTERING IT
mkdir -p ~/secure_vault
cd ~/secure_vault

	#CREATING FILES AND ADDING WELCOME MESSAGES ON EACH FILE
echo "Welcome, This is the file that stores encryption keys" > keys.txt
echo "Welcome, This is the file that stores confidential data" > secrets.txt
echo "Welcome, This is the file that stores system logs" > logs.txt

	#PRINTING SUCCESS MESSAGE AND LISTIN ALL FILES IN LONG FORMAT
echo "Creating directory SECURE_VAULT and adding the tree files was successful"
ls -l
