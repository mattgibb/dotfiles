. ~/.bash/env
. ~/.bash/config
. ~/.bash/aliases
# . ~/.bash/completions

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
