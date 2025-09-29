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

cacheDir=$HOME/.cache/waller
confDir=$HOME/.config/waller
conf=$confDir/waller.conf

if [ ! -d "$cacheDir" ]; then
	mkdir $cacheDir	
fi

if [ ! -d "$conf" ]; then
	if [ ! -d "$confDir" ]; then
		mkdir $confDir
	fi 
	echo blur=False > $confDir/waller.conf
fi

. $confDir/waller.conf


# Select a picture with rofi
wallSelection=$(for wall in "$wallsDir"*; do echo -en "$wall\0icon\x1fthumbnail://$wall\n" ; done | $rofiCmd)

# Set the wallpaper
[[ -n "$wallSelection" ]] || exit 1

if [ ! $blur ]; then
	swww img ${wallSelection}
	exit 0	
fi

wallName=$(basename "${wallSelection}")

magick ${wallSelection} -scale 50% -blur 0x4 -resize 200% "${cacheDir}/blurred_${wallName}" 

swww img "${cacheDir}/blurred_${wallName}"

exit 0
