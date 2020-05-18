#! /bin/bash

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Install command line applications"
brew install bat diff-so-fancy fish fzf git jq tree wget

echo "Installing desktop applications"
brew cask install bitwarden docker dbeaver-community postman slack spotify visual-studio-code vlc intellij-idea firefox iterm2 notion

echo "Configure GIT"
git config --global user.name "Andre Torres"
git config --global user.email "andre855@gmail.com"

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

echo "Installing fisher and configuring fish shell"
sudo echo "/usr/local/bin/fish" >> /etc/shells
chsh -s "/usr/local/bin/fish"

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add oh-my-fish/theme-clearance
brew tap homebrew/cask-fonts
brew cask install font-jetbrains-mono

echo "Install SDKMAN and configuration for fish"
curl -s "https://get.sdkman.io" | bash
fisher add reitzig/sdkman-for-fish

echo "Install Java 8 and 11"
sed -i "s/sdkman_auto_answer=false/sdkman_auto_answer=true/g" ~/.sdkman/etc/config
sdk install java 8.0.252-zulu
sdk install java 11.0.7-zulu
sdk default java 8.0.252-zulu