#!/bin/bash

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

if [ 1 == 0 ]; then
for fgbg in 38 48 ; do #Foreground/Background
    for color in {0..256} ; do #Colors
        #Display the color
        echo -en "\e[${fgbg};5;${color}m ${color}\t\e[0m"
        #Display 10 colors per lines
        if [ $((($color + 1) % 10)) == 0 ] ; then
            echo #New line
        fi
    done
    echo #New line
done
fi
for myfg in 38; do
    for color in {0..256} ; do #Colors
        #Display the color
        echo -en "\e[${myfg};5;${color};48;5;234m ${color}\t\e[0m"
        #Display 10 colors per lines
        if [ $((($color + 1) % 10)) == 0 ] ; then
            echo #New line
        fi
    done
    echo #New line
done
for mybg in 48; do
    for color in {0..256} ; do #Colors
        #Display the color
        echo -en "\e[${mybg};5;${color};38;5;255m ${color}\t\e[0m"
        #Display 10 colors per lines
        if [ $((($color + 1) % 10)) == 0 ] ; then
            echo #New line
        fi
    done
    echo #New line
done
