#!bin/bash

#    ▖  ▖  ▜ ▜             
#    ▌▞▖▌▀▌▐ ▐ █▌▛▘        
#    ▛ ▝▌█▌▐▖▐▖▙▖▌         
#                          
#    ▗▄▖▜       ▄▖▄▖▖▖   ▄▖
#    ▌▄▐▐ ▀▌▛▘█▌▄▌▙▖▙▌  ▘▄▌
#    ▌▀▀▐▖█▌▌ ▙▖▄▌▄▌ ▌  ▖▄▌
#     ▀                                                                                    

#wallpaper dir
wallsDir="/usr/share/wallpapers/walls-catppuccin-mocha/"

rofiCmd="rofi -dmenu -theme ~/.config/rofi/waller.rasi"

# Select a picture with rofi
wallSelection=$(for wall in "$wallsDir"*; do echo -en "$wall\0icon\x1fthumbnail://$wall\n" ; done | $rofiCmd)

# Set the wallpaper
[[ -n "$wallSelection" ]] || exit 1

swww img ${wallSelection}

exit 0

