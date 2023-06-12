ln -fsvvv ~/dotfile/bash/.bashrc ~

mkdir -pvvv $XDG_CONFIG_HOME/git
ln -fsvvv ~/dotfile/git/config $XDG_CONFIG_HOME/git

. ~/dotfile/nvim/setup.sh
