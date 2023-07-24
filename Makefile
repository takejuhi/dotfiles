DOTFILE         ?= ~/dotfile
ZDOTDIR         ?= ~/.config/zsh
XDG_CONFIG_HOME ?= ~/.config
ZDOTDIR          = ~/.config/zsh

packages = git zsh nvim tmux 
install  = $(packages:%=%/install)

.PHONY: all $(packages) $(install) vsc

all: $(packages)

vsc:
	@sudo apt install -y zsh
	@DOTFILE=~/dotfiles bin/link zsh/.zshenv ${HOME}
	@DOTFILE=~/dotfiles bin/link zsh/.zprofile ${ZDOTDIR}
	@DOTFILE=~/dotfiles bin/link zsh/.zshrc ${ZDOTDIR}
	@DOTFILE=~/dotfiles bin/link zsh/.zlogin ${ZDOTDIR}
	@DOTFILE=~/dotfiles bin/link zsh/.zlogout ${ZDOTDIR}
	@echo "export ZDOTDIR=\${HOME}/.config/zsh" | sudo tee /etc/zsh/zshenv > /dev/null

git: git/install
	@DOTFILE=${DOTFILE} bin/link git/config ${XDG_CONFIG_HOME}/git

nvim: nvim/install
	@DOTFILE=${DOTFILE} bin/link nvim/init.lua ${XDG_CONFIG_HOME}/nvim

tmux: tmux/install
	@DOTFILE=${DOTFILE} bin/link tmux/tmux.conf ${XDG_CONFIG_HOME}/tmux

zsh: zsh/install
	@DOTFILE=${DOTFILE} bin/link zsh/.zshenv ~
	@DOTFILE=${DOTFILE} bin/link zsh/.zprofile ${ZDOTDIR}
	@DOTFILE=${DOTFILE} bin/link zsh/.zshrc ${ZDOTDIR}
	@DOTFILE=${DOTFILE} bin/link zsh/.zlogin ${ZDOTDIR}
	@DOTFILE=${DOTFILE} bin/link zsh/.zlogout ${ZDOTDIR}
	@./zsh/chsh

$(install):
	@DOTFILE=${DOTFILE} $@
