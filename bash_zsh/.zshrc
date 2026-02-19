export CLICOLOR=1
export PS1='%n@%m:%{%F{green}%}%~%{%f%}$ '

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.2.2
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
export EDITOR='vim'
SAVEHIST=5000
HISTFILE=~/.zsh_history
HISTSIZE=1000

. "$HOME/.local/bin/env"
export PATH="$HOME/.cargo/bin:$PATH"
