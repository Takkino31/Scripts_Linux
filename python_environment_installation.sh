#!/bin/bash

# Fonction pour installer les bibliothèques Python utiles
install_python_libs() {
    echo "Installing essential Python libraries..."
    sudo apt install -y python3-pip python3-venv python3-dev build-essential
    pip3 install --upgrade pip setuptools wheel
    echo "Essential Python libraries installed."
}

# Fonction pour installer Spyder
install_spyder() {
    echo "Installing Spyder..."
    sudo apt-add-repository -y ppa:linuxgndu/sqlitebrowser
    sudo apt-get update
    sudo apt-get install -y spyder
    echo "Spyder installed."
}

# Installation des bibliothèques Python utiles
install_python_libs

# Installation de Spyder
install_spyder

echo "Installation terminée."

