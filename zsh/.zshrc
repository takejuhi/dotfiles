autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit
PS1="$PS1 | $(sh ~/dotfiles/bin/getip.sh)"
prompt adam2

tmux source ~/.config/tmux/tmux.conf

alias ls="ls --color=auto"
alias ll="ls -la"
alias grep="grep --color=auto"
