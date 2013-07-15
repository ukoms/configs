####### ALIASES ######

# quick ack search
alias a='ack -i -Q -H -A 10 -B 5 --color-filename=red --color-match=green'

# fast edit .bash_profile
alias bpe=bash_profile_edit

# reset .bash_profile - after modifications
alias bpr=bash_profile_reload

# clear screen
alias c=clear

# syncing config files
alias cfs=config_syncer

# go to working directory and display content
alias dg=directory_go

# run file in editor
alias fe=file_edit

# more useful grep
alias grep='grep -rnE --color'

# too much for typing ;)
alias h='cd'

# list files in one column (+ . beginning files)
alias l='ls -1 -a'

# make direcotries with autovivification
alias mkdir='mkdir -pv'

###### SAFETY ALIASES ######

# copy file
alias cp='cp -i'

# move file
alias mv='mv -i'

# remove file
alias rm='rm -i'

###### GIT ALIASES #######

# main git alias
alias g='git'

# add unstaged files to stage (prepare to commit)
alias gadd="git add"

# show local branches
alias gbr='git branch'

# simple commit with message
alias gc='git commit -m'

# add file to stage, commit and push to origin master
alias gcm=git_commit

# switch to branch
alias gco='git checkout'

# show diff of unstaged files
alias gdu='git diff'

# show diff of staged files
alias gds='git diff --staged'

# pretty log with YYYY-MM-DD HH:MM:SS date format
alias glog="git log --date=iso --pretty=format:'%C(green)%h%Creset %C(cyan)%ad%x08%x08%x08%x08%x08%Creset %s %C(green)[%Creset%C(cyan)%an%Creset%C(green)]%Creset'"

# send changes to somewhere
alias gp='git push'

# send commited changes directly to origin branch repo
alias gpoc='git push origin `git current-branch`'

# send localt master to origin (think before doing)
alias gpom='git push origin master'

# sync local master
alias gpuf='git pull --ff'

# show branches on remote repo
alias grso='git remote show origin'

# full status
alias gs='git status'

# shortened status
alias gss='git status -s'

# update branch with origin master
alias gsync="git merge origin/master"

# unstage files (remove from commiting)
alias guns='git reset HEAD --'

# commit step by step - what to commit, change by change
alias gvii='git commit -v --patch'

###### OTHER SETTINGS, STUFF AND SILVA RERUM ######

# colors for prompt
# Reset
RESET='\[\033[0m\]'

# Regular
R_BLACK='\[\033[0;30m\]'
R_RED='\[\033[0;31m\]'
R_GREEN='\[\033[0;32m\]'
R_YELLOW='\[\033[0;33m\]'
R_BLUE='\[\033[0;34m\]'
R_PURPLE='\[\033[0;35m\]'
R_CYAN='\[\033[0;36m\]'
R_WHITE='\[\033[0;37m\]'

# Bold
B_BLACK='\[\033[1;30m\]'
B_RED='\[\033[1;31m\]'
B_GREEN='\[\033[1;32m\]'
B_YELLOW='\[\033[1;33m\]'
B_BLUE='\[\033[1;34m\]'
B_PURPLE='\[\033[1;35m\]'
B_CYAN='\[\033[1;36m\]'
B_WHITE='\[\033[1;37m\]'

# High Intensity
I_BLACK='\[\033[0;90m\]'
I_RED='\[\033[0;91m\]'
I_GREEN='\[\033[0;92m\]'
I_YELLOW='\[\033[0;93m\]'
I_BLUE='\[\033[0;94m\]'
I_PURPLE='\[\033[0;95m\]'
I_CYAN='\[\033[0;96m\]'
I_WHITE='\[\033[0;97m\]'

# prompt with git actual branch name
# install:
# 1. curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
# 2. import below
source ~/.git-prompt.sh
PS1="${R_GREEN}[${R_YELLOW}\t  ${R_GREEN}\w${I_RED} \$(__git_ps1)${R_GREEN}]:${RESET}"

# git autocomplete
# install:
# 1. curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
# 2. chmod -X ~/.git-completion.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

####### HELP FUNCTIONS #######

# @function print_help
# @descr
#   Main function for printing help for aliases functions and others
# @input
#   * 0: (STRING) which help to print
# @output
#   * 0: (STRING) help content

print_help(){
    case "$1" in
        file_edit)
            echo "fe - alias for mc -e";
            echo "using: fe DIRECTORY/FILE";
            echo "fe.: fe public_html/hidden/home";
        ;;
        directory_go)
            echo "dg - directory_go - shortcut to working directory";
            echo "first go to home, then going to given directory and finally - display directory content";
            echo "using: dg DIR";
            echo "fe.: dg working/directory/my_project";
        ;;
        config_syncer)
            echo "cfs - configsyncer - shortcut to syncing .gitconfig & .bash_profile in sublime working directory";
            echo "cfs codosu - console do sublime";
            echo "cfs sudoco - sublime do console";
        ;;
        *)
            echo "something messed up - no help specified";
       ;;
    esac
}

####### ALIASES FOR FUNCTIONS AND OTHER STUFF #######

# @function bash_profile_edit
# @descr
#   Edit .bash_profile in editor
# @input
#   None
# @output
#   None

bash_profile_edit(){
    case "$1" in
        -h*|--help*)
            print_help bash_profile_edit
        ;;
        *)
            fe ~/.bash_profile
        ;;
    esac
}

# @function bash_profile_reload
# @descr
#   Reload .bash_profile after making amendments in it.
# @input
#   None
# @output
#   None

bash_profile_reload(){
    case "$1" in
        -h*|--help*)
            print_help bash_profile_reload
        ;;
        *)
            source ~/.bash_profile
        ;;
    esac
}

# @function config_syncer
# @descr
#   Syncing config files between their default directories and editable space
# @input
#   * 0: (STRING) sync from where to where
#       ** "codosu" - console to sublime
#       ** "sudoco" - sublime to console
# @output
#   None

config_syncer()
{
    case "$1" in
        -h*|--help*)
            print_help config_syncer
        ;;
        codosu)
            cp -b -i -v ~/.gitconfig ~/public_html/s/.gitconfig
            cp -b -i -v ~/.bash_profile ~/public_html/s/.bash_profile
        ;;
        sudoco)
            cp -b -i -v ~/public_html/s/.gitconfig ~/.gitconfig
            cp -b -i -v ~/public_html/s/.bash_profile ~/.bash_profile
        ;;
        *)
            echo "Wrong arg, reptile!";
            echo "$1 - this is not corret";
            echo "type --help if you forgot what you should pass";
        ;;
    esac
}

# @function directory_go
# @descr
#   Shortcut to going into working directory and listing it content
# @input
#   * 0: (STRING) path to working directory
# @output
#   Brak

directory_go(){
    case "$1" in
        -h*|--help*)
            print_help directory_go
        ;;
        *)
            h
            cd public_html/$1
            l
        ;;
    esac
}

# @function file_edit
# @descr
#   Run midnight commander editora
# @input
#   * 0: (STRING) file to edit
# @output
#   None

file_edit(){
    case "$1" in
        -h*|--help*)
            print_help file_edit
        ;;
        *)
            mcedit $1
        ;;
    esac
}

# @function git_commit
# @descr
#   Speed up git file commiting
# @input
#   * 0: (STRING) file to commit
#   * 1: (STRING) commit message
# @output
#   None

git_commit(){
    case "$1" in
        -h*|--help*)
            print_help git_commit
        ;;
        *)
            ga $1
            gc $2
            gpoc
        ;;
    esac
}