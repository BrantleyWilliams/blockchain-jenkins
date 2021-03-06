#!/bin/bash

update_system()
{
    apt-get update
}

install_dev_tools()
{
    apt-get install -y default-jdk
    apt-get install -y git
    
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
    apt-get update
    apt-get install -y jenkins

    apt-get install -y python-software-properties
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

    apt-get install -y nodejs
    apt-get install -y npm
}

install_ethereum_tools()
{
    npm install -g ethereumjs-testrpc
    npm install -g solc
    npm install -g truffle
    npm install -g mocha
    npm install -g mocha-junit-reporter
}

echo "Installing Tooling ..."
update_system
install_dev_tools
install_ethereum_tools
echo "Installation Complete."

echo "Starting Jenkins"
systemctl start jenkins