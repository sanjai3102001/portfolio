#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting ApplicationStart hook ---"

# Ensure parent directories are executable by all
chmod a+x /var /var/www

# Change ownership of the web root to the Apache user
echo "Changing ownership of /var/www/html to apache:apache"
chown -R apache:apache /var/www/html

# Restart the Apache web server to apply changes
echo "Restarting httpd service"
systemctl restart httpd

echo "--- ApplicationStart hook finished ---"