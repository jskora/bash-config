#!/bin/bash
#------------------------------------------------------------
# Install bash profile and RC files from this project.
#------------------------------------------------------------

safe_copy () {
    SRC=$1
    DST=${HOME}/.$1
    if [ -f ${DST} ]; then
	cp -p ${DST} ${DST}.orig
	echo "backup made ${DST} => ${DST}.orig"
    fi
    cp ${SRC} ${DST}
    echo "installed ${SRC} as new ${DST}"
}

safe_copy bash_profile
safe_copy bashrc
safe_copy bashrc.Darwin
safe_copy bashrc.Linux

safe_copy git-completion.sh
safe_copy git-prompt.sh

#--------------------------------------------------

echo "$0 done"

#============================================================
# done
#============================================================
