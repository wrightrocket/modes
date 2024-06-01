#!/bin/bash
# Must be run as root
# Show all modes of files and directories
#
# The mode is set with eight OCTAL values from 0 to 7
# Modes can also be expressed as a single letter
# represented by one of four mode letters: S U G O to control access permissions
# 
# S is Special for executing as a user, group, or setting the sticky bit
# U is User owner who either created the file or was given ownership by a root user
# G is Group owner who belongs to a group that was assigned by a root user
# O is Others not the owner or group member who could be anyone who access to the directory

# This program uses four for loops to cycle through the eight values of each S, U, G, and O 
# variable to create files and directories of every mode
printf "Creating Directories and Files with all possible modes\n" 
# Use printf to display output of text, variable values, and special characters to the user

OCTAL=$(seq 0 7) 
# OCTAL holds the 8 values: 0 1 2 3 4 5 6 7

for S in $OCTAL 
# Special S value of 0 is none, 1 is sticky bit, 2 is setgid, and 4 is setuid or combined
do 
	# Special permissions are different from those for user(owner), group and other.
	printf "$S" # Display the value of the S variable
	
	for U in $OCTAL 
	# For U, G and O, the value 0 is none, 1 is execute, 2 is write, and 4 is read
	do 
		# User U permissions apply to the creator or owner of the file
		printf "$U"
		
		for G in $OCTAL 
		# Group G permissions apply to non-owners who are group members
		do
			printf "$G"
			
			for O in $OCTAL 
			# Other O permissions apply to the world or everyone else
			do 
				printf "$O"
				PERM="${S}${U}${G}${O}" 
				# Use PERM to hold the combined four octal values
				
				touch file${PERM} 
				# create a file named file followed by the value of PERM
				
				mkdir dir${PERM} 
				# create a directory named dir suffixed with the value of PERM
				
				chmod $PERM file${PERM} dir${PERM} 
				# set the permissions on both the file and directory just created
				
				printf "\b" 
				# print a backspace to erase the last value of the O variable
			done
			printf "\b" # print a backspace to erase the last value of the G variable
		done
		printf "\b" # print a backspace to erase the last value of the U variable
	done
	printf "\b" # print a backspace to erase the last value of the S variable
done
