#!/usr/bin/env bash

# Edit your SIGNL4 hook URL
SIGNL4_URL=https://connect.signl4.com/webhook/xxxxxxxx

# Host Notification command example :

# define command {
#	command_name	signl4-host
#	command_line	/usr/lib/nagios/plugins/signl4_host_notify "$NOTIFICATIONTYPE$" "$HOSTNAME$" "$HOSTADDRESS$" "$HOSTSTATE$" "$HOSTOUTPUT$" "$LONGDATETIME$"
#}

IFS='%'

SIGNL4_MSG="{ \"Title\": \"Host $1 notification\", \"Host\": \"$2\", \"IP\": \"$3\", \"State\": \"$4\", \"Additional Info\":\"$5\", \"Nagios notification\": \"$6\", \"X-S4-Service\": \"Nagios\" }"

#Send message to SIGNL4
curl -L -X POST -H "Content-type: application/json" --data "$SIGNL4_MSG" $SIGNL4_URL

unset IFS