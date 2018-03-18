#!/bin/bash

alias vi='vim'
alias h="history | grep "
alias f="find . | grep "
alias p="ps ax |grep "
alias py="python"
alias fucking="sudo "
alias rmk="rm -rf "
alias ll='ls -alF'
alias la='ls -A'
alias l='ls'
alias up='cd ..'
alias bundle='cd ~/.vim/bundle/'

function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd "${new_directory}" && ls
}
