#!/usr/bin/env bash
set -e

if [ ! -e ~/projects ]; then
    mkdir ~/projects
fi

echo ""
echo "Running apt-get update"

sudo apt-get update

echo ""
echo "Checking git"

if ( hash git 2>/dev/null ); then
    echo " - Already installed git"
else
    echo " - Fetching git"
    sudo apt-get install git
fi

echo ""
echo "Checking xclip"

if ( hash xclip 2>/dev/null ); then
    echo " - Already installed xclip"
else
    echo " - Fetching xclip"
    sudo apt-get install xclip
fi

echo ""
echo "Checking ssh keys"

if [ ! -e ~/.ssh ]; then
    mkdir ~/.ssh
fi

if [ ! -e ~/.ssh/id_rsa ]; then
    cd ~/.ssh
    read -p "Please enter email: " email

    ssh-keygen -t rsa -C "$email"
    ssh-add ~/.ssh/id_rsa
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo ""
    echo "Copied public key to clipboard. Please add to github"
    read -p "Press [Enter] key to continue"
else
    echo " - Already configured ssh keys"
fi


echo ""
echo "Checking dotfiles"

if [ ! -e ~/projects/dotfiles ]; then
    echo " - Fetching raynos/dotfiles"
    cd ~/projects
    git clone git@github.com:Raynos/dotfiles
else
    echo " - Already installed raynos/dotfiles"
fi

echo ""
echo "Sourcing dotfiles"

cd ~/projects/dotfiles
git submodule init
git submodule update
echo y | source ~/projects/dotfiles/bootstrap.sh

echo ""
echo "All finished"
