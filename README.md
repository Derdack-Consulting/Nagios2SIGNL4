# Nagios2SIGNL4

Nagios notifications for SIGNL, with JSON payload:

* Uses your team's incoming webhook integration in SIGNL4.</br>
( https://account.signl4.com/manage/Apps/Webhook )

* Copy the two scripts to your plugin directory. (location may vary)

* Edit the SIGNL4 URLs to reflect the webhook of your SIGNL4 team.

* Define the new notification commands in Nagios.
(example in signl4_commands.cfg, modify paths as required)

* Set up a new contact to use the new host and service notification commands.
