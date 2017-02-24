bash-config
===========

Bash configuration scripts for interactive and non-interactive shell startup.  Supports
startup operating system and host specific environments.

The bash startup sequence on login is:                                                 
  1. Execute /etc/profile                                                             
  2. Execute the first file found of                                                  
       ~/.bash_profile -or- ~/.bash_login -or- ~/.profile                             

The behaviors included here are:
  1. bash_profile with run bash_rc
  2. bash_rc will bash_rc.OS and bash_rc.HOSTNAME

Installation
------------

These files can be installed automatically with the setup.sh script.  It automatically backs up files that it is replacing.

    $ ./setup.sh

Differences between these files and the current system configuration can be found using the diff.sh script.

    $ ./diff.sh
    
Reference
---------

From "man bash"

> When bash is invoked as an interactive login shell,  or  as  a  non-interactive
> shell  with  the  --login option, it first reads and executes commands from the
> file /etc/profile, if that file exists.  After reading that file, it looks  for
> ~/.bash_profile,  ~/.bash_login,  and  ~/.profile, in that order, and reads and
> executes commands from the first one that exists and is readable.  The --nopro‐file
> option may be used when the shell is started to inhibit this behavior.
>
> When  a  login  shell  exits,  bash  reads  and executes commands from the file
> ~/.bash_logout, if it exists.
>
> When an interactive shell that is not a login shell is started, bash reads  and
> executes  commands  from  /etc/bash.bashrc and ~/.bashrc, if these files exist.
> This may be inhibited by using the --norc option.   The  --rcfile  file  option
> will   force   bash   to  read  and  execute  commands  from  file  instead  of
> /etc/bash.bashrc and ~/.bashrc.
