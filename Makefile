DOTFILE ?= ~/dotfile
ZDOTDIR ?= ~/.config/zsh

packages = bash git nvim tmux zsh
install  = $(packages:%=%/install)

.PHONY: all $(packages) $(install)

all: $(packages)

bash:
	@DOTFILE=${DOTFILE} bin/link bash/.bashrc ~

git: git/install
	@DOTFILE=${DOTFILE} bin/link git/config ${XDG_CONFIG_HOME}/git

nvim: nvim/install
	@DOTFILE=${DOTFILE} bin/link nvim/init.lua ${XDG_CONFIG_HOME}/nvim

tmux: tmux/install
	@DOTFILE=${DOTFILE} bin/link tmux/tmux.conf ${XDG_CONFIG_HOME}/tmux

zsh:
	@DOTFILE=${DOTFILE} bin/link zsh/.zshenv ~
	@DOTFILE=${DOTFILE} bin/link zsh/.zprofile ${ZDOTDIR}
	@DOTFILE=${DOTFILE} bin/link zsh/.zshrc ${ZDOTDIR}
	@DOTFILE=${DOTFILE} bin/link zsh/.zlogin ${ZDOTDIR}
	@DOTFILE=${DOTFILE} bin/link zsh/.zlogout ${ZDOTDIR}

$(install):
	@DOTFILE=${DOTFILE} $@
