# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

#echo 'begin bash'
# Define some colors first:
# Change color 4(blue) to be brighter so that it is readable on dark backgrounds
echo -ne '\e]4;4;#8386FF\a'

RED="\[$(tput bold ; tput setaf 1)\]"
GREEN="\[$(tput bold ; tput setaf 2)\]"
YELLOW="\[$(tput bold ; tput setaf 3)\]"
BLUE="\[$(tput bold ; tput setaf 4)\]"
MAGENTA="\[$(tput bold ; tput setaf 5)\]"
CYAN="\[$(tput bold ; tput setaf 6)\]"
WHITE="\[$(tput bold ; tput setaf 7)\]"
NOCOLOUR="\[$(tput sgr0)\]"

PS1="${RED}[${WHITE}\D{%H:%M:%S}${RED}] ${CYAN}\u@\h \w\n${WHITE}\$ ${NOCOLOUR}"

export PATH=$PATH:$HOME/bin
export PATH="/usr/local/mysql/bin:$PATH"

# case insensitive tab complete
shopt -s nocaseglob
#bind set completion-ignore-case on

export GREP_COLOR='1;33'

# history
export HISTCONTROL=erasedups
export HISTSIZE=5000
shopt -s histappend

function proc () { grep -rin --color proc[[:space:]].*$1 *; }

function context () {
	awk -v L=$2 -v C=$3 'NR==L { printf ">> %5s: ", NR; print $0; next } (L-C <= NR) && (NR <= L+C) { printf "   %5s: ", NR; print $0 }' $1
}

function procname () {
	sed -n "1,$2p;$2q" $1 | grep 'proc ' | tail -1
}

# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#aliases
alias ls='ls -G --color=auto'
alias la='ls -la'
alias cls='echo -e "\033c"'
alias dirsize='du -h --max-depth=1'
alias filecount='for d in `find . -xdev -maxdepth 1 -type d  `; do echo `find $d -xdev  | wc -l` $d ; done | sort -g'
alias grep="grep --color -n"
alias rgrep="grep -r"
alias egrep='egrep --color=auto -n'              # show differences in colour
alias fgrep='fgrep --color=auto -n'              # show differences in colour
alias ctb='cat telebet.cfg'
alias bashrc='vim ~/.bashrc'
alias adbc='adb logcat -c'

alias vi='vim'

# Git
alias gd="git diff"
alias gdi="git diff --ignore-space-change"
alias gs="git status -s"
alias ga="git add"
alias gls="git ls -10"


# home
alias rpi='ssh zeno@raspberrypi'


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
