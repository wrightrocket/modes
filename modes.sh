#!/bin/bash
# Must be run as root
# Show all modes of files and directories
# The mode is set with four OCTAL values from 0 to 7
# Modes can also be expressed as a single letter
# represented by one of four mode letters: S U G O
# S is special
# U is user owner
# G is group owner
# O is others not the owner or group member

# Use four for loops for Special, User, Group, and Other variables: S, U, G, and O.
# to create files and directories of every mode

OCTAL=$(seq 0 7)
printf "Creating Directories and Files with all possible modes\n"
for S in $OCTAL # 0 is none, 1 is sticky bit, 2 is setgid, and 4 is setuid 
do # Special permissions are different from those for user(owner), group and other.
	printf "$S" # Display the value of the S variable
	for U in $OCTAL # 0 is none, 1 is execute, 2 is write, and 4 is read
	do # User permissions apply to the creator or owner of the file
		printf "$U"
		for G in $OCTAL # Group permissions apply to non-owners who are group members.
		do
			printf "$G"
			for O in $OCTAL # Other permissions apply to the world or everyone else.
			do 
				printf "$O"
				PERM="${S}${U}${G}${O}" #{} keep variable names separated not values.
				touch file${PERM} # create a file named file followed by the value of PERM.
				mkdir dir${PERM} # create a directory named dir suffixed with the value of PERM.
				chmod $PERM file${PERM} dir${PERM} # set the permissions or mode of both.
				printf "\b" # print a backspace to erase the last value of O
			done
			printf "\b" # print a backspace to erase the last value of G
		done
		printf "\b" # print a backspace to erase the last value of U
	done
	printf "\b" # print a backspace to erase the last value of S
done
