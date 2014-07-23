limit coredumpsize unlimited

# Extended history
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_find_no_dups

SAVEHIST=100000
HISTSIZE=125000
HISTFILE=~/.zsh_history

# cvs group editable
umask 002

# Vital editor settings
export EDITOR=vi
export VISUAL=vi

# vi key bindings
bindkey -v 

# Aliases
alias ls='/bin/ls -F'

function title {
    if [ x$TERM = xxterm ] ; then
	echo "]0;$1"
    elif [ x$TERM = xaixterm ] ; then
	echo "]0;$1"
    fi
}

function chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
        #*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%1/ @ %m\a"
        *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]0;%1/\a\e]2;%1/ @ %m\a"
        ;;
    esac
}

function addpath {
    if [ \( -d $1 \) -a \( -n "${PATH/*$1:*}" \) ] ; then
        export PATH="$1:$PATH"
    fi
}

addpath "/usr/local/bin"
addpath "$HOME/bin"

if [ `id -u` = 0 ] ; then 
    PROMPT=$'%m [%h] %1/ # '
else
    PROMPT=$'%m [%h] %1/> '
fi
chpwd
