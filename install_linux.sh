#!/usr/bin/env bash

# Generate ED25519 ssh key
echo "Generating ED25519 ssh key"
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''

# Install xclip to copy the ssh key to clipboard
echo "Installing xclip to copy the ssh key to clipboard"
sudo apt-get install -y xclip
xclip -sel clip < ~/.ssh/id_ed25519.pub

# Download and install the latest version of VirtualBox
echo "Installing VirtualBox"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo apt-get update
sudo apt-get install -y virtualbox-6.1
echo virtualbox-ext-pack virtualbox-ext-pack/license select true | sudo debconf-set-selections
sudo apt-get install -y virtualbox-ext-pack

# Download and install Vagrant
echo "Installing Vagrant"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install vagrant

# Download and install VsCode
echo "Installing VsCode"
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
