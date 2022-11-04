##### GENERAL ##
alias bpe='sudo nano ~/.bash_profile'
alias bpr='source ~/.bash_profile
alias ls='gls -a1lGpFh --color --group-directories-first'
alias whatchmod='stat -f "%A %N"'
alias mkdir='mkdir -pv'

##### GIT ##
alias gadd='git add'
alias gadp='git add -p'
alias gadu='git add . -u && gds'
alias gbr='git branch'
alias gbrd='git branch -d'
alias gbre='git branch --edit-description'
alias gbrn='gco -b "$1" | gpsh -u origin "$1"'
alias gc='git commit'
alias gco='git checkout'
alias gcom='gco master'
alias gds='git diff --staged'
alias gdu='git diff'
alias gpoc="git push origin \$(git rev-parse --abbrev-ref HEAD)"
alias gpuf='git pull --ff'
alias gs='git status'
alias gsync="git merge origin/master"
alias guns='git reset HEAD --'

function git_set_tracking { BRANCH=$(git branch | sed -n '/\* /s///p'); git branch --set-upstream-to=origin/${BRANCH} ${BRANCH}; }
alias gset=git_set_tracking

##### HELPERS ##
function up { DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; ls; }
alias up=up

function go_to_dir { cd $1; ls; }
alias go=go_to_dir

##### CLEANERS ##
alias cls="clear"

