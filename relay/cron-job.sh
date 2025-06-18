#!/bin/bash

# Write out current crontab
crontab -l > mycron

# Echo new cron into cron file (runs every 15 minutes)
echo "*/15 * * * * /path/to/update_docker_compose.sh" >> mycron

# Install new cron file
crontab mycron
rm mycron

