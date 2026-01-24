#!/bin/bash
# Start the server
systemctl restart httpd
systemctl enable httpd
# Ensure permissions are correct for my location
chown -R apache:apache /var/www/html