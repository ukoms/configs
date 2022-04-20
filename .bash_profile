export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

I_RED='\[\033[0;91m\]'
R_RED='\[\033[0;31m\]'
R_YELLOW='\[\033[0;33m\]'
R_GREEN='\[\033[0;32m\]'
R_CYAN='\[\033[0;36m\]'
RESET='\[\033[0m\]'

PS1="${R_GREEN}[${R_YELLOW}\t ${R_CYAN}\w${I_RED} \$(__git_ps1) ${R_GREEN}]:${RESET}"

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

alias cleanup="
sudo find . -name "*.DS_Store" -print;
sudo find . -name "*.DS_Store" -print;
sudo find . -name "*._DS_Store" -print;
sudo find . -name "._.DS_Store" -print;
sudo find . -name ".DS_Store" -print;
sudo find . -name "Thumbs.db" -print;
sudo find . -name "._.*" -print;
sudo find . -name "._*" -print ;
sudo find . -name "*.DS_Store" -delete;
sudo find . -name "*.DS_Store" -delete;
sudo find . -name "*._DS_Store" -delete;
sudo find . -name "._.DS_Store" -delete;
sudo find . -name ".DS_Store" -delete;
sudo find . -name "Thumbs.db" -delete;
sudo find . -name "._.*" -delete;
sudo find . -name "._*" -delete ;
"
alias lara-wipe="
composer dumpautoload;
php artisan cache:clear;
php artisan clear-compiled;
"