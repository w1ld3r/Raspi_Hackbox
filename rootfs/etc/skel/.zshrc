# Set up the prompt

source <(antibody init)

antibody bundle < ~/.config/zsh/zsh-plugins

# completion {{{
#
# colors used by ls command
LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.sh=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.dot=31:*.dotx=31:*.xls=31:*.xlsx=31:*.ppt=31:*.pptx=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:'
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
# }}}

# history {{{
setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.zsh_history

## Options usefull for history
# remove older duplicate entries from history
setopt hist_ignore_all_dups
# remove superfluous blanks from history items
setopt hist_reduce_blanks
# save history entries as soon as they are entered
setopt inc_append_history
# share history between different instances of the shell
setopt share_history
#
# }}}

# cd Change directory just by tiping directory if no command exist
setopt auto_cd
# time before notification
zstyle ':notify:*' command-complete-timeout 120

## Completion options {{{
#autoload -Uz compinit
#compinit
# setting to add zsh-completions to the completion engine
#fpath=(~/.config/zsh/zsh-completions/src $fpath)

# automatically list choices on ambiguous completion
#setopt auto_list
# automatically use menu completion
#setopt auto_menu
# move cursor to end if word had one match
#setopt always_to_end

# Use modern completion system
#autoload -Uz compinit
#compinit

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#}}}

# theme {{{
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Theme for the prompt: powerlevel10k
# https://github.com/romkatv/powerlevel10k/#installation
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
#
# }}}

# alias {{{
# colored grep
alias grep="grep --color=auto"

#confirm before overwriting something
alias cp="cp -i"

# Changing "ls" to "exa"
alias ls='eza --icons --color=always --group-directories-first' # my preferred listing
alias l='eza --icons -la -t modified --color=always --group-directories-first --sort newest'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing

#colored ip command
alias ip='ip -c'

# the new top
alias top='bashtop'
# }}}

# export {{{
export PATH=$PATH:~/.local/bin/
export PYTHONSTARTUP=~/.pythonrc

# options for go
export GOROOT=/usr/local/go
export GOPATH=$HOME/.go/projects/
export CARGOPATH=$HOME/.cargo
export PATH=$GOPATH/bin:$GOROOT/bin:$CARGOPATH/bin:$PATH
export GO111MODULE=on

# nvim directory export
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# option to set neovim as default editor of the user
export EDITOR=/usr/bin/vim

# option to let the man command use vim to read man content
# this command is possible because of the vim plugin: https://github.com/lambdalisue/vim-manpager
#export MANPAGER="vim -c MANPAGER -"

# option let any program that use a pager, use vim as it pager
#export PAGER="vim -c MANPAGER -"

# option for beter flatpak integration, let plasma find flatpak app in specified folders
#export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share
#export XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:/home/op1um/.local/share/flatpak/exports/share

alias vimdiff="nvim -d"
# }}}

# Welcome message {{{
#echo H4CK3R OS |figlet -f slant | lolcat
fastfetch # --ascii "$(cat ~/.fastfetch_logo)" # custom ascii logo fastfetch
# }}}
#

fpath+=${ZDOTDIR:-~}/.zsh_functions

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
