# save history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

color1="blue"
color2="cyan"
color3="yellow"
color4="red"

fancy_prompt() {
    # user@host
    echo -n "%{$bg[$color1]%}%n@%m %{$bg[$color2]%}%{$fg[$color1]%}"

    # current dir
    echo -n " %{$fg_bold[$color3]%}%1~%{$reset_color%}%{$bg[$color2]%} %{$reset_color%}"

    # add branch
    git=$(git branch 2>/dev/null)
    if [[ "$git" != "" ]];
    then
        branch=$(echo $git | grep \* | cut -c 3-)
        echo -n "%{$bg[$color4]%}%{$fg[$color2]%} %{$reset_color%}%{$bg[$color4]%} $branch %{$reset_color%}%{$fg[$color4]%}%{$reset_color%} "
    else
        echo "%{$fg[$color2]%}%{$reset_color%} "
    fi
}

autoload -U compinit
compinit

autoload -U colors && colors
setopt promptsubst
PROMPT='%{%f%b%k%}$(fancy_prompt)'

alias ls='ls --color=auto'
alias ackpy='ack --type=python'

export TERM=xterm-256color

# fix some keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Set terminal window title to pwd
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        ;;
esac

# Load machine specific settings
source ~/.zshrc2
