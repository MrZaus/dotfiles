# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
#alias la='ls -A'
alias l='ls -CF'
alias st='git status -uno'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi

fi


alias v=vim
alias agc='ag --cpp'
alias agn='ag -G "BUILD.gn"'
alias cat=bat
alias l='lsd -al --group-directories-first '

alias toast='powershell.exe -command New-BurntToastNotification'
alias fd='fdfind -Iip'
alias f='fg `jobs | fzf | cut -c 2`'
alias b='bat'
alias c='cat'
alias preview='fzf --preview="bat {} --color=always"'
alias sd='git diff --staged'
alias gd='git  diff'


bag(){
  CONTEXT=5
  local PATTERN="$@"
  while IFS=":" read -ra OUT
  do
    local FILE=${OUT[0]}
    local LINE=${OUT[1]}
    local RANGE_FROM=$(($LINE-$CONTEXT>0 ? $LINE-$CONTEXT : 0))
    local RANGE_TO=$(($LINE+$CONTEXT))
    echo `readlink -f $FILE`:$LINE
    bat $FILE --color=always --decorations always --style full --line-range $RANGE_FROM:$RANGE_TO
  done <<< $(ag -Q --cpp --vimgrep "$PATTERN") 
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi


HISTSIZE=100000
HISTFILESIZE=200000
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTCONTROL=ignoreboth
shopt -s cmdhist
shopt -s histappend

if [ -f ~/.dir_colors ]; then
  eval `dircolors ~/.dir_colors`
fi
export EXA_COLORS="uu=38;5;161:sn=31"
if [ -t 1 ]; then
  cd ~
fi

export EDITOR='vim'

#eval `ssh-agent` 
#ssh-add ~/.ssh/id_rsa


#_trueline_time_segment() {
#  local prompt_time="${TRUELINE_SYMBOLS[clock]} \t"
#  if [[ -n "$prompt_time" ]]; then
#    local fg_color="$1"
#    local bg_color="$2"
#    local font_style="$3"
#    local segment="$(_trueline_separator)"
#    segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " $prompt_time ")"
#    PS1+="$segment"
#    _last_color=$bg_color
#  fi
#}
TRUELINE_GIT_SHOW_STATUS_NUMBERS=true
#declare -a TRUELINE_SEGMENTS=(
#    'user'
#    'working_dir,mono,cursor_grey,normal'
#    'git,grey,special_grey,normal'
#    'newline,black,light_blue,bold'
#    'bg_jobs,mono,cursor_grey,normal'
#    'exit_status,mono,cursor_grey,normal'
#    'read_only,mono,cursor_grey,normal'
#)

#source ~/trueline/trueline.sh
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export BAT_THEME=GitHub
