export 
DOTFILE         := ${PWD}
XDG_CONFIG_HOME := ~/.config
ZDOTDIR         := ~/.config/zsh

DEP_NVIM = ninja-build gettext cmake unzip curl

packages = git zsh nvim tmux 

all: $(packages)

git: git/config
	@sudo apt install -y git
	@sh bin/link.sh git/config ${XDG_CONFIG_HOME}/git

zsh: zsh/.zlogin zsh/.zlogout zsh/.zprofile zsh/.zshenv zsh/.zshrc
	@sudo apt install -y zsh
	@echo "export ZDOTDIR=~/.config/zsh" | sudo tee /etc/zsh/zshenv > /dev/null
	@chsh -s $(which zsh)
	@sh bin/link.sh zsh/.zshenv ~
	@sh bin/link.sh zsh/.zprofile ${ZDOTDIR}
	@sh bin/link.sh zsh/.zshrc ${ZDOTDIR}
	@sh bin/link.sh zsh/.zlogin ${ZDOTDIR}
	@sh bin/link.sh zsh/.zlogout ${ZDOTDIR}

nvim: nvim/init.lua
	@sudo apt install ${DEP_NVIM}
	@git clone https://github.com/neovim/neovim /tmp/neovim
	@cd /tmp/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	@cd /tmp/neovim/build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
	@sh bin/link.sh nvim/init.lua ${XDG_CONFIG_HOME}/nvim

tmux: tmux/tmux.conf
	@sudo apt install tmux
	@sh bin/link.sh tmux/tmux.conf ${XDG_CONFIG_HOME}/tmux
