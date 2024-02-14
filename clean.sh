#!/bin/bash
# Supprime les anciennes révisions des snaps
# FERMER TOUS LES SNAPS AVANT D'EXÉCUTER CE SCRIPT

# Nettoyer les fichiers temporaires
sudo apt clean

# Supprimer les paquets inutiles
sudo apt autoremove --purge


sudo apt-get autoclean


#Il existe plusieurs façons de nettoyer les journaux de Systemd. Le plus simple est d'effacer les journaux qui datent de plus de quelques jours.
sudo journalctl --vacuum-time=3d

#5. Supprimer les anciennes versions des applications Snap [Connaissances intermédiaires]
#Vous savez probablement déjà que les paquets Snap sont plus volumineux. De plus, Snap stocke au moins deux anciennes versions de l'application (au cas où vous voudriez revenir à l'ancienne version). Cela consomme une grande partie de l'espace. Dans mon cas, il s'agissait de plus de 5 Go.


rm -rf ~/.cache/thumbnails/*


set -eu
snap list --all | awk '/désactivé/{print $1, $3}' |
    while read nom_snap revision; do
    	echo 'Hello, World!'  $revision
        snap remove "$nom_snap" --revision="$revision"
    done

