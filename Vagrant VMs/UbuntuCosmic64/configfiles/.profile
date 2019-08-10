# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# colors
red="\e[0;1;31m"
orange="\e[0;38;5;172m"
yellow="\e[0;1;33m"
green="\e[0;1;32m"
cyan="\e[0;1;36m"
magenta="\e[0;1;35m"
white="\e[0;97m"
reset="\e[0m"

# HAS CAUSED ISSUES, SO WILL BE DISABLED FOR THE TIME BEING
# reset the colors after my command
# trap 'echo -n -e "$reset"' DEBUG

# '\u' adds the name of the current user to the prompt
# '\H' adds the full hostname to the prompt
# '\w' adds the name of the current directory
# '\$(date +%d.%m.%Y) \A' adds the date and time in the Format DD.MM.YYYY HH:MM
export PS1="\[$red\]\u\[$orange\]@\[$yellow\]\H \[$green\]\w \[$cyan\]\$(date +%d.%m.%Y) \A
\[$reset\]$ "

alias l="ls -laF"
alias ..="cd .."
alias ags='for i in */; do echo -------$i---------;cd "$i"; git status; cd ..; done'