# bashrc - general
#============================================================

# Log to file if debug file exists or debug variable is set.
#------------------------------------------------------------
if [ -f ~/.bashrc.debug -o "${BASH_DEBUG:-NO}" == "YES" ] ; then
  export BASH_DEBUG=YES
else
  export BASH_DEBUG=NO
  export BASH_LOGFILE=~/.bash_profile.log
fi
BASH_LOG() {
  if [ "${BASH_DEBUG}" == "YES" ]; then
    echo "$1" >> ${BASH_LOGFILE}
  fi
}
BASH_LOG "*DEBUG ON*"
BASH_LOG `date`

# Determine operating system and host identities
#------------------------------------------------------------
OS=`uname`
HOST=`hostname -s`
BASH_LOG "${HOST} appears to be running ${OS}"
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

# add home binary path if not already included
#------------------------------------------------------------
if ! echo ${PATH} | $GREP -q ${HOME}/bin && ! echo ${PATH} | ${GREP} -q ~/bin ; then
  BASH_LOG "adding ~/bin to path"
  PATH=${PATH}:~/bin
fi

# setup git completion if scripts exist
#------------------------------------------------------------
if [ -f ~/.git-completion.sh ] ; then
  source ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ] ; then
  source ~/.git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\n$ '
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]  `date`\n$ '
fi

# source bashrc existing files for OS, and HOST
#------------------------------------------------------------
for sfx in .${OS} .${HOST}; do
    if [ -f ~/.bashrc${sfx} ] ; then
        BASH_LOG "sourcing .bashrc${sfx}"
        #echo "sourcing .bashrc${sfx}"
        source ~/.bashrc${sfx}
    fi
done


