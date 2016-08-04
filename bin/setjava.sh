#!/bin/bash

#------------------------------------------------------------
# Switch between JDK versions
#------------------------------------------------------------

# Configure these based on local system.
#------------------------------------------------------------
JAVA7BASE=/opt/jdk1.7.0_80
JAVA8BASE=/opt/jdk1.8.0_77
JAVA9BASE=/opt/jdk-9

# Get JDK version parameter
#------------------------------------------------------------
TGTVER=NA
SILENT=false
while [ "$1" != "" ]; do
    if [ "$1" == "s" ]; then
        SILENT=true
    elif [ "$1" = "7" -o "$1" = "8" -o "$1" = "9" ]; then 
        TGTVER=$1
    else
        echo "--------------------------------------------------"
        echo "Unknown argument $1, aborting"
        echo "--------------------------------------------------"
        exit 1
    fi
    shift 1
done

# Verify script was sourced if change Java version.
#------------------------------------------------------------
BASH_SOURCE0=${BASH_SOURCE[0]}
SOURCED=no
if [ "${BASH_SOURCE[0]}" != "$0" ]; then
    SOURCED=yes
fi
if [ "${TGTVER}" != "NA" -a "${SOURCED}" == "no" ]; then
    if [ "$SILENT" != "true" ]; then
        echo "--------------------------------------------------"
        echo "This script must be sourced to work with either"
        echo "    \$ source $(basename $0)"
        echo "or"
        echo "    \$ . $(basename $0)"
        echo "--------------------------------------------------"
    fi
    exit -1
fi

# Create path with Java removed and build new paths based on
# the requested Java version.
#------------------------------------------------------------
NOJAVA_PATH=$(echo $PATH | sed "s#\(:\|^\)[^:]*/jdk1.[78][^:]*\(:\|\$\)#:#g")
if [ "${TGTVER}" == "7" ]; then
    export JAVA_HOME=${JAVA7BASE}
    export PATH=$JAVA_HOME/bin:$NOJAVA_PATH
    export MAVEN_OPTS="-Xms1024m -Xmx3076m -XX:MaxPermSize=256m"
fi

if [ "${TGTVER}" == "8" ]; then
    export JAVA_HOME=${JAVA8BASE}
    export PATH=$JAVA_HOME/bin:$NOJAVA_PATH
    export MAVEN_OPTS="-Xms1024m -Xmx3076m"
fi

if [ "${TGTVER}" == "9" ]; then
    export JAVA_HOME=${JAVA9BASE}
    export PATH=$JAVA_HOME/bin:$NOJAVA_PATH
    export MAVEN_OPTS="-Xms1024m -Xmx3076m"
fi

# Notify user of what was done.
#------------------------------------------------------------
if [ "$SILENT" != "true" ]; then
    if [ "${TGTVER}" != "NA" ]; then
        echo "Java switched to ${JAVA_HOME}"
    fi
    
    echo "Java path and Maven options"
    echo "---------------------------"
    echo "JAVA_HOME=$JAVA_HOME"
    echo "PATH=$PATH" | grep -P --color=auto "(:|=)[^:]*/jdk[^:]*(:|$)"
    echo "MAVEN_OPTS=${MAVEN_OPTS}" | grep -P --color=auto "(?<==).*$"
fi

#------------------------------------------------------------
# end
#------------------------------------------------------------
