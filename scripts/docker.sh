#!/bin/bash
# Script to install Podman on an EC2 instance and configure permissions

# Update the package list
sudo apt-get update -y

# Install Podman
sudo apt-get install podman -y

# Add the 'ubuntu' and 'jenkins' users to the 'podman' group 
# (only needed on systems that use a podman group)
sudo groupadd -f podman
sudo usermod -aG podman ubuntu
sudo usermod -aG podman jenkins

# Apply new group settings (effective only for new shells)
newgrp podman

# Enable and start Podman socket (acts like Docker socket)
sudo systemctl enable --now podman.socket

# Verify installation
podman --version

# OPTIONAL: Run SonarQube container equivalent
# Podman uses same command syntax as Docker
# podman run -d --name sonar -p 9000:9000 docker.io/library/sonarqube:lts-community
