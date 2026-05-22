# Config files
tmux \
	new-session \
		-s config \
		-c ~/.config/nvim \; \
	send-keys "nvim init.lua" C-l Enter \; \
	rename-window neovim \; \
	new-window \
		-c ~/ \; \
	send-keys "nvim .tmux_init.sh" C-l Enter \; \
	rename-window init \; \
	new-window \
		-c ~/ \; \
	send-keys "nvim .tmux.conf" C-l Enter \; \
	rename-window tmux \; \
	new-window \
		-c ~/ \; \
	send-keys "nvim .zshrc" C-l Enter \; \
	rename-window zshrc \; \
	new-window \
		-c ~/.config/kitty \; \
	send-keys "nvim kitty.conf" C-l Enter \; \
	rename-window kitty \; \
	previous-window \; \
	previous-window \; \
	previous-window \; \
	previous-window \; \
	detach

# Default session
tmux \
	new-session \
		-s default \
		-c ~/ \; \
	detach

# Journalismus
tmux \
	new-session \
		-s journalismus \
		-c ~/Journalismus/ \; \
	send-keys "nvim ." C-l Enter \; \
	new-window \; \
	previous-window \; \
	detach

# Blog
tmux \
	new-session \
		-s blog \
		-c ~/Programmierprojekte/Blog/src/ \; \
 	send-keys "nvim -p blog/ _includes/layout.njk assets/styles.css assets/main.js" C-l Enter \; \
	new-window \
		-c ~/Programmierprojekte/Blog \; \
 	send-keys "npx @11ty/eleventy --serve" C-l Enter \; \
	previous-window \; \
	detach

# tmux \
# 	new-session \
# 		-s writing \
# 		-c ~/Documents/Writing \; \
# 	rename-window document \; \
# 	new-window \; \
# 	previous-window \; \
# 	detach
