#!/bin/bash
mkdir -p $HOME/.config/fish/functions
mkdir -p $HOME/.config/fish/conf.d

ln -sfn `realpath fish/functions/fish_prompt.fish` $HOME/.config/fish/functions/fish_prompt.fish
ln -sfn `realpath fish/functions/dependent_run.fish` $HOME/.config/fish/functions/dependent_run.fish
ln -sfn `realpath fish/conf.d/abbr.fish` $HOME/.config/fish/conf.d/abbr.fish
