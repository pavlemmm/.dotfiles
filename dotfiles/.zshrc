if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Plugins
#
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

#
# Global variables
#
export EDITOR=nvim
#export TERM=alacritty

#
# Alias
#
alias ls="lsd"
alias l="lsd -l"
alias ll="lsd -l"
alias la="lsd -Alh"
alias t="tree -C"
alias v=nvim
alias vim=nvim
alias vcfg="nvim ~/.config/nvim"
#alias mv="mv -i"
#alias rm="rm -i"

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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
