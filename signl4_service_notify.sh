#!/usr/bin/env bash

# Edit your SIGNL4 hook URL
SIGNL4_URL=https://connect.signl4.com/webhook/xxxxxxxx

# Service Notification command example :

# define command {
#	command_name	signl4-service
#	command_line	/usr/lib/nagios/plugins/signl4_service_notify "$NOTIFICATIONTYPE$" "$HOSTNAME$" "$HOSTADDRESS$" "$SERVICEDESC$" "$SERVICESTATE$" "$SERVICEOUTPUT$" "$LONGDATETIME$"
#}

IFS='%'

SIGNL4_MSG="{ \"Title\": \"Service $1 notification\", \"Host\": \"$2\", \"IP\": \"$3\", \"Service\": \"$4\", \"State\": \"$5\", \"Additional Info\":\"$6\", \"Nagios notification\": \"$7\", \"X-S4-Service\": \"Nagios\"  }"

#Send message to SIGNL4
curl -L -X POST -H "Content-type: application/json" --data "$SIGNL4_MSG" $SIGNL4_URL

unset IFS
