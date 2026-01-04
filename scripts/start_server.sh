#!/bin/bash
# Start the server
systemctl start httpd
systemctl enable httpd
# Ensure permissions are correct
chown -R ec2-user:ec2-user /home/ec2-user/my-app