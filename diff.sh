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
# Compare existing bash profile and RC files from this project.

VERBOSE="false"
COLORIZE="false"

while getopts ":chv" opt; do
    case $opt in
        c)
            COLORIZE="true"
            ;;
        v)
            VERBOSE="true"
            ;;
        h)
            echo "$0 - show differences between workspace and deployment locations."
            echo "usage: $0 [-v] [-h]"
            echo "   -c - color   - Highlight output with color."
            echo "   -h - help    - Show this help message."
            echo "   -v - verbose - Verbose output of matches and differences."
            exit 0
            ;;
    esac
done

RED=""
GREEN=""
YELLOW=""
RESET=""

if [ "$COLORIZE" == "true" ]; then
    RED="$(tput setaf 1; tput bold)"
    GREEN="$(tput setaf 2; tput bold)"
    YELLOW="$(tput setaf 3; tput bold)"
    BLUE="$(tput setaf 4; tput bold)"
    RESET="$(tput sgr0)"
fi

safe_diff () {
    SRC=$1
    DST=$2
    if [ -f ${DST} ]; then
        TMP=$(diff ${SRC} ${DST})
        if [ -n "$TMP" ]; then
            echo "----------------------------------------"
            echo "${GREEN}${DST} ${YELLOW}MISMATCH${RESET}"
            echo "----------------------------------------"
            echo "${TMP}${RESET}"
        else
            if [ "$VERBOSE" == "true" ]; then
                echo "----------------------------------------"
                echo "${GREEN}$DST ${BLUE}OK${RESET}"
            fi
        fi
    else
        echo "----------------------------------------"
        echo "${RED}${DST} MISSING${RESET}"
    fi
}

safe_diff bash_profile          ~/.bash_profile
safe_diff bashrc                ~/.bashrc
safe_diff bashrc.Darwin         ~/.bashrc.Darwin
safe_diff bashrc.Linux          ~/.bashrc.Linux
safe_diff bashrc.NetBSD         ~/.bashrc.NetBSD

safe_diff gitconfig             ~/.gitconfig
safe_diff git-completion.sh     ~/.git-completion.sh
safe_diff git-prompt.sh         ~/.git-prompt.sh

safe_diff bin/setjava.sh        ~/bin/setjava.sh
safe_diff bin/bindputty.sh      ~/bin/bindputty.sh
safe_diff bin/bindmate.sh       ~/bin/bindmate.sh

safe_diff java-7.cfg            ~/.java-7.cfg
safe_diff java-JDK1.7.0_80.cfg  ~/.java-JDK1.7.0_80.cfg
safe_diff java-8.cfg            ~/.java-8.cfg
safe_diff java-JDK1.8.0_77.cfg  ~/.java-JDK1.8.0_77.cfg

safe_diff htoprc                ~/.config/htop/htoprc
safe_diff pythonrc              ~/.pythonrc
safe_diff tmux.conf             ~/.tmux.conf
safe_diff vimrc                 ~/.vimrc

#--------------------------------------------------

echo "$0 done"

#============================================================
# done
#============================================================
