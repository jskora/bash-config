#!/bin/bash

#------------------------------------------------------------
# Switch between JDK versions
#------------------------------------------------------------
# Configuration scripts should be in user home directory.
#------------------------------------------------------------

# Scan options and arguments
#------------------------------------------------------------
TGTSCR=NA
SILENT=false
while getopts sm: opt; do
    case $opt in
        s)
            SILENT=true
            ;;
        *)
            echo "Unexpected option '-$opt'"
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))"
ARG1=$1
if [ -f ~/.java-${ARG1}.cfg ]; then
    TGTSCR=~/.java-${ARG1}.cfg
elif [ "${ARG1}" != "" ]; then
    echo "--------------------------------------------------"
    echo "Unknown argument ${ARG1}, aborting"
    echo "--------------------------------------------------"
    exit 1
fi

# Verify script was sourced if change Java version.
#------------------------------------------------------------
BASH_SOURCE0=${BASH_SOURCE[0]}
SOURCED=no
if [ "${BASH_SOURCE[0]}" != "$0" ]; then
    SOURCED=yes
fi
if [ "${TGTSCR}" != "NA" -a "${SOURCED}" == "no" ]; then
    if [ "$SILENT" != "true" ]; then
        echo "--------------------------------------------------"
        echo "This script must be sourced to work with either"
        echo "    \$ source $(basename $0)"
        echo "or"
        echo "    \$ . $(basename $0)"
        echo "--------------------------------------------------"
    fi
    exit 1
fi

if [ "${TGTSCR}" != "NA" ]; then
    export NOJAVA_PATH=$(echo $PATH | sed "s#\(:\|^\)[^:]*/jdk1.[78][^:]*\(:\|\$\)#:#g")
    source ${TGTSCR}
fi

# Notify user of what was done.
#------------------------------------------------------------
if [ "$SILENT" != "true" ]; then
    if [ "${TGTSCR}" != "NA" ]; then
        echo "Java switched to ${JAVA_HOME}"
    fi
    
    echo "Java path and Maven options"
    echo "---------------------------"
    echo "JAVA_HOME=$JAVA_HOME"
    echo "PATH=$PATH" | grep --color=auto "[^:]*/jdk[^:]*"
    echo "MAVEN_OPTS=${MAVEN_OPTS}" | grep --color=auto "=.*$"
fi

#------------------------------------------------------------
# end
#------------------------------------------------------------
