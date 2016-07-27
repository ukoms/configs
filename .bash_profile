# install: curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
source ~/.git-prompt.sh

I_RED='\[\033[0;91m\]'
R_RED='\[\033[0;31m\]'
R_YELLOW='\[\033[0;33m\]'
R_GREEN='\[\033[0;32m\]'
R_CYAN='\[\033[0;36m\]'
RESET='\[\033[0m\]'

PS1="${R_GREEN}[${R_YELLOW}\t ${R_CYAN}\w${I_RED} \$(__git_ps1) ${R_GREEN}]:${RESET}"

# show all files in vertical list
alias ls='ls -a1'
# create directories with autovivification
alias mkdir='mkdir -pv'
# ask before making file copy
alias cp='sudo cp -i'
# ask before moving file
alias mv='sudo mv -i'
# ask before removing file
alias rm='sudo rm -i'

# install: brew install ack
# search in files with 2 lines context before and after
alias ack='ack -C 2 --color-filename=red --color-match=green'
# login screen - afk
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
# quick edit of .bash_profile
alias bpe='sudo nano ~/.bash_profile'
# quick reload of .bash_profile
alias bpr='source ~/.bash_profile'
# clear screen
alias cls="clear"
# count occurance of phrase in code files
alias ile='grep -o "$1" * | wc -l'
# kill Volume Mixer
alias kvol="kill -9 $(ps -ec | grep 'Volume Mixer' | awk '{print $1}')"
# resurrect Volume Mixer
alias rvol="open -a 'Volume Mixer'"
# run PHP in server mode
alias pserv='php -S localhost:7777'
# install:brew install youtube-dl
# download YT movie
alias ytd='sudo youtube-dl -f "best[ext=mp4]/best" -o "~/Downloads/%(extractor)s/%(title)s-uploaded_by-%(uploader)s-%(upload_date)s.%(ext)s"'

# goin up directory tree
function up { DEEP=$1; [ -z "${DEEP}" ] && { DEEP=1; }; for i in $(seq 1 ${DEEP}); do cd ../; done; ls; }
alias up=up
# going down directory tree
function go { cd $1; ls; }
alias go=go

# Recursively delete macOS && OSX crap files
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

# add unstaged files to stage (prepare to commit)
alias gadd='git add'
# choose which changes add to stage (prepare commit by patching)
alias gadp='git add -p'
# add to stage all untracked files (and show staged code diff after)
alias gadu='git add . -u && gds'
# delete local branch
alias gbrd='git branch -d'
# edit description of the branch
alias gbre='git branch --edit-description'
# create new branch
alias gbrn='gco -b "$1" | gpsh -u origin "$1"'
# commit with short message
alias gc='git commit -m'
# checkout to/or something
alias gco='git checkout'
# show diff of staged files
alias gds='git diff --staged'
# show diff of unstaged files
alias gdu='git diff'
# send commited changes directly to origin branch repo
alias gpoc="git push origin \$(git rev-parse --abbrev-ref HEAD)"
# push to branch
alias gpsh='git push'
# sync local master
alias gpuf='git pull --ff'
# show branches on remote
alias grso='git remote show origin'
# full status
alias gs='git status'
# shortened status
alias gss='git status -s'
# add everything to stash
alias gsta='git stash'
# clear stash
alias gstac='git stash clear'
# show stash diff
alias gstad=git_stash_diff
git_stash_diff(){
    git stash show -p stash@{$1}
}
# show files in stash
alias gstal='git stash list'
# apply changes from stash
alias gstap='git stash apply'
# commit statistics
alias gstat='git shortlog -s -n --all'
# update branch with origin master
alias gsync="git merge origin/master"
# unstage files (remove from commiting)
alias guns='git reset HEAD --'
