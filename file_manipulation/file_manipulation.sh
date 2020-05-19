#!/bin/bash

########################################################################
# Script Name	:   File manipulation
# Description	:   File to read an input from txt and output as CSV.
# Author       	:   Easwer AP
########################################################################

logfile=/Drive1/playground/shell/shell.log
input=/Drive1/playground/shell/input.txt
output=/Drive1/playground/shell/output.csv
inputTmp=/Drive1/playground/shell/input.txt.bak
outputTmp=/Drive1/playground/shell/output.csv.bak
echo $(date)": Starting Script..." >> $logfile
if [[ -r $input ]]; then
	echo $(date)": File $input exists..." >> $logfile
	echo $(date)": Reading file $input..." >> $logfile
	echo $(date)": Creating backup file..." >> $logfile
	# Taking backup for input file
	cp $input $inputTmp
	# Removing header (first line) and footer (last line) from input file.
	sed -i '1d;$d' $inputTmp
	# Checks output file already exists.
	if [[ -e $output ]]; then
		echo $(date)": File $output exists..." >> $logfile
		# Taking backup for output file
		cp $output $outputTmp
		# Removing existing output file.
		rm -rf $output
		echo $(date)": Deleting file $output..." >> $logfile
		# Creating new empty output file.
		touch $output
	fi
	echo $(date)": Creating file $output..." >> $logfile
	echo $(date)": Processing data..." >> $logfile
	echo "organizationid, username, firstname, lastname, mobilephone" >> $output
	# Reading line by line from input file.
	while IFS= read -r line
	do
		# Spliting contents of line based on delimiter "|"
		IFS='|' read -ra contents <<<"$line"
		echo "350,${contents[1]},${contents[5]},${contents[7]},${contents[38]}" >> $output
	done < "$inputTmp"
else
	echo $(date)": File $input does not exists..." >> $logfile
fi

echo $(date)": Ending Script..." >> $logfile
