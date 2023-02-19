#!/bin/bash

# Update system
sudo apt-get update
sudo apt-get upgrade

# Install Apache
sudo apt-get install apache2

# Install MySQL
sudo apt-get install mysql-server mysql-client

# Secure MySQL installation
sudo mysql_secure_installation

# Install PHP and necessary modules
sudo apt-get install php libapache2-mod-php php-mysql php-curl php-gd php-json php-mbstring php-xml php-zip

# Restart Apache
sudo systemctl restart apache2

# Set up firewall rules
sudo ufw allow 'Apache Full'

# Enable Apache and MySQL services to start on boot
sudo systemctl enable apache2
sudo systemctl enable mysql

# Print message indicating installation completed
echo "LAMP stack installation completed."
