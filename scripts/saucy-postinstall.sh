#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

add-apt-repository -y ppa:webupd8team/java
add-apt-repository -y ppa:numix/ppa
add-apt-repository -y ppa:git-core/ppa
add-apt-repository -y ppa:pidgin-developers/ppa
add-apt-repository -y ppa:docky-core/ppa
add-apt-repository -y ppa:richardgv/compton

#refresh and do update/upgrades
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade

#install packages I use
apt-get -y install htop pidgin vim remmina filezilla golang-go \
bleachbit build-essential oracle-java7-installer \
numix-gtk-theme numix-icon-theme fonts-droid \
network-manager-openconnect-gnome expect zsh git-core \
mutt docky compton

#pyenv
sudo apt-get -y install make libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev
