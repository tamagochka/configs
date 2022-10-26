
#[[ $TERM != "screen" ]] && (tmux attach-session || tmux new-session)
if [[ $TERM != "screen" ]]; then
	tmux has-session
	if [[ $? -ne 0 ]]; then
		tmux new-session
	else
		tmux attach-session
	fi
fi

screenfetch

# colorizing ls and autocomplete
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

# prompt settings
autoload -U colors && colors
PROMPT="%{$reset_color%}[%{$fg[red]%}%*%{$reset_color%}]%{$fg[blue]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}%#>%{$reset_color%} "
RPROMPT="%{$reset_color%}% %(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%}"                                  # правое приглашение


autoload -U zcalc # calculator
alias calc='zcalc -f'

# ctrl+z stops on a directory separator "/" or "-"
autoload -U select-word-style
select-word-style bash



# autocomplete
autoload -U compinit promptinit
compinit && promptinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
zstyle ':completion:*:functions' ignored-patterns '_*'


# kill autocomplete
#zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
zstyle ':completion:*:processes' command 'ps aux'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'



# host names autocomplete
hosts=(${${${(f)"$(<$HOME/.ssh/known_hosts)"}%%\ *}%%,*})
zstyle ':completion:*:hosts' hosts $hosts



setopt extendedglob                         # search for ls **/*.txt
setopt completealiases                      # aliaces autocomplete
setopt autocd                               # do not enter cd command
setopt correctall                           # correct typos
setopt appendhistory                        # do not overvrite history file
setopt sharehistory                         # common history for all terminals
setopt incappendhistory                     # immidiatly write history to file
setopt histignoredups                       # no dubles
setopt histignorespace                      # do not write first space symbol command to history
#setopt histfindnodups                      # no dubles search
setopt nobeep                               # do not beep
#setopt autolist                            # automatically list choices on an ambiguous completion




HISTFILE=~/.zsh_history                     # history file
HISTSIZE=100000                             # one terminal history size
SAVEHIST=100000                             # history size in history file

# alt+w delete line to directory separator
#function backward-kill-to-slash() {
#    local WORDCHARS="${WORDCHARS:s,/,} \\\'"
#    [[ $BUFFER != */* ]] && return
#    [[ $BUFFER == [^/]##/ ]] && return
#
#    zle backward-kill-word
#}
#zle -N backward-kill-to-slash
#bindkey "^[w" backward-kill-to-slash           # Alt+w

# Ctrl+v - show key code
# bindkey - list all binded keys
# source ~/.zshrc - reread config zsh

bindkey "[1~" beginning-of-line               # Home
bindkey "[4~" end-of-line                     # End
bindkey "^[OA" up-line-or-search                # Up-arrow
bindkey "^[OB" down-line-or-search              # Down-arrow
bindkey "OC" forward-char                     # Left-arrow
bindkey "OD" backward-char                    # Right-arrow
bindkey "[3~" delete-char                     # Delete
bindkey "" backward-delete-char               # Breakspace
bindkey "[2~" overwrite-mode                  # Insert
bindkey "[Z" expand-or-complete
bindkey "^[[5~" beginning-of-buffer-or-history  # PgUp
bindkey "^[[6~" end-of-buffer-or-history        # PgDown



# colorized grep
export GREP_COLOR="1;32"
alias grep='grep -i --color=always'
# colorized ls in LS_COLORS
alias ls='ls --color=always --group-directories-first -hF'

# /usr/share/grc
# /etc/grc.conf
if [ -f /usr/bin/grc ]; then # if grc have
    alias configure="grc --colour=auto configure"
    alias cvs="grc --colour=auto cvs"
    alias diff="grc --colour=auto diff"
    alias df="grc --colour=auto df"
    alias dig="grc --colour=auto dig"
    alias gcc="grc --colour=auto gcc"
    alias ifconfig="grc --colour=auto ifconfig"
    alias mount="grc --colour=auto mount"
    alias mtr="grc --colour=auto mtr"
    alias netstat="grc --colour=auto netstat"
    alias php="grc --colour=auto php"
    alias ping="grc --colour=auto ping"
    alias ps="grc --colour=auto ps"
    alias traceroute="grc --colour=auto traceroute"
    alias wdiff="grc --colour=auto wdiff"
fi

# open mime types
alias -s {jpeg,png,jpg}=photoqt
alias -s {html,htm,mht}=firefox
alias -s {avi,mpeg,mpg,mov,m2v,mkv}=vlc
alias -s {odt,doc,docx,xls,xlsx,sxw,rtf}=libreoffice



alias df='df -h'
alias du='du -h'
alias rm='rm -i' # remove confirmation
alias mv='mv -i'
alias less='less -RM' # less colorize

