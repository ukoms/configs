####### ALIASES ######

# fast edit .bash_profile
alias bpe=bash_profile_edit

# reset .bash_profile - after modifications
alias bpr=bash_profile_reload

# syncing config files
alias cfs=config_syncer

# go to working directory and display content
alias dg=directory_go

# run file in editor
alias fe=file_edit

# main git alias
alias g='git'

# too much for typing ;)
alias h='cd'

# list files in one column (+ . beginning files)
alias l='ls -1 -a'

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
            cp -b -i -v ~/public_html/s/.bash_profle ~/.bash_profile
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
#   Brak

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