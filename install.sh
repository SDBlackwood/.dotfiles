#!/bin/bash

# Install Brew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Brew installs
brew install --cask zed
brew install yazi
brew install neovim
brew install helix
brew install zshi
brew install kubectx
brew install poetry

# Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
