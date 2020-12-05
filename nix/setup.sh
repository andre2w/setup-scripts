#! /bin/bash

echo "Commom nix env script set"

function config_git {
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
}

function config_fish {
    echo "Installing fisher and configuring fish shell"
    sudo echo "$(which fish)" >> /etc/shells
    chsh -s "$(which fish)"
    echo "Fish was set as your main shell, please you need to close the terminal and open again!"
}