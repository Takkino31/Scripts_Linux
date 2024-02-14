#!/bin/bash

# Vérification des problèmes de noyau
echo "Vérification des problèmes de noyau..."
dpkg --list | grep linux-image

# Installation du dernier noyau disponible
echo "Installation du dernier noyau disponible..."
sudo apt install linux-image-generic linux-headers-generic -y

# Redémarrage du système
echo "Redémarrage du système necessaire pour appliquer les changements..."
echo "sudo reboot"

