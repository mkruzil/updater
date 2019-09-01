# Updater

Update script for any Debian-based Linux distribution. Checks for the latest updates and downloads and installs them. 

## Instructions:
To run the script manually:<br>
    1. Place the script in: `~/updater.sh`<br>
    2. Set read, write, and execute permissions for the owner only: `chmod 700 ~/updater.sh`<br>
    3. Execute the script: `sudo ~/updater.sh`

To run the script automatically:<br>
    1. Place the script in `/etc/cron.<daily|weekly|monthly>/updater.sh`<br>
    2. Change the owner of the script to root<br>
       `chown root:root /etc/cron.<daily|weekly|monthly>/updater.sh`<br>
    3. Set read, write and execute permissions for root<br>
       `chmod 700 /etc/cron.<daily|weekly|monthly>/updater.sh`

apt-get Switches:<br>
`-q` = quiet (Use this if you do not want to see the output when the script is run manually.)<br>
`-y` = automatic yes to prompts
