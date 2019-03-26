source /usr/share/defaults/etc/profile

# https://askubuntu.com/questions/60218/how-to-add-a-directory-to-the-path
# A path set in .bash_profile will only be set in a bash login shell (bash -l).
# in .profile it will be available to your complete desktop session.

# check PATH variable of a process by looking at its environment in /proc/[pid]/environ
# ps axf | grep -z "^PATH" /proc/[pid]/environ
# alias psp='ps axf | grep -z "^PATH" /proc/[pid]' # /environ

if [ -d "$HOME/bins" ] ; then
  PATH="$PATH:$HOME/bins"
fi
