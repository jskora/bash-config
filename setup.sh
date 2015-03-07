#!/bin/bash
#------------------------------------------------------------
# Install bash profile and RC files from this project.
#------------------------------------------------------------

safe_copy () {
    SRC=$1
    DST=$2
    if [ -f ~/$2 ]; then
	cp -p ~/$2 ~/$2.orig
	echo "backup made ~/$2 => ~/$2.orig"
    fi
    cp $1 $2
}

safe_copy bash_profile ~/.bash_profile
safe_copy bashrc ~/.bashrc
safe_copy bashrc.Darwin ~/.bashrc.Darwin
safe_copy bashrc.Linux ~/.bashrc.Linux

safe_copy git-completion.sh ~/.git-completion.sh
safe_copy git-prompt.sh ~/.git-prompt.sh

#--------------------------------------------------

echo "$0 done"

#============================================================
# done
#============================================================
