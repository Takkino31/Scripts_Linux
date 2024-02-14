#!/bin/bash

# Mise à jour des paquets
echo "Mise à jour des paquets..."
sudo apt update && sudo apt upgrade -y

# Correction des paquets cassés
echo "Correction des paquets cassés..."
sudo apt --fix-broken install -y

# Vérification des problèmes de noyau
echo "Vérification des problèmes de noyau..."
dpkg --list | grep linux-image

# Installation du dernier noyau disponible
echo "Installation du dernier noyau disponible..."
sudo apt install linux-image-generic linux-headers-generic -y
