#!bin/bash

#    ▖  ▖  ▜ ▜             
#    ▌▞▖▌▀▌▐ ▐ █▌▛▘        
#    ▛ ▝▌█▌▐▖▐▖▙▖▌         
#                          
#    ▗▄▖▜       ▄▖▄▖▖▖   ▄▖
#    ▌▄▐▐ ▀▌▛▘█▌▄▌▙▖▙▌  ▘▄▌
#    ▌▀▀▐▖█▌▌ ▙▖▄▌▄▌ ▌  ▖▄▌
#     ▀                                                                                    

rofiCmd="rofi -dmenu -theme ~/.config/rofi/waller.rasi"

cacheDir=$HOME/.cache/waller
confDir=$HOME/.config/waller
conf=$confDir/waller.conf

if [ ! -d "$cacheDir" ]; then
	mkdir $cacheDir	
fi

if [ ! -f "$conf" ]; then
	if [ ! -d "$confDir" ]; then
		mkdir $confDir
	fi 
	printf '# enable/disable blur (true/false) \nblur=false \n\n# path to wallpaper directory \n#wallsDir="/usr/share/wallpapers/" \n\n# use soft blur (true/false) \nsoftBlur=true' > $confDir/waller.conf
fi

. $confDir/waller.conf


# Select a picture with rofi
wallSelection=$(for wall in "$wallsDir"*; do echo -en "$wall\0icon\x1fthumbnail://$wall\n" ; done | $rofiCmd)

# Set the wallpaper
[[ -n "$wallSelection" ]] || exit 1

if ! $blur; then
	swww img ${wallSelection}
	exit 0	
fi

blurLvl="0x4"

if ! $softBlur; then
	blurLvl="0x8"
fi

wallName=$(basename "${wallSelection}")

magick ${wallSelection} -scale 50% -blur "${blurLvl}" -resize 200% "${cacheDir}/blurred_${wallName}" 

swww img "${cacheDir}/blurred_${wallName}"

exit 0
