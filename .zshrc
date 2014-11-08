# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit


# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install


HISTFILE=~/.histfile
HISTSIZE=200000
SAVEHIST=20000
setopt share_history        # share history between multiply running zsh
setopt prompt_subst
setopt appendhistory autocd
setopt HIST_IGNORE_DUPS
setopt nobeep




### Solves the old Home, End keys not working properly problem.
###
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish  



#aliase

alias urxvt='urxvt -fg white -bg black +sb'

alias sai='sudo aptitude install'
alias sau='sudo aptitude update'
alias sas='sudo aptitude search'

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lg='ls -l|grep'

alias cp='cp -i'
alias mv='mv -i'
alias grep="grep --color=auto"
alias -g ...="../.."
alias make="ionice -c 3 nice make"

alias sudovi='sudoedit'
alias sv='sudoedit'

alias mplayer='mplayer -fs -zoom'

alias chromium-browser='chromium-browser  --password-store=gnome'

alias feh='feh -FZ -D5 -d'

export EDITOR=vi


export LESS_TERMCAP_mb=$'\E[01;31m' 
export LESS_TERMCAP_md=$'\E[01;31m' 
export LESS_TERMCAP_me=$'\E[0m' 
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;44;33m' 
export LESS_TERMCAP_ue=$'\E[0m' 
export LESS_TERMCAP_us=$'\E[01;32m' 

#search with up in history, very important !
bindkey "^[[A" history-beginning-search-backward            # [arrow-up]
bindkey "^[[B" history-beginning-search-forward      # [arrow-down]



autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"


setopt prompt_subst

if [ $SSH_CONNECTION ]; then SSH="%n@%m"; else SSH=""; fi


PROMPT='%(?..$PR_RED%?\

)%{$reset_color%}%(!.$PR_RED%SROOT%s$PR_GREEN@%B%m%b.)$PR_GREEN$SSH%#$PR_NO_COLOUR'

RPROMPT='%~'

# Jump to the most frecent directory with zd.
# zd 
_Z_CMD="zd"
. /home/alex/.zsh/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}



function start () {
	nohup $1  &> /dev/null  &
}

function __start() {
# todo: complete to all executables in path (not working )-:
# _arguments -- '*=EXECFILE:executable:_files' 
}

compdef __start start

export PATH="$HOME/DropboxPrivate/bin:$PATH"



