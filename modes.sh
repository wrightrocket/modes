#!/bin/bash
# Must be run as root
# Show all modes of files and directories
# The mode is set with four octal values from 0 to 7
# Modes can also be expressed as a single letter
# represented by one of four mode letters: S U G O
# S is special
# U is user owner
# G is group owner
# O is others not the owner or group member

# Use four loops for Special, User, Group, and Other 
# Create files and directories

octal=$(seq 0 7)
printf "Creating Directories and Files with all possible modes\n"
for s in $octal 
do 
	printf "$s"
	for u in $octal
	do 
		printf "$u"
		for g in $octal
		do
			printf "$g"
			for o in $octal
			do
				perm="${s}${u}${g}${o}"
				printf "$o"
				touch file${perm}
				mkdir dir${perm}
				chmod $perm file${perm} dir${perm}
				printf "\b"
			done
			printf "\b"
		done
		printf "\b"
	done
	printf "\b"
done
