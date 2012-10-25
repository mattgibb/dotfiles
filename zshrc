# source the bash files
. ~/.bashrc

# source zsh-specific files
. ~/.zsh/env
. ~/.zsh/config
. ~/.zsh/aliases

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/Users/Matt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory beep nomatch
unsetopt autocd extendedglob notify
# bindkey -v
# End of lines configured by zsh-newuser-install
