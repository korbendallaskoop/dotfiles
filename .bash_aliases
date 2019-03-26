# source /usr/share/defaults/etc/profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# VNC Server in Service Mode daemon
# Start or stop the service with:
#  systemctl (start|stop) vncserver-x11-serviced.service
#Mark or unmark the service to be started at boot time with:
# systemctl (enable|disable) vncserver-x11-serviced.service


#-------------------------------------------------------------
# Solus on HP2760p install specific

# from Solus Josh
# https://discuss.getsol.us/d/179-what-are-your-best-most-used-terminal-aliases/3

#export DevicesDir="/usr/share"
# ....Data partition
#alias g2="cd ${DevicesDir}/morespace"

#go to bookmarks for mounted device folders on Data partition
export DevicesDir="/run/media/korben/Data"
alias g2vms="cd ${DevicesDir}/Virtual\ Machines"
alias rmk="cd /run/media/korben"

# left arrow, key 113, is broken
# remapping its neighbour right control
# keycode 113 = Left NoSymbol Left
# keycode 105 = Control_R NoSymbol Control_R
#
# source: https://unix.stackexchange.com/questions/348056/how-to-remap-keys-using-xkb-symbols-us-file-in-ubuntu#348057

xmodmap -e 'keycode 105 = Left Control_R Left Control_R'

#============================================================
#  Solux plexusk pkg

alias epi='sudo eopkg install'
alias epr='sudo eopkg remove'
alias eprmo='sudo eopkg remove-orphans' # (rmo) - Remove orphaned packages
alias eps='sudo eopkg search'
alias epinf='sudo eopkg info'
alias epupd='sudo eopkg up' #update solar system solus

# checks the sha256sums of files on disk versus what was originally installed by the original .eopkg file.
# https://getsol.us/articles/troubleshooting/general-troubleshooting/en/
alias epchk='sudo eopkg check'

#============================================================
#  Debiansk

alias sai='sudo apt install'
alias sas='sudo apt search'
alias sap='sudo apt purge'
alias sau='sudo apt update'

# apt-get remove
# packagenam binaries but not the configuration or data files of the package packagename.
# leaves dependencies installed with it on installation time untouched.

# apt-get purge
# remove about everything regarding the package packagename, but not the dependencies installed with it
# does not remove configuration or data files residing in users home directories,
# There is no easy way to get those removed as well.

# apt-get autoremove
# removes orphaned packages, i.e. packages that used to be installed as an dependency, but aren't any longer

#-------------------------------------------------------------
# i3 apps
# https://github.com/jamielinux/bashmount

alias bm='bashmount'
alias nb='newsboat'

#============================================================
#  Land of Vagrantus

alias vgi='vagrant init'

alias vgr='vagrant reload' # restarts vagrant machine, loads new Vagrantfile configuration
alias vup='vagrant up' # starts and provisions the vagrant environment
alias vgs='vagrant suspend' # as in pause/sleep/ or save machine state in VBx
alias vgh='vagrant halt' # power off VM
alias vgbl='vagrant box list'

# vagrant up --provider virtualbox
# vagrant up --provider lxc

alias vgst='vagrant global-status'
alias vsh='vagrant ssh'
alias vg='vagrant'

#============================================================
#  It's a dock

alias dk='docker'
alias dks='docker start'
alias dkr='docker run'

alias dkim='docker image ls'

## List containers (running, all, all in quiet mode)
alias dkc='docker container ls'
alias dkca='docker container ls --all'

alias dkcu='docker-compose up'
alias dkcd='docker-compose down'
alias dkce='docker-compose exec'

alias dkp='docker ps'

#-------------------------------------------------------------
# redshift color temperature
# neutral temperature is 6500K. Using this value will not change the color

alias rs23='redshift -P -O 2333'    #
alias rs27='redshift -P -O 2777'    #
alias rs3='redshift -P -O 3000'    #
alias rs33='redshift -P -O 3333'    #
alias rs36='redshift -P -O 3666'    #
alias rs4='redshift -P -O 4000'    #
alias rsd='redshift -o 90'    # One-shot mode, repeat to continuously decrease by 10%
alias rsp='redshift -p'    # status
alias rsx='redshift -x'    # kill

#-------------------------------------------------------------
# setting up .cfg_bckp/ as a dotfiles backup repo
# from https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
# via DistroTube

alias cfg='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME'

# add a file or folder to repo:
alias cfga='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME add'
# or remove:
alias cfgr='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME rm -r --cached'

# change and commit status:
alias cfgs='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME status'
# show textual staged edits to be committed and changes in the working tree that have not yet been staged:
alias cfgsv='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME status -v -v'
# list all repo'd files:
alias cfgl='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME ls-tree -tr --name-only --full-name --full-tree master'
# add -d to list folders only
# and | grep <string> to search within list

alias cfgc='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME commit -a'
alias cfgp='/usr/bin/git --git-dir=$HOME/.cfg_bckp/ --work-tree=$HOME push'

####### .cfg_bckp_pri private dotfiles backup repo

alias cfp='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME'
alias cfpa='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME add'
alias cfpr='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME rm -r --cached'

alias cfps='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME status'
alias cfpsv='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME status -v -v'
alias cfpl='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME ls-tree -tr --name-only --full-name --full-tree master'

alias cfpc='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME commit -a'
alias cfpp='/usr/bin/git --git-dir=$HOME/.cfg_bckp_pri/ --work-tree=$HOME push'
