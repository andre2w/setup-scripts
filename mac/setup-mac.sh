#! /bin/bash

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Install command line applications"
brew install bat diff-so-fancy fish fzf git jq tree wget

echo "Installing desktop applications"
brew cask install bitwarden docker dbeaver-community postman slack spotify visual-studio-code vlc intellij-idea firefox iterm2 notion

brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono

source ../nix/setup.sh

config_git
config_fish
