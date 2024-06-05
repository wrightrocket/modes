# modes.sh
A bash script to generate files and directories using all modes of permissions.

# modes-cleanup.sh
A bash script to remove the file* and dir* files from a directory created by modes.sh.

# modes-dirs-files.tar.gz
An archive file created by the tar command of all files and directories modes.sh creates. 

# modes-view.sh
A bash script to view the compressed archive files showing the symbolic permissions.

## Notes
* modes.sh and modes-cleanup scripts should be run with root privileges
* If run as non-root user, then some files or directories will not be created
* Error output from touch and mkdir commands is discarded with 2> /dev/null
* 4096 files and 4096 directores should be created if run as the root user
