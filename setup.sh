#!/bin/bash
#--------------------------------------------------------------------------------
#  Copyright 2016 Joseph Skora
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#--------------------------------------------------------------------------------
#
# Install bash profile and RC files from this project.

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
safe_copy java-7.cfg            ~/.java-7.cfg
safe_copy java-JDK1.7.0_80.cfg  ~/.java-JDK1.7.0_80.cfg
safe_copy java-8.cfg            ~/.java-8.cfg
safe_copy java-JDK1.8.0_77.cfg  ~/.java-JDK1.8.0_77.cfg

mkdir -p ~/.config/htop
safe_copy htoprc            ~/.config/htop/htoprc

safe_copy pythonrc          ~/.pythonrc

safe_copy gitconfig         ~/.gitconfig

safe_copy tmux.conf         ~/.tmux.conf

safe_copy vimrc             ~/.vimrc

#--------------------------------------------------

echo "$0 done"

#============================================================
# done
#============================================================
