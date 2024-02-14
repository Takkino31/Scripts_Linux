#!/bin/bash

# Mise à jour de la liste des paquets
sudo apt update

# Installation de PHP et ses dépendances
sudo apt install -y php php-mysql php-curl php-json php-xml php-mbstring php-zip


# Installation de Composer
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    sudo rm composer-setup.php
    exit 1
fi

sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo rm composer-setup.php

# Installation de Symfony
wget https://get.symfony.com/cli/installer -O - | bash
sudo mv /home/$USER/.symfony/bin/symfony /usr/local/bin/symfony

# Installation de XAMPP
wget -qO- https://www.apachefriends.org/xampp-files/8.1.1/xampp-linux-x64-8.1.1-0-installer.run > xampp-installer.run
chmod +x xampp-installer.run
sudo ./xampp-installer.run

echo "Installation terminée."

