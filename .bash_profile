##### GENERAL ##
alias ls='ls -a1'                                                    # show all files in vertical list
alias mkdir='mkdir -pv'                                              # create directories with autovivification

##### SAFETY ##
alias cp='sudo cp -i'                                                # ask before making file copy
alias mv='sudo mv -i'                                                # ask before moving file
alias rm='sudo rm -i'                                                # ask before removing file

##### TOOLS ##
alias ack='ack -C 2 --color-filename=red --color-match=green'        # search in files with 2 lines context before and after
alias bpe='sudo nano ~/.bash_profile'                                # quick edit of .bash_profile
alias bpr='source ~/.bash_profile'                                   # quick reload of .bash_profile
alias ile='grep -o "$1" * | wc -l'                                   # count occurance of phrase in code files

##### GIT ##
alias gadd='git add'                                                 # add unstaged files to stage (prepare to commit)
alias gadp='git add -p'                                              # choose which changes add to stage (prepare commit by patching)
alias gadu='git add . -u && gds'                                     # add to stage all untracked files (and show staged code diff after)
alias gbr=git_show_branches_with_descr                               # show local branches with description
git_show_branches_with_descr(){
    branch=""
    branches=`git branch --list`

    ESC_SEQ="\x1b["
    COLOR_RESET=$ESC_SEQ"39;49;00m"
    RED_NORMAL=$ESC_SEQ"00;31m"
    BLUE_NORMAL=$ESC_SEQ"00;34m"
    WHITE_NORMAL=$ESC_SEQ"00;37m"
    CYAN_UNDERLINE=$ESC_SEQ"04;36m"

    while read -r branch; do
	# git marks current branch with "* ", remove it
	clean_branch_name=${branch//\*\ /}
	description=`git config branch.$clean_branch_name.description`
	if [ "${branch::1}" == "*" ] ; then
	    printf "$CYAN_UNDERLINE$clean_branch_name$COLOR_RESET $BLUE_NORMAL$description$COLOR_RESET\n"
	elif [ "$clean_branch_name" == "master" ] || [ "$clean_branch_name" == "regres" ] ; then
	    continue
	else
	    printf "$WHITE_NORMAL$clean_branch_name$COLOR_RESET $BLUE_NORMAL$description$COLOR_RESET\n"
	fi
    done <<< "$branches"
}

alias gbrd='git branch -d'                                          # delete local branch
alias gbre='git branch --edit-description'                          # edit description of the branch
alias gbrn='gco -b "$1" | gpsh -u origin "$1"'                      # create new branch
alias gc='git commit -m'                                            # commit with short message
alias gco='git checkout'                                            # checkout to/or something
alias gds='git diff --staged'                                       # show diff of staged files
alias gdu='git diff'                                                # show diff of unstaged files
alias gpoc='git push origin `git current-branch`'                   # send commited changes directly to origin branch repo
alias gpsh='git push'                                               # push to branch
alias gpuf='git pull --ff'                                          # sync local master
alias grso='git remote show origin'                                 # show branches on remote
alias gs='git status'                                               # full status
alias gss='git status -s'                                           # shortened status
alias gstat='git shortlog -s -n --all'                              # commit statistics
alias gsync="git merge origin/master"                               # update branch with origin master
alias guns='git reset HEAD --'                                      # unstage files (remove from commiting)

