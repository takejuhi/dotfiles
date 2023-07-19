if [ $SHLVL = 1 ]; then
	source /home/take/.cargo/env
	/usr/bin/tmux a -t login
	if [ $? = 1 ]; then
		/usr/bin/tmux new -s login
	fi
	exit
fi
