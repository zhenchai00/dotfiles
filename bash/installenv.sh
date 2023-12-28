#!/usr/bin/env bash

# Get the home directory of the current user
USER_HOME=$(eval echo ~$USER)

# Update & upgrade package
echo "Installation start ......."
echo "Update & upgrade package ......."
sudo apt update -y && sudo apt upgrade -y

# Install packages
echo "Installing neovim, git ......."
sudo apt install neovim git -y

# Configure git
# git config --global user.email "zhenchai0000@gmail.com"
# git config --global user.name "zhenchai"
# git config --global core.editor "vim"
# Check if .gitconfig exists
if [ -f "$USER_HOME/.gitconfig" ]; then
    read -p ".gitconfig already exists. Do you want to overwrite it? (Y/n) "
    if [[ "$overwrite_response" =~ ^[Yy]$ ]]; then
        echo "Copying .gitconfig to $USER_HOME"
        cp ../.gitconfig "$USER_HOME/"
    else 
        echo "Skipping .gitconfig"
    fi
else
    echo "Copying .gitconfig to $USER_HOME"
    cp ../.gitconfig "$USER_HOME/"
fi

# Configure Docker
which docker
if [ $? -eq 0 ]; then
    echo "Docker already installed"
else
    echo "Uninstalling old version Docker ......."
    # Uninstall old versions docker
    for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
        sudo apt-get remove $pkg -y;
    done

    # Add Docker's official GPG key:
    echo "Adding Docker's official GPG key ......."
    sudo apt-get update -y
    sudo apt-get install ca-certificates curl gnupg -y
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    # Add the repository to Apt sources:
    echo "Adding the repository to Apt sources ......."
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y

    # Install Docker
    echo "Installing Docker ......."
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
fi

