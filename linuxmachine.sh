#!/usr/bin/env bash

# Update & upgrade package
sudo apt update -y && sudo apt upgrade -y

# Install packages
sudo apt install neovim git -y

# Configure git
git config --global user.email "zhenchai0000@gmail.com"
git config --global user.name "zhenchai"
git config --global core.editor "vim"

######################################

which docker
if [ $? -eq 0 ]; then
    echo "Docker already installed"
else
    echo "Installing Docker ......."
    # Uninstall old versions docker
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
        sudo apt-get remove $pkg -y;
    done
    # Add Docker's official GPG key:
    sudo apt-get update -y
    sudo apt-get install ca-certificates curl gnupg -y
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y

    # Install Docker
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
fi

