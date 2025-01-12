#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Update and upgrade system packages
apt update && apt upgrade -y

# Navigate to the /tmp directory
cd /tmp

# Download the ASL apt repository package
wget https://repo.allstarlink.org/public/asl-apt-repos.deb12_all.deb

# Install the downloaded ASL apt repository package
dpkg -i asl-apt-repos.deb12_all.deb

# Update package lists to include the ASL repository
apt update

# Install ASL3
apt install -y asl3

# Download the DVSwtich installer script
wget http://dvswitch.org/bookworm

# Make the DVSwtich installer executable
chmod +x bookworm

# Run the DVSwtich installer
./bookworm

# Update package lists again
apt update

# Install the DVSwtich server
apt install -y dvswitch-server

# Print completion message
echo "Installation complete!"
