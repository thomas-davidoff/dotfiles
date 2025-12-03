# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

cache_dir="$XDG_CACHE_HOME/zsh"

if [[ ! -d "$cache_dir" ]]; then
  mkdir -p "$cache_dir"
fi

[[ -z "$SHORT_HOST" ]] && SHORT_HOST="${HOST/.*/}"

# fpath changes
fpath+=~/.zfunc
fpath=($HOME/.docker/completions $fpath)

# move compinit dump file to cache dir
autoload -Uz compinit
export ZSH_COMPDUMP="$cache_dir/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
compinit -d "$ZSH_COMPDUMP"

# enable completion caching for zstyles
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$cache_dir/.zcompcache"

# enable bash-style completions (for aws cli and shit)
autoload -U bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# theming
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
        git
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

colormap() {
        for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

if [[ $(command -v uv) ]]; then
  eval "$(uv generate-shell-completion zsh)"
  eval "$(uvx --generate-shell-completion zsh)"
else
  print -P "%B%F{yellow}Warning: uv is not installed%f%b"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
