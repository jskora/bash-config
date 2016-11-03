#!/bin/bash
#------------------------------------------------------------
# Compare existing bash profile and RC files from this project.
#------------------------------------------------------------

safe_diff () {
    SRC=$1
    DST=$2
    echo "${DST}"
    echo "----------------------------------------"
    if [ -f ${DST} ]; then
        diff ${SRC} ${DST}
    else
        echo "does not exist: ${DST}"
    fi
    echo ""
}

safe_diff bash_profile      ~/.bash_profile
safe_diff bashrc            ~/.bashrc
safe_diff bashrc.Darwin     ~/.bashrc.Darwin
safe_diff bashrc.Linux      ~/.bashrc.Linux

safe_diff git-completion.sh ~/.git-completion.sh
safe_diff git-prompt.sh     ~/.git-prompt.sh

safe_diff bin/setjava.sh    ~/bin/setjava.sh

safe_diff htoprc            ~/.config/htop/htoprc

safe_diff pythonrc          ~/.pythonrc

safe_diff gitconfig         ~/.gitconfig

safe_diff tmux.conf         ~/.tmux.conf

#--------------------------------------------------

echo "$0 done"

#============================================================
# done
#============================================================
