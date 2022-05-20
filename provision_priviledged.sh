#!/usr/bin/env bash   

# Export variables
export VAGRANT=/home/vagrant
export KANJI=$VAGRANT/kanji

# Update the box
apt-get update
apt-get upgrade -y

# Install packages
apt-get install -y curl build-essential

# Clean docker install
systemctl stop docker.socket
systemctl stop docker
systemctl disable docker
apt-get remove -y docker docker-engine docker.io containerd runc docker-compose-plugin
apt-get purge -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
rm -rf /var/lib/docker
rm -rf /var/lib/containerd

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker vagrant

# Enable and start docker
systemctl start docker
systemctl enable docker
docker version
docker compose version

# Clean kanji directory
rm -rf $KANJI