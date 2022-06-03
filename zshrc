# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# generate and source plugins from ~/.zsh_plugins.txt
antidote load

ZSH_THEME=robbyrussell

source .zsh_aliases

neofetch --ascii .logo --ascii_colors 15 5 6

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
