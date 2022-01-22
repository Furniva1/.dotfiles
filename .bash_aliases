    # Stop using rm command
    alias del='gio trash'
    alias rm="echo Use 'del', or the full path i.e. '/bin/rm'"
    
    # Fast upward navigation
    alias ..='cd ..'
    alias ...='cd ../../../'
    alias ....='cd ../../../../'
    alias .....='cd ../../../../'
    alias cdh='cd ~'
    alias cd..='cd ..'

    # Clear screen 'printf "\033c"' or printf "\ec" or echo -en "\ec" or clear
    alias cl='printf "\033c"'     

    # Alias Ping
    alias ping='ping -c 5'
    alias fastping='ping -c 100 -s.2'
    
    # List TCP port that are listening
    alias openports='sudo lsof -iTCP -sTCP:LISTEN -P'
    
    # System Commands
    alias reboot='sudo /sbin/reboot'
    alias poweroff='sudo /sbin/poweroff'
    alias halt='sudo /sbin/halt'
    alias shutdown='sudo /sbin/shutdown'
    
    # Show open ports
    alias ports='sudo netstat -tulanp'
    
    # Free and Used
    alias meminfo='free -m -l -t'
    
    # Get top process eating memory
    alias psmem="ps auxf | sort -nr -k 4"
    alias psmem10='ps auxf | sort -nr -k 4 | head -10'
    
    # Get top process eating cpu
    alias pscpu='ps auxf | sort -nr -k 3'
    alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
    
    # Get details of a process
    alias paux='ps aux | grep'
    
    # Get server cpu info
    alias cpuinfo='lscpu'
    
    # Older system use /proc/cpuinfo
    alias cpuinfo='less /proc/cpuinfo'
    
    # Get GPU ram on desktop / laptop
    alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
    
    # Resume wget by default
    alias wget='wget -c'
    
    # Grabs the disk usage in the current directory
    alias usage='du -ch | grep total'
    # Gets the total disk usage on your machine
    alias totalusage='df -hl --total | grep total'
    
    # Shows the individual partition usages without the temporary memory values
    alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'
    # Gives you what is using the most space. Both directories and files.
    alias most='du -hsx * | sort -rh | head -10'
