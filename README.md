# Updater

Update script for any Debian-based Linux distribution. Checks for the latest updates, downloads them, and then reboots the system. 

## Instructions:
To run the script manually
    1. Place the script in: `~/updater.sh`
    2. Set read, write, and execute permissions for the owner only: `chmod 700 ~/updater.sh`
    3. Execute the script: `sudo ~/updater.sh`

To run the script automatically:
    1. Place the script in `/etc/cron.<daily|weekly|monthly>/updater.sh`
    2. Change the owner of the script to root
       `chown root:root `/etc/cron.<daily|weekly|monthly>/updater.sh`
    3. Set read, write and execute permissions for root
       `chmod 700 /etc/cron.<daily|weekly|monthly>/updater.sh`

apt-get Switches:
`-q` = quiet (Use this if you do not want to see the output when the script is run manually.)
`-y` = automatic yes to prompts
