#!/bin/bash
# Clean up the web root by removing its contents, but not the directory itself.
# This is safer than `rm -rf /var/www/html`.
if [ -d "/var/www/html" ]; then
  rm -rf /var/www/html/*
fi