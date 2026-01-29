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

# link: https://github.com/zsh-users/zsh-autosuggestions.git
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# link: https://github.com/zdharma-continuum/fast-syntax-highlighting.git
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# link: https://github.com/jeffreytse/zsh-vi-mode.git
# source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

########################################
# SMART DIRECTORY JUMPING, PROMPT, FZF
########################################
source <(zoxide init zsh) # zoxide: smarter cd command with ranking
# eval "$(zoxide init zsh)"

source <(oh-my-posh init zsh --config ~/.config/oh-my-posh/huvix.omp.json) # oh-my-posh: power10k alternative
# source <(starship init zsh) # starship: fast, modern, cross-shell prompt
# eval "$(starship init zsh)"

source <(fzf --zsh) # fzf: fuzzy find in zsh
# eval "$(fzf --zsh)"

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

# Neovim shortcut
alias v="nvim"

# Other
alias c='clear'

# NixOS
alias ns='sudo nixos-rebuild switch --flake /etc/nixos/'
alias nc='sudoedit /etc/nixos/configuration.nix'
alias nf='sudoedit /etc/nixos/flake.nix'

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
