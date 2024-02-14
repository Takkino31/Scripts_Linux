#!/bin/bash

# Fonction pour configurer les variables d'environnement pour Java
configure_java_environment() {
    echo "Configuring Java environment variables..."
    sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-oracle/bin/java 1
    sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-17-oracle/bin/javac 1
    sudo update-alternatives --set java /usr/lib/jvm/java-17-oracle/bin/java
    sudo update-alternatives --set javac /usr/lib/jvm/java-17-oracle/bin/javac
    echo "Java environment variables configured."
}

# Fonction pour installer IntelliJ IDEA
install_intellij() {
    echo "Installing IntelliJ IDEA..."
    sudo snap install intellij-idea-community --classic
    echo "IntelliJ IDEA installed."
}

# Ajout du référentiel de Java JDK
sudo add-apt-repository -y ppa:linuxuprising/java

# Mise à jour de la liste des paquets
sudo apt update

# Installation de Java JDK
sudo apt install -y oracle-java17-installer

# Installation de IntelliJ IDEA
install_intellij

# Configuration des variables d'environnement pour Java
configure_java_environment

echo "Installation terminée."

