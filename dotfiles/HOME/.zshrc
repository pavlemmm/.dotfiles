#
# Plugins
#
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Zoxide init
eval "$(zoxide init zsh)"
# Starship prompt
eval "$(starship init zsh)"

#
# Global variables
#
export EDITOR=nvim
export TERM=alacritty

#
# Alias
#

#alias ls="lsd"
#alias l="lsd -l"
#alias ll="lsd -l"
#alias la="lsd -Alh"
#alias t="tree -C"

alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias l="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias lt="eza -l --icons --tree -L 3"

alias v=nvim
alias vim=nvim
alias vcfg="nvim ~/.config/nvim"

alias cd="z" # zoxide

alias rm="rm -i"
#alias mv="mv -i"

#alias sudo='sudo --preserve-env=HOME' # When doing sudo commands, get all config files from home user



#
# Keybindings
#

bindkey -v # -e for Emacs, -v for Vim
#bindkey -M viins 'jk' vi-cmd-mode

#
# Options
#

setopt autocd # change dir without cd
