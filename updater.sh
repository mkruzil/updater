#!/bin/bash

#============================================================================================
#Filename        updater.sh
#Description.....Update script for any Debian-based Linux distribution. 
#                Checks for the latest updates, downloads them, and then reboots the system. 
#Author          Michael Kruzil (mkruzil@mikruweb.com)
#Date Created....9/1/19 10:00 AM
#
#Instructions:
#To run the script manually
#    1. Place the script in: ~/updater.sh
#    2. Set read, write, and execute permissions for the owner only: chmod 700 ~/updater.sh
#    3. Execute the script: sudo ~/updater.sh
#
#To run the script automatically:
#    1. Place the script in /etc/cron.<daily|weekly|monthly>/updater.sh
#    2. Change the owner of the script to root
#       chown root:root /etc/cron.<daily|weekly|monthly>/updater.sh
#    3. Set read, write and execute permissions for root
#       chmod 700 /etc/cron.<daily|weekly|monthly>/updater.sh

#apt-get Switches:
#-q = quiet (Use this if you do not want to see the output when the script is run manually.)
#-y = automatic yes to prompts
#============================================================================================

# Initialize variables
TIMEZONE=America/Indianapolis
DIR=`dirname $BASH_SOURCE` # The directory this script is running from
SCRIPT=$DIR/updater.sh
LOG=$DIR/updater.log 
OWNER=`stat -c %U $SCRIPT` # The owner of this script

# Insert a blank line after the command prompt
echo

# Display the current date in the current timezone
echo [Date] | tee $LOG
TZ=$TIMEZONE date | tee -a $LOG
echo | tee -a $LOG

# Display the log location
echo [Log File] | tee -a $LOG
echo $LOG | tee -a $LOG
echo | tee -a $LOG

# Updates the package cache and checks for broken dependencies
echo [Checking] | tee -a $LOG
apt-get -y check | tee -a $LOG
echo | tee -a $LOG

# Resynchronizes package index files from their sources (/etc/apt/sources.list) so that information about new and updated packages is available. An update should always be performed 
echo [Updating] | tee -a $LOG
apt-get -y update | tee -a $LOG
echo | tee -a $LOG

# Installs the newest versions of all packages currently installed on the system from the sourcesin /etc/apt/sources.list. Also intelligently dependencies with new versions of packages. It will attempt to upgrade the most important packages at the expense of less important ones if necessary. The dist-upgrade command may therefore remove some packages. 
echo [Upgrading] | tee -a $LOG
apt-get -y dist-upgrade | tee -a $LOG
echo | tee -a $LOG

# Removes packages that were automatically installed to satisfy dependencies for other packages and are now no longer needed.
echo [Autoremoving] | tee -a $LOG
apt-get -y autoremove | tee -a $LOG
echo | tee -a $LOG

# Clears out the local repository of retrieved package files but only removes package files that can no longer be downloaded, and are largely useless. This allows a cache to be maintained over a long period without it growing out of control.
echo [Autocleaning] | tee -a $LOG
apt-get -y autoclean | tee -a $LOG
echo | tee -a $LOG

# Since this script is being run under root, the owner of the log file will be root. To fix this, change the owner of the log file to the owner of this script
chown $OWNER:$OWNER $LOG

#Notify the user of completion
echo Finished! | tee -a $LOG

#Reboot the system.
#echo Rebooting...
#reboot

#Cause the shell to exit. If status number is omitted, the exit status is that of the last command executed. See: https://linux.die.net/man/1/bash
exit

