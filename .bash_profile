if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

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
alias ls='gls -a1lGpFh --color --group-directories-first'                                                    # show all files in vertical list
alias whatchmod='stat -f "%A %N"'
alias mkdir='mkdir -pv'                                              # create directories with autovivification

##### SAFETY ##
alias cp='sudo cp -i'                                                # ask before making file copy
alias mv='sudo mv -i'                                                # ask before moving file
alias rm='sudo rm -i'                                                # ask before removing file

##### GIT ##
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset' --abbrev-commit"
alias gadd='git add'                                                 # add unstaged files to stage (prepare to commit)
alias gadp='git add -p'                                              # choose which changes add to stage (prepare commit by patching)
alias gadu='git add . -u && gds'                                     # add to stage all untracked files (and show staged code diff after)

alias gbrd='git branch -d'                                          # delete local branch
alias gbre='git branch --edit-description'                          # edit description of the branch
alias gbrn='gco -b "$1" | gpsh -u origin "$1"'                      # create new branch
alias gc='git commit'                                               # commit with short message
alias gco='git checkout'                                            # checkout to/or something
alias gds='git diff --staged'                                       # show diff of staged files
alias gdu='git diff'                                                # show diff of unstaged files
alias gpoc="git push origin \$(git rev-parse --abbrev-ref HEAD)"    # send commited changes directly to origin branch repo
alias gpsh='git push'                                               # push to branch
alias gpuf='git pull --ff'                                          # sync local master
alias grso='git remote show origin'                                 # show branches on remote
alias gs='git status'                                               # full status
alias gss='git status -s'                                           # shortened status
alias gstat='git shortlog -s -n --all'                              # commit statistics
alias gsync="git merge origin/master"                               # update branch with origin master
alias guns='git reset HEAD --'                                      # unstage files (remove from commiting)

##### HELPERS ##
function up { DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; ls; }
alias up=up

function go_to_dir { cd $1; ls; }
alias go=go_to_dir

##### CLEANING ##
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

##### TOOLS ##
alias ack='ack -C 2 --color-filename=red --color-match=green'        # search in files with 2 lines context before and after
alias bpe='sudo nano ~/.bash_profile'                                # quick edit of .bash_profile
alias bpr='source ~/.bash_profile'                                   # quick reload of .bash_profile
alias ile='grep -o "$1" * | wc -l'                                   # count occurance of phrase in code files
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias proc="ps -ec"
alias procf="ps -ec | grep '$1'"
