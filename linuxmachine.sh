#!/usr/bin/env bash

# update & upgrade package
sudo apt update -y && sudo apt upgrade -y

# install packages
sudo apt install neovim git 

# configure git
git config --global user.email "zhenchai0000@gmail.com"
git config --global user.name "zhenchai"
git config --global core.editor "vim"
