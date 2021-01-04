#! /bin/bash
# This is the first setup to install the basic tools

sudo apt-get update -y
sudo apt-get install -y bat fish fzf git jq tree wget unzip zip build-essential zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev 

# missing diff-so-fancy

source ../nix/setup.sh

config_git
config_fish
