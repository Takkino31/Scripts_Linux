#!/bin/bash

# Ajout du référentiel et clés de Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list

# Ajout du référentiel de Stacer
sudo add-apt-repository -y ppa:oguzhaninan/stacer

# Ajout du référentiel de FLB Music
sudo add-apt-repository -y ppa:samoilov-lex/aftl-stable

# Ajout du référentiel de VLC
sudo add-apt-repository -y ppa:videolan/stable-daily

# Ajout du référentiel de Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update

# Mise à jour de la liste des paquets
sudo apt update

# Installation des logiciels
sudo apt install -y google-chrome-stable stacer flb-music vlc code

echo "Installation terminée."

