#!/bin/bash
# Start the server
systemctl restart httpd
systemctl enable httpd
# Ensure permissions are correct for my location
chown -R apache:apache /var/www/html
chmod -R 755 /var/www/html

# Debugging: Create proof files to verify deployment
echo "Deployment succeeded at $(date)" > /var/www/html/deploy_status.html
ls -R /var/www/html > /var/www/html/file_structure.txt