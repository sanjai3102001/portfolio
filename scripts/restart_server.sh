#!/bin/bash

# Enable verbose logging for debugging in CodeDeploy
set -x
# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting ApplicationStart hook ---"

# Ensure parent directories are executable by all
chmod a+x /var /var/www

# Change ownership of the web root to the Apache user
echo "Changing ownership of /var/www/html to apache:apache"
chown -R apache:apache /var/www/html
 
# Restore the default SELinux security context for web content.
# This is a crucial step to allow the Apache process to read the files.
echo "Restoring SELinux context for /var/www/html"
chcon -R -t httpd_sys_content_t /var/www/html

# --- Start Debugging ---
echo "--- Creating debug log at /tmp/deployment_debug.log ---" > /tmp/deployment_debug.log
echo "--- File permissions and SELinux context for /var/www/html ---" >> /tmp/deployment_debug.log
ls -laZ /var/www/html >> /tmp/deployment_debug.log 2>&1
echo "--- SELinux audit log for httpd denials ---" >> /tmp/deployment_debug.log
cat /var/log/audit/audit.log | grep httpd | grep denied >> /tmp/deployment_debug.log 2>&1 || echo "No SELinux denials found for httpd." >> /tmp/deployment_debug.log

# Restart the Apache web server to apply changes
echo "Restarting httpd service"
systemctl restart httpd

echo "--- ApplicationStart hook finished ---"