if [ ! -d ~/neovim ]; then
	. ~/dotfile/nvim/install.sh
fi

# setup
mkdir -pvvv $XDG_CONFIG_HOME
ln -fsvvv ~/dotfile/nvim/ $XDG_CONFIG_HOME/
