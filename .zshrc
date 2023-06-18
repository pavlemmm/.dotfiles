# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Global variables
export EDITOR=nvim

# Alias
alias ls="lsd"
alias l="lsd -l"
alias ll="lsd -l"
alias la="lsd -Alh"
alias t="tree -C"
# alias mv="mv -i"
# alias rm="rm -i"
alias v=nvim
alias vim=nvim
alias vcfg="nvim ~/.config/nvim"


# Custom keybinding to exit insert mode for zsh-vi-mode-plugin
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

# bindkey -v # -e for Emacs, -v for Vim
# bindkey -M viins 'jk' vi-cmd-mode

setopt autocd

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
