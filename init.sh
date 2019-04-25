#!/bin/bash

echo "Installing pip"
sudo apt-get install python3-pip
echo "Installing virtualenv and creating new venv"
sudo pip3 install virtualenv
virtualenv venv
echo "Cloning BHI"
cd venv/bin/
git clone https://github.com/jproids/BHI
echo "Installing python3.7 from source"
wget https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tar.xz
unxz Python-3.7.1.tar.xz
tar xvf Python-3.7.1.tar
cd Python-3.7.1/
./configure --prefix=/home/ubuntu/venv/bin/python3.7
make
sudo apt-get install zlib1g-dev
sudo apt-get install libffi-dev
