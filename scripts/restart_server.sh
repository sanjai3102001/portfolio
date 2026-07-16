#!/bin/bash

# Ensure parent directories are executable by all
chmod a+x /var /var/www

# Change ownership of the web root to the Apache user
chown -R apache:apache /var/www/html

# Restore the correct SELinux context for web content
restorecon -R /var/www/html

# Debugging: Create a file that lists the deployed file structure and permissions.
ls -laR /var/www/html > /var/www/html/file_structure.txt

# Restart the Apache web server to apply changes
systemctl restart httpd