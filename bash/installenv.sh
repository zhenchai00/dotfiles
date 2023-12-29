#!/usr/bin/env bash

# Get the home directory of the current user
USER_HOME=$(eval echo ~$USER)

# Update & upgrade package
echo "Installation start ......."
echo "Update & upgrade package ......."
sudo apt update -y && sudo apt upgrade -y

# Prepare tools directory
if [[ ! -d "$USER_HOME/tools" ]]; then
    echo "Creating tools directory ......."
    mkdir -p "$USER_HOME/tools"
fi

# Install Fuzzy Finder FZF
which fzf
if [[$? -eq 0]]; then
    echo "Fuzzy Finder FZF already installed"
else
    echo "Installing Fuzzy Finder FZF ......."
    git clone --depth 1 https://github.com/junegunn/fzf.git $USER_HOME/fzf
    $USER_HOME/fzf/install --all
fi

# Install git
which git
if [[$? -eq 0]]; then
    echo "Git already installed"
else
    echo "Installing git ......."
    sudo apt install git -y
fi
# Configure git
# git config --global user.email "zhenchai0000@gmail.com"
# git config --global user.name "zhenchai"
# git config --global core.editor "vim"
# Check if .gitconfig exists
if [ -f "$USER_HOME/.gitconfig" ]; then
    read -p ".gitconfig already exists. Do you want to overwrite it? (Y/n) " overwrite_response
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

# Install neovim
which nvim
if [[$? -eq 0]]; then
    echo "Neovim already installed"
else
    echo "Installing neovim ......."
    sudo apt install neovim -y
fi
if [[ ! -d "$USER_HOME/.config/nvim" ]]; then
    echo "Creating nvim config directory ......."
    mkdir -p "$USER_HOME/.config/nvim"
fi
echo "Copying init.vim to $USER_HOME/.config/nvim"
cp ../.config/nvim/init.vim "$USER_HOME/.config/nvim/"

# Install oh-my-bash
# More info please refer to https://github.com/ohmybash/oh-my-bash/wiki
# Install in subshell
(
    echo "Updating bash shell ......."
    echo "Installing oh-my-bash ......."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
)

# Copy .bashrc to home directory
echo "Overwrite .bashrc ......."
cp .bashrc "$USER_HOME/"
cp .bash_aliases "$USER_HOME/"

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
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /etc/apt/keyrings/docker.gpg
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

source "$USER_HOME/.bashrc"