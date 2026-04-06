# Config files
tmux \
	new-session \
		-s config \
		-c ~/.config/nvim nvim init.lua \; \
	rename-window neovim \; \
	new-window \
		-c ~/ nvim ~/.tmux_init.sh \; \
	rename-window init \; \
	new-window \
		-c ~/ nvim .tmux.conf \; \
	rename-window tmux \; \
	new-window \
		-c ~/ nvim .zshrc \; \
	rename-window zshrc \; \
	new-window \
		-c ~/.config/kitty nvim kitty.conf \; \
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
		-s reformation \
		-c ~/Journalismus/ \; \
	send-keys "nvim" C-l Enter \; \
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
