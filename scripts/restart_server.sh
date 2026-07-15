#!/bin/bash

# Change ownership of the web root to the Apache user
chown -R apache:apache /var/www/html

# Restore the correct SELinux context for web content
restorecon -R /var/www/html

# Restart the Apache web server to apply changes
systemctl restart httpd