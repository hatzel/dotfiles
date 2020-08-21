source ~/.zplug/init.zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "nojhan/liquidprompt"
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "skywind3000/z.lua"

zplug load

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt inc_append_history
setopt share_history
setopt extended_history
setopt no_hist_beep
setopt hist_ignore_space

# Overwrite zsh plugin functions to get working indication with liquidprompt
function zle-line-init zle-keymap-select {
    VI_KEYMAP=$KEYMAP
    MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"

    RPS1="${${VI_KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
    zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz compinit && compinit

# Make sure to do this after compinit
eval "$(lua $ZPLUG_REPOS/skywind3000/z.lua/z.lua --init zsh enhanced)"

# Add gpg and ssh keys
eval $(keychain --eval --timeout 30 --agents ssh,gpg -Q --quiet id_rsa 6B2BA2211144ED18)
