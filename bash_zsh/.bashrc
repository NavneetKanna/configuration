export CLICOLOR=1
export PS1='\u@\h:\[\033[32m\]\w\[\033[0m\]\$ '

export EDITOR='vim'

bind 'set completion-ignore-case on'

SAVEHIST=5000
HISTFILE=~/.bash_history
HISTSIZE=1000
PROMPT_COMMAND="history -a"

. "$HOME/.local/bin/env"
export PATH="$HOME/.cargo/bin:$PATH"

