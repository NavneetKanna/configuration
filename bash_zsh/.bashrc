export CLICOLOR=1
export PS1='\u@\h:\[$(tput setaf 2)\]\w\[$(tput sgr0)\]\$ '

export EDITOR='vim'

SAVEHIST=5000
HISTFILE=~/.bash_history
HISTSIZE=1000
PROMPT_COMMAND="history -a"

. "$HOME/.local/bin/env"
export PATH="$HOME/.cargo/bin:$PATH"

