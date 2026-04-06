export PATH="$PATH:$HOME/.local/bin"

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

# Miscellaneous options
PS1="%F{cyan}%~:%f "
export MANPAGER='nvim +Man!'

# Tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	eval "$(zsh ~/.tmux_init.sh)"
	tmux attach -t default
fi
