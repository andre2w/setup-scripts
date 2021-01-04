#!/usr/bin/env fish

source ../nix/configure_fish.fish

setup_theme
setup_sdkman
setup_rbenv

sed -i "s/set -l blue (set_color blue)/set -l blue (set_color a9c1e8)/g" ~/.config/fish/functions/fish_prompt.fish
