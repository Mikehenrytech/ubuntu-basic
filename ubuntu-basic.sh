#!/bin/bash

if [[ "$EUID" != 0 ]];
  then 
	echo "Please run as root"
	exit 1	
fi

# full upgrade
sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

# basic
sudo apt-get -y install git build-essential software-properties-common zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev python-pip python3-pip python3-dev python-dev python3-venv default-jdk 

sudo apt-get -y install openjdk-8-jdk openjdk-11-jdk openjdk-15-jdk

# Install ZAP
echo 'deb http://download.opensuse.org/repositories/home:/cabelo/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:cabelo.list
curl -fsSL https://download.opensuse.org/repositories/home:cabelo/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cabelo.gpg > /dev/null
sudo apt update
sudo apt install -y owasp-zap

# Install wireshark
sudo apt-get install -y wireshark

exit 0

