# bindmate.sh
#
# Based on Mate desktop terminal behaviors.
#
# Set keyboard bindings for a Putty terminal session
# so that Ctrl+Left and Ctrl+Right will move the
# cursor one word left or right on the command line.

#*************************************************
# FOR THIS TO WORK IT MUST BE sourced in a shell
#   $ source ~/bin/bindmate.sh
#*************************************************

bind '"\e[1;5D":backward-word'
bind '"\e[1;5C":forward-word'

