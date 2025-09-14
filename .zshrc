# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:~/.cargo/bin:/home/$USER/.local/bin:$PATH:/opt/brew/bin:$HOME/go/bin

export ZSH="/home/$USER/.oh-my-zsh"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

export "MICRO_TRUECOLOR=1"

if [[ $UID -eq 0 ]]; then
  HISTFILE="${HISTFILE%_history}_root_history"
fi


# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git wd rust zoxide fzf zsh-autosuggestions eza archlinux gitfast kitty)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export PAGER='most'

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
#unsetopt SHARE_HISTORY
setopt SHARE_HISTORY

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Make micro the default editor

export EDITOR='micro -clipboard external'
export VISUAL='micro -clipboard external'


LESSOPEN="|/sbin/batpipe %s";
export LESSOPEN;
unset LESSCLOSE;

# The following will enable colors when using batpipe with less:
LESS="$LESS -R";
BATPIPE="color";
export LESS;
export BATPIPE;


### ALIASES ###

#micro
alias n='nano'
alias m='micro -clipboard external'

#list
alias eza='eza --icons always --color auto '
alias ls='eza'
alias la='eza -AF'
alias laa='eza -aF'
alias ll='eza -alF auto'
alias l='eza -F'
alias listdir="eza -Fd */ > list"

#bat-extras
alias man='batman'
alias grep='batgrep'

#paru wrapper
alias pz='paruz'

# ctrl-b to open the fzf browser
bindkey ${FZF_WD_BINDKEY:-'^B'} wd_browse_widget

#zoxide
alias cd='z'

#paru
alias p='paru'
alias cargoupdate='echo "\n\033[0;35m:: \033[1;37mupdating crates...\n\033[0;01m" && cargo install-update --all'
alias pc='p && cargoupdate'

#oneshot
alias oneshot='doas /src/OneShot-C/oneshot -i wlp1s0 -K'

#yazi file manager
alias x='yazi'

#doas
alias doas='doas '
alias sudo='sudo '

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias sl='ls'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#clear terminal
alias cl='clear'
alias lc='clear'

#cd using xplr
alias xcd=̈́'cd "$(xplr --print-pwd-as-result)"'

#display images in terminal (kitty)
alias icat='kitty +kitten icat'

#launch nvim with file selection using xplr
alias nv='nvim $(xplr)'

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias fixgrub="/usr/local/bin/arcolinux-fix-grub"

crab-fetch

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
