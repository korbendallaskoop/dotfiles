# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# source /usr/share/defaults/etc/profile

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Learn your external IP
# rav101 https://discuss.getsol.us/d/179-what-are-your-best-most-used-terminal-aliases
alias ipe='curl ipinfo.io/ip'

#============================================================
#  shell bashing

alias h='history' # bang!
alias hg='history | grep' #

alias j='jobs -l'
alias which='type -a'
alias cl='clear' # clear terminal and output history, ctrl-l to clear terminal only

alias gb='cat ~/.bashrc ~/.bash_aliases | grep' # grab that bash boy
alias psx='ps axc -o cmd,pid,%mem --sort=%mem' # sorted ascending by mem usage
alias gps='ps axc | grep' # a view to a pid kill

alias du='du -h'    # human readable
alias dus='du -ahd1'    # all below ./, human readable, folders summarized

alias df='df -kTh -x squashfs' # https://discuss.getsol.us/d/179-what-are-your-best-most-used-terminal-aliases/19
alias dfa='df -akTh'

alias free='free -m'

#============================================================
# file system navi and operations
# based on http://tldp.org/LDP/abs/html/sample-bashrc.html

alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

alias rm='rm -ir'  # confirm each file or folder deletion
alias rmf='rm -rf' # fearless rm
alias rmall='rm -rf *' # wipe em all

alias mkd='mkdir -p' # no error if existing, make parent directories as needed

alias ..='cd ..'  # 1 step back
# https://medium.com/wearetheledger/oh-my-zsh-made-for-cli-lovers-installation-guide-3131ca5491fb
alias ~='cd ~'
alias ...='cd ../..' # 2 steps back
alias ....='cd ../../..' # 3 steps back

# https://stackoverflow.com/a/5130969
# https://stackoverflow.com/a/16928162
# sel c for selection clipboard

alias ccp='pwd | xclip -sel c -r'  # Copy Current Path to system clipboard
alias ccpw='echo -n ${PWD/ /\\ } | xclip -sel c -r'  # ..same with backslashed white spaces
alias c='xclip -sel c -r'      #  copy without new line character at end
alias cn='xclip -sel c'                     #  copy with  new line at end
alias v='xclip -o -sel c'                            # paste

# bash can't use '|' as first alias argument
# fx for '\ xclip' or '| grep'
# zsh can
# for such purpose I'm using AutoKey phrases instead - https://github.com/autokey/autokey

#-------------------------------------------------------------
# trimming RMS' and MacKenzies beast

alias ls='ls -h'
alias l.='ls -lhXB'   #  Sort by extension
alias lk='ls -hSro'   #  Sort by size, biggest last. Use du for summarized output
alias lt='ls -lthro'  #  Sort by date, most recent last

alias lc='ls -ltchr'  #  Sort by/show change time,most recent last.
alias lu='ls -lturh'  #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -logvGh --group-directories-first"
alias l="ls -logvGh --group-directories-first"

alias la='ll -CAl'           #  Show hidden files.

alias lf='ls -lv --group-directories-first'
alias lr='ll -Rh'           #  Recursive ls.

alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

#-------------------------------------------------------------

# yes we can
alias cm='./configure && make'    #
alias smi='sudo make install'    #

#-------------------------------------------------------------
# from Kubunu 18.10 .bashrc defaults

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias g='grep --color=auto'
fi

#-------------------------------------------------------------

alias g='grep'
