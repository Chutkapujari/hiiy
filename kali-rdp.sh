#!/bin/bash
# Kali Linux CRP Setup Script
# by ChatGPT for Aman bhai 😎

# Username & Password
username="kali"
password="toor"

# Pin for CRP
Pin="123456"

echo "Creating User: $username ..."
sudo useradd -m -s /bin/bash "$username"
echo "$username:$password" | sudo chpasswd
sudo usermod -aG sudo "$username"

echo "Updating system..."
sudo apt-get update -y

echo "Installing Desktop Environment (XFCE4)..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 xfce4-terminal desktop-base tightvncserver

echo "Installing Chrome Remote Desktop..."
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get install -y ./chrome-remote-desktop_current_amd64.deb --fix-broken

echo "Adding user to CRP group..."
sudo usermod -a -G chrome-remote-desktop "$username"

echo "Setup complete ✅"
echo "-----------------------------------------"
echo "Now go to 👉 https://remotedesktop.google.com/headless"
echo "Login with your Google account, copy the Debian setup command, paste & run it here."
echo "PIN you chose: $Pin"
echo "-----------------------------------------"
