#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

# Update and ensure we have apt-add-repository
apt-get update
apt-get install -y software-properties-common

apt-get update

# Install Core build utilities for Linux
apt-get install -y \
        build-essential \
        git \
        libpcre3-dev \
        pkg-config \
        zip

# Install Development utilities
apt-get install -y \
        curl \
        htop \
        jq \
        tree \
        unzip \
        vim

# Install Rkt tools
gpg --recv-key 18AD5014C99EF7E3BA5F6CE950BDD3E0FC8A365E
wget https://github.com/rkt/rkt/releases/download/v1.30.0/rkt_1.30.0-1_amd64.deb
wget https://github.com/rkt/rkt/releases/download/v1.30.0/rkt_1.30.0-1_amd64.deb.asc
gpg --verify rkt_1.30.0-1_amd64.deb.asc
sudo dpkg -i rkt_1.30.0-1_amd64.deb

# Ensure everything is up to date
apt-get upgrade -y

# Set hostname -> IP to make advertisement work as expected
ip=$(ip route get 1 | awk '{print $NF; exit}')
hostname=$(hostname)
sed -i -e "s/.*nomad.*/${ip} ${hostname}/" /etc/hosts

# Ensure we cd into the working directory on login
if ! grep "cd /opt/gopath/src/github.com/hashicorp/nomad-driver-rkt" /home/vagrant/.profile ; then
        echo 'cd /opt/gopath/src/github.com/hashicorp/nomad-driver-rkt' >> /home/vagrant/.profile
fi
