# modes.sh
A bash script to generate files and directories using all modes of permissions.

# modes-cleanup.sh
A bash script to remove file* and dir* from a directory created by modes.sh.

# modes-dirs-files.tar.gz
An archive file created by the tar command of all files and directories modes.sh creates. 

# modes-view.sh
A bash script to view the compressed archive file of the files and directories.

## Notes
* Both scripts should be run with root privileges
* If run as non-root user, then some files or directories will not be created
* Error output from touch and mkdir commands is discarded with 2> /dev/null
