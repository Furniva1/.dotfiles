#   ________  ________  ________  ___  ___  ________  ________
#  |\   __  \|\   __  \|\   ____\|\  \|\  \|\   __  \|\   ____\
#  \ \  \|\ /\ \  \|\  \ \  \___|\ \  \\\  \ \  \|\  \ \  \___|
#   \ \   __  \ \   __  \ \_____  \ \   __  \ \   _  _\ \  \
#  __\ \  \|\  \ \  \ \  \|____|\  \ \  \ \  \ \  \\  \\ \  \____
# |\__\ \_______\ \__\ \__\____\_\  \ \__\ \__\ \__\\ _\\ \_______\
# \|__|\|_______|\|__|\|__|\_________\|__|\|__|\|__|\|__|\|_______|
#                         \|_________|




# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# -------------------------------------------------
# To make .bashrc commands global for all users
# goto /etc/skel/ as root
# .dotfiles modified here are common to all users
# Also any common folders/files ie: welcome.txt
# can be placed in the /etc/skel/ location as root
# useradd johndoe and passwd johndoe will inherit the 
# above settings from /etc/skel/
# -------------------------------------------------

# Minor errors in path spelling are corrected automatically
# i.e. 'cd ~/Desltop' will bring us to ~/Desktop
shopt -s cdspell

# when you run from a script, load this first
shopt -s expand_aliases

# Allows you to cd into directory by simply typing the name of the directory
shopt -s autocd

# Save all lines of multiline cmd in same history line
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# Ignore some commands (used really often) from history: bg, fg, ll, ls, exit
export HISTIGNORE="&:ls:ll:la:exit:clear:pwd:hostname:ip addr"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
#HISTSIZE=HISTFILESIZE=   #Infinite history

# Save date and time when commands were used in history
export HISTTIMEFORMAT="%F %T  "


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Original color settings

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ALIAS LIST GOES HERE
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias ll='/bin/ls -lv --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias l='ls -CF --color=auto'
    #alias la='ls -A'
    alias la='/bin/ls -avCF --color=auto'
    alias lf='/bin/ls -vCF --color=auto'
    #alias ll='ls -alF'
    alias ll='/bin/ls -lv --color=auto'
    alias lla='/bin/ls -alv --color=auto'
    alias ltr='/bin/ls -ltr --color=auto'
    alias ltra='/bin/ls -ltra --color=auto'
   
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Bash completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
[ -r /home/imf/.byobu/prompt ] && . /home/imf/.byobu/prompt   #byobu-prompt#


# Show bash command help <TAB> to complete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'


# Redirect to .bash_functions

if [ -f $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# Redirect to .bash_aliases


if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/#[;&|]\s*alert$//'\'')"'


# Different Prompt Flavours


function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt
neofetch


