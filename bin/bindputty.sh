# bindputty.sh
#
# Set keyboard bindings for a Mate terminal session
# so that Ctrl+Left and Ctrl+Right will move the
# cursor one word left or right on the command line.

#*************************************************
# FOR THIS TO WORK IT MUST BE sourced in a shell
#   $ source ~/bin/bindmate.sh
#*************************************************

bind '"\eOD":backward-word'
bind '"\eOC":forward-word'

