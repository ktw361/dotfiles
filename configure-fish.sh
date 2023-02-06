#!/bin/bash
mkdir -p $HOME/.config/fish/functions
mkdir -p $HOME/.config/fish/conf.d

ln fish/functions/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
ln fish/conf.d/abbr.fish $HOME/.config/fish/conf.d/abbr.fish
