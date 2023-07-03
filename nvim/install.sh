# build prerequisties
sudo apt-get install \
	ninja-build \
	gettext \
	cmake \
	unzip \
	curl

git clone https://github.com/neovim/neovim ~/neovim
cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
# sudo make install
cd ~/neovim/build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
