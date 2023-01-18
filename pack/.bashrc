#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

#ics-pa
export NEMU_HOME=/home/rat/study/labs/system-basic/ics-pa/nemu
export AM_HOME=/home/rat/study/labs/system-basic/ics-pa/abstract-machine
