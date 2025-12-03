# Any env vars or configuration that OTHER programs will use should
# go into ~/.zprofile.
# This file is sourced for login-shells only. If env vars are exported here,
# they are made available to subshells as well

# Set Homebrew environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"

# Personal bin scripts
export PATH="$HOME/bin:$PATH"

# Homebrew bundle file
export HOMEBREW_BUNDLE_FILE="$HOME/dotfiles/homebrew/Brewfile"

# AWS pager
export AWS_PAGER=""

# History settings
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=100000
export SAVEHIST=50000

# GPG_TTY
export GPG_TTY=$(tty)

# set XDG cache var to prevent cache scattering
# only works if fucking programs respect it
# there's like 3 that do
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
