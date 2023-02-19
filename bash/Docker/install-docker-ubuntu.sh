#!/bin/bash

# Update system
sudo apt-get update
sudo apt-get upgrade

# Install necessary packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to apt sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update apt package index
sudo apt-get update

# Install latest version of Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add current user to the docker group to run Docker commands without sudo
sudo usermod -aG docker $USER

# Print message indicating installation completed
echo "Docker installation completed. Please log out and back in for changes to take effect."
