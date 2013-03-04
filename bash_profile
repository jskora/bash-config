# bash_profile

# stop if not interactive shell
[ -z "$PS1" ] && return

if [ -f ~/.bashrc ] ; then
  source ~/.bashrc
fi

# MacPorts Installer addition on 2011-12-01_at_11:52:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

