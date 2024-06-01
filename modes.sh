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
for s in $octal 
do 
	echo Setting s=$s SPECIAL permissions
	for u in $octal
	do 
		echo Setting u=$u USER permissions	
		for g in $octal
		do
			echo Setting g=$g GROUP permissions	
			for o in $octal
			do
				echo Setting o=$o OTHER permissions	
				perm="${s}${u}${g}${o}"
				touch file${perm}
				mkdir dir${perm}
				chmod $perm file${perm} dir${perm}
			done
		done
	done
done
