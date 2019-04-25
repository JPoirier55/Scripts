#!/bin/bash
echo "Adding python3.7 repo"
sudo add-apt-repository ppa:jonathonf/python-3.7
echo "Updating apt-get"
sudo apt-get update
echo "Installing python3.7 and libpython3.7"
sudo apt-get install python3.7
sudo apt-get install libpython3.7

echo "Updating python to use python3.7"
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

