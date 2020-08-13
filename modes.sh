#!/bin/bash
# Show all modes of files and directories
# mode is octal values from 0 to 7
# A mode is composed of four values SUGO
# S is special
# U is user owner
# G is group owner
# O is others not the owner or group member

# Not demoing special now

# Loop through three times for Other, Group, and User
# count the files
octal=$(seq 0 7)
for u in $octal 
do
	echo Setting u=$u permissions	
	for g in $octal
	do
		echo Setting g=$g permissions	

		for o in $octal
		do
			echo Setting o=$o permissions	

			perm="${u}${g}${o}"
			touch file${perm}
			mkdir dir${perm}
			chmod $perm file${perm} dir${perm}
		done
	done
done
