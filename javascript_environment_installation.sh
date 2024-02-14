#!/bin/bash

# Fonction pour installer Node.js via NVM
install_nvm_node() {
    echo "Installing NVM and Node.js..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.bashrc
    nvm install --lts
    nvm alias default lts/*
    echo "NVM and Node.js installed."
}

# Fonction pour installer Angular CLI
install_angular_cli() {
    echo "Installing Angular CLI..."
    npm install -g @angular/cli
    echo "Angular CLI installed."
}

# Fonction pour installer MongoDB
install_mongodb() {
    echo "Installing MongoDB..."
    wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    sudo systemctl start mongod
    sudo systemctl enable mongod
    echo "MongoDB installed."
}

# Fonction pour installer MongoDB Compass (dernière version)
install_mongodb_compass() {
    echo "Installing MongoDB Compass..."
    wget -qO- https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    sudo apt-get update
    sudo apt-get install -y mongodb-compass
    echo "MongoDB Compass installed."
}

# Ajout du référentiel de WebStorm
echo "deb [arch=amd64] https://packages.jetbrains.com/deb/webstorm stable main" | sudo tee /etc/apt/sources.list.d/webstorm.list
sudo apt-get update
sudo apt-get install -y webstorm

# Installation de Node.js via NVM
install_nvm_node

# Installation d'Angular CLI
install_angular_cli

# Installation de MongoDB
install_mongodb

# Installation de MongoDB Compass (dernière version)
install_mongodb_compass

echo "Installation terminée."

