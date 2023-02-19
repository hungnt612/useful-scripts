#!/bin/bash

# Update system
sudo apt-get update
sudo apt-get upgrade

# Install Nginx
sudo apt-get install nginx

# Install MySQL
sudo apt-get install mysql-server mysql-client

# Secure MySQL installation
sudo mysql_secure_installation

# Install PHP and necessary modules
sudo apt-get install php-fpm php-mysql php-mbstring

# Configure PHP
sudo sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php/7.4/fpm/php.ini

# Restart PHP-FPM
sudo systemctl restart php7.4-fpm

# Set up firewall rules
sudo ufw allow 'Nginx Full'

# Enable Nginx and PHP-FPM services to start on boot
sudo systemctl enable nginx
sudo systemctl enable php7.4-fpm

# Print message indicating installation completed
echo "LEMP stack installation completed."
