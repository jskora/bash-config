# on OSX, the bash startup sequence is:
# [per http://superuser.com/questions/69130/where-does-path-get-set-in-os-x-10-6-snow-leopard]
#  1. /etc/profile
#  2. ~/.bash_profile
#  3. ~/.bash_login   (if .bash_profile does not exist)
#  4. ~/.profile      (if .bash_login does not exist)
#

# stop if not interactive shell
[ -z "$PS1" ] && return

# check for debug flag file in user home otherwise log to file
if [ -f ~/.bash_profile.debug ] ; then
  DEBUG=/dev/stderr
else
  DEBUG=~/.bash_profile.log
fi
echo "*DEBUG ON*" >${DEBUG}
echo `date` >>${DEBUG}

# get environment specifics
OS=`uname`
HOST=`hostname -s`
echo "${HOST} appears to be running ${OS}" >>${DEBUG}

case ${OS} in
Darwin)
  GREP=/usr/bin/grep
  ;;
Linux)
  GREP=/bin/grep
  PS1='\h:\W \u\$ '    # prefer OS X like prompt
  ;;
*)
  echo "*** Unknown OS, guessing at configuration ***"
  GREP=/bin/grep
  ;;
esac

## add home binary path if not already included
if ! echo ${PATH} | $GREP -q ${HOME}/bin && ! echo ${PATH} | ${GREP} -q ~/bin ; then
  echo "adding ~/bin to path" >>${DEBUG}
  PATH=${PATH}:~/bin
fi

## source bashrc and alias files for default, OS, and HOST configs
for pfx in .bashrc .aliases; do
    for sfx in "" .${OS} .${HOST}; do
	if [ -f ~/${pfx}${sfx} ] ; then
	    echo "sourcing ${pfx}${sfx}" >>${DEBUG}
	    source ~/${pfx}${sfx}
	fi
    done
done

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]  `date`\n$ '

# MacPorts Installer addition on 2011-12-01_at_11:52:34: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

