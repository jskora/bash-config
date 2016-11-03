#!/bin/bash
#------------------------------------------------------------
# Install bash profile and RC files from this project.
#------------------------------------------------------------

safe_copy () {
    SRC=$1
    DST=$2
    if [ -f ${DST} ]; then
	    cp -p ${DST} ${DST}.orig
	    echo "backup made ${DST} => ${DST}.orig"
    fi
    cp ${SRC} ${DST}
    echo "installed ${SRC} as new ${DST}"
}

safe_copy bash_profile      ~/.bash_profile
safe_copy bashrc            ~/.bashrc
safe_copy bashrc.Darwin     ~/.bashrc.Darwin
safe_copy bashrc.Linux      ~/.bashrc.Linux

safe_copy git-completion.sh ~/.git-completion.sh
safe_copy git-prompt.sh     ~/.git-prompt.sh

mkdir -p ~/bin
safe_copy bin/setjava.sh    ~/bin/setjava.sh

mkdir -p ~/.config/htop
safe_copy htoprc            ~/.config/htop/htoprc

safe_copy pythonrc          ~/.pythonrc

safe_copy gitconfig         ~/.gitconfig

safe_copy tmux.conf         ~/.tmux.conf

#--------------------------------------------------

echo "$0 done"

#============================================================
# done
#============================================================
