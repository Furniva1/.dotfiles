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
    # Stop using rm command
    alias del='gio trash --color=auto'
    alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"
    # Fast upward navigation
    alias ..='cd .. --color=auto'
    alias ...='cd ../../../ --color=auto'
    alias ....='cd ../../../../ --color=auto'
    alias .....='cd ../../../../ --color=auto'
    alias cdh='cd ~ --color=auto'
    alias cd..='cd .. --color=auto'
    # Alias Ping
    alias ping='ping -c 5 --color=auto'
    alias fastping='ping -c 100 -s.2 --color=auto'
    # List TCP port that are listening
    alias openports='sudo lsof -iTCP -sTCP:LISTEN -P --color=auto'
    # Internet Speedtest
    alias ethspeed='speedometer -r eno1 --color=auto'  # adapter name ip a
    # Wifi Speedtest
    alias wifispeed='speedometer -r --color=auto' # add adapter name ? (env variable)
    # System Commands
    alias reboot='sudo /sbin/reboot --color=auto'
    alias poweroff='sudo /sbin/poweroff --color=auto'
    alias halt='sudo /sbin/halt --color=auto'
    alias shutdown='sudo /sbin/shutdown --color=auto'
    # Show open ports
    alias ports='sudo netstat -tulanp --color=auto'
    # Free and Used
    alias meminfo='free -m -l -t --color=auto'
    # Get top process eating memory
    alias psmem="ps auxf | sort -nr -k 4"
    alias psmem10='ps auxf | sort -nr -k 4 | head -10 --color=auto'
    # Get top process eating cpu
    alias pscpu='ps auxf | sort -nr -k 3 --color=auto'
    alias pscpu10='ps auxf | sort -nr -k 3 | head -10 --color=auto'
    # Get details of a process
    alias paux='ps aux | grep --color=auto'
    # Get server cpu info
    alias cpuinfo='lscpu --color=auto'
    # Older system use /proc/cpuinfo
    alias cpuinfo='less /proc/cpuinfo --color=auto'
    # Get GPU ram on desktop / laptop
    alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log --color=auto'
    # Resume wget by default
    alias wget='wget -c --color=auto'
    # Grabs the disk usage in the current directory
    alias usage='du -ch | grep total --color=auto'
    # Gets the total disk usage on your machine
    alias totalusage='df -hl --total | grep total --color=auto'
    # Shows the individual partition usages without the temporary memory values
    alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs --color=auto'
    # Gives you what is using the most space. Both directories and files.
    alias most='du -hsx * | sort -rh | head -10 --color=auto'
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


