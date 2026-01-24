#!/bin/bash
# Start the server
systemctl start httpd
systemctl enable httpd
# Ensure permissions are correct
chown -R apache:apache /var/www/html