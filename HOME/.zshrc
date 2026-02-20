########################################
# BASIC SHELL OPTIONS
########################################
unsetopt BEEP                     # Disable annoying beeps in terminal
setopt correct                    # Auto-correct minor spelling mistakes in commands
setopt extendedglob               # Enable advanced globbing patterns (**/*.txt)
setopt nocaseglob                 # Case-insensitive globbing for filename completion
setopt auto_param_slash           # when a dir is completed, add a / instead of a trailing space

########################################
# HISTORY CONFIGURATION
########################################
HISTFILE=~/.zsh_history           # File where command history is saved
HISTSIZE=10000                    # Number of commands to keep in memory
SAVEHIST=$HISTSIZE                # Number of commands to save to disk
HISTDUP=erase

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_FIND_NO_DUPS

########################################
# ENVIRONMENT VARIABLES
########################################
export EDITOR=nvim                # Default editor
export VISUAL=nvim                # Default visual editor

########################################
# SAFE PATH HANDLING
########################################
# Function to add a directory to PATH if it's not already included
path_add() {
  [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
}
path_add "$HOME/.local/bin"        # Local binaries
path_add "$HOME/.opencode/bin"     # Opencode binaries

########################################
# COMPLETION SYSTEM
########################################
autoload -Uz compinit && compinit # Load the Zsh completion system
autoload -U colors && colors

# Improve completion UX
zstyle ':completion:*' menu select                          # Show menu for selecting completions
zstyle ':completion:*' special-dirs true                    # force . and .. to show in cmp menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # Case-insensitive completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # Use LS_COLORS for coloring completion entries
########################################
# LOAD PLUGINS
########################################
# Zsh Autosuggestions
if [[ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Fast Syntax Highlighting
if [[ -f ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]]; then
    source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

# Zsh Vi Mode (optional)
# if [[ -f ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh ]]; then
#     source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# fi

########################################
# SMART DIRECTORY JUMPING, PROMPT, FZF
########################################
# zoxide
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# oh-my-posh
if command -v oh-my-posh >/dev/null 2>&1; then
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/huvix.omp.json)"
fi

# starship (alternative prompt)
# if command -v starship >/dev/null 2>&1; then
#     eval "$(starship init zsh)"
# fi

# fzf
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi

########################################
# ALIASES
########################################
# Modern replacement for ls
alias ls="eza --icons --group-directories-first"
alias l="eza -l --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias t="eza -l --icons --tree"
alias lt="eza -l --icons --tree -L 3"

# Better cat
alias cat="bat"

# Neovim shortcut
alias v="nvim"

# Other
alias c='clear'

# NixOS
alias ns='sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#$(hostname)'
alias nc='nvim /etc/nixos/configuration.nix'

########################################
# YAZI FILE MANAGER INTEGRATION
########################################
# Open yazi and automatically cd into last directory
y() {
  local tmp
  tmp="$(mktemp -t yazi-cwd.XXXXXX)"
  yazi "$@" --cwd-file="$tmp"
  [[ -f "$tmp" ]] && cd "$(cat "$tmp")"
  rm -f "$tmp"
}

########################################
# KEYBINDINGS
########################################

bindkey -v # Enable basic vi-mode (normal/insert mode)

bindkey -M viins '^L' autosuggest-accept # Ctrl-L accept autosuggestion in insert mode
bindkey '^H' backward-kill-line # Ctrl-H kill the line (delete everything typed so far)
bindkey '^J' down-line-or-history # Map Ctrl-J to next history (like Down arrow)
bindkey '^K' up-line-or-history # Map Ctrl-K to previous history (like Up arrow)

# ZVM_VI_SURROUND_BINDKEY="s-prefix" # zsh-vi-mode surround option
# ZVM_SYSTEM_CLIPBOARD_ENABLED=true # zsh-vi-mode enable clipboard copy with y

########################################
# CURSOR SHAPE FOR BASIC VI MODE (NO PLUGINS)
########################################

# Tell zsh to call widgets when switching vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    # Normal mode: block cursor
    echo -ne '\e[1 q'
  else
    # Insert mode: line cursor
    echo -ne '\e[5 q'
  fi
}

# Ensure cursor shape is correct when a new prompt appears
function zle-line-init {
  echo -ne '\e[5 q'   # default to insert mode (line)
}

zle -N zle-keymap-select
zle -N zle-line-init
