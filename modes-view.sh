#!/bin/bash
# View the contents of the archive without extracting it

tar -tvf modes-dirs-files.tar.gz | cut -d " " -f1,14
# Use cut to extract the first column of text, and that after 14 spaces

tar -tvf modes-dirs-files.tar.gz | wc -l
# Display the total number of files and directories created 

# Extract the contents of the archive in current directory
# tar -xvf modes-dirs-files.tar.gz
# Uncomment line above to extract all the files and directories
 
