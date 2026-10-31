export PATH="$PATH:$HOME/.local/bin:/usr/local/lib:$HOME/.cargo/bin"

# Plugins (requires the following repos)
# ~/.zsh/zsh-autosuggestions, ~/.zsh/zsh-completions, ~/.zsh/zsh-syntax-highlighting

# Autosuggestions (needs to be first)
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Completions
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -Uz compinit
compinit

# Syntax highlighting (needs to be last)
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey $'\E[1;5D' backward-word
bindkey $'\E[1;5C' forward-word
bindkey '^[[Z' reverse-menu-complete

# History options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' group-name 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Aliases
alias ls='ls --color'
alias la='ls -a --color'
alias mkdir='mkdir -p'
alias rm='rm -r'
alias clear="clear && fastfetch"
alias mkvenv="python3 -m venv .venv && source .venv/bin/activate"
alias lrm="rm *.log; rm *.aux; rm *.out; rm *.fls; rm *.fdb_latexmk"

# Miscellaneous options
PS1="%F{cyan}%~:%f "
export MANPAGER='nvim +Man!'

# Tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	eval "$(zsh ~/.tmux_init.sh)"
	tmux attach -t default
fi

if command -v fastfetch; then
	clear
fi

# 1. Define the custom clear function
fastfetch-clear() {
    clear       # Standard clear command (or your custom function from earlier)
    zle redisplay # Safely redraws the Zsh prompt line
}

# 2. Register the function as a Zsh line editor (ZLE) widget
zle -N fastfetch-clear

# 3. Bind Ctrl+L to your new widget
bindkey '^L' fastfetch-clear
