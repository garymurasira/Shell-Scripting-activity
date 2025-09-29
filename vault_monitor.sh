#!/bin/bash
location=~/secure_vault

echo "VAULT MONITORING REPORTS" > "$location/vault_report.txt"

for file in $location/*; do

	echo "Filename: $(basename "$file")" >> "$location/vault_report.txt"
	echo "Size: $(stat -c %s "$file")" >> "$location/vault_report.txt"
	echo "Last modified date: $(stat -c %y "$file")" >> "$location/vault_report.txt"
	echo "Current permissions: $(stat -c %a "$file")" >> "$location/vault_report.txt"
	if [[ $(stat -c %a "$file") -gt 644 ]]; then
		echo "⚠️  SECURITY RISK DETECTED" >> "$location/vault_report.txt"
	fi
	echo "" >> "$location/vault_report.txt"
	echo "" >> "$location/vault_report.txt"
done

echo "Report was created successfully"
