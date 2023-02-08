#!/bin/zsh
#            _
#    _______| |__   ___ _ ____   __
#   |_  / __| '_ \ / _ \ '_ \ \ / /
#  _ / /\__ \ | | |  __/ | | \ V /
# (_)___|___/_| |_|\___|_| |_|\_/


# Add to $PATH
export PATH="$PATH:$HOME/Library/Python/3.9/bin:${$(find ~/.local/bin -maxdepth 1 -type d -exec stat -nf %N: {} \;)%%:}"

# Apps
export EDITOR="code"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export LOCAL_BIN_HOME="$HOME/.local/bin"

# ~/ Clean-up
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export LESSHISTFILE="-"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc"
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export PNPM_HOME="$LOCAL_BIN_HOME/pnpm"
export NODE_REPL_HISTORY=""
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"