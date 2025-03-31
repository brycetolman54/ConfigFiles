
# Opening Notes -{
#
# 
#
#   _________________________.___._________ ___________
#   \______   \______   \__  |   |\_   ___ \\_   _____/
#    |    |  _/|       _//   |   |/    \  \/ |    __)_ 
#    |    |   \|    |   \\____   |\     \____|        \
#    |______  /|____|_  // ______| \______  /_______  /
#           \/        \/ \/               \/        \/ 
#
#
#
#   This is the personal .bashrc file for Bryce Tolman.
#
#   This .bashrc file contains my:
#
#   - settings for bash
#   - shortcuts to different locations
#   - shortcuts for different programs
#   - bindings for bash
#   - shortcuts for git commands
#   - shortcuts for helpful bash commands
#
#   }-


# Setup -{

export R_HOME="~"

export EDITOR="vim" # set editor as Vim

export PATH=/c/Users/bat20/AppData/Local/Programs/Python/Python313:$PATH

export NVM_DIR="$HOME/.nvm" # set NVM directory
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HISTSIZE=5000 # set History for the session
export HISTFILESIZE=100000 # set History across sessions

export TERM=xterm-256color # get good colors

export LS_COLORS=$LS_COLORS:'*.py=1;35' # set py file color
export LS_COLORS=$LS_COLORS:'*.md=1;90' # set md file color
export LS_COLORS=$LS_COLORS:'*.R=1;33' # set R file color
export LS_COLORS=$LS_COLORS:'*.java=1;31' # set Java file color

# }-


# Shortcuts to Locations -{
# 

alias sem='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2025/Winter' # to current semester
alias lab='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/Lab/BreastCancer' # to my Piccolo lab folder
alias dd='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Spring-Summer/CS260/dailydose' # to DailyDose code
alias odd='cd ~/OneDrive'
alias od='cd ~/OneDrive\ -\ Brigham\ Young\ University' # to BYU OneDrive
alias cds='od && cd BYU/Coding' # to Coding Projects
alias tds='cd /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/Coding/Go/Go_CLI' # to Todo app
alias dn='cd ~/Downloads' # to Downloads
alias ldn='ls ~/Downloads' # list Downloads
alias pic='cd ~/OneDrive/Fun\ Stuff/Pictures/Screenshots'
alias cc='cd /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/ccbcge'

# }-


# Shortcuts for Functionality -{

alias v='winpty nvim'
alias sm='ssh bat54@moat.cs.byu.edu'
alias idea='~/../../../c/Users/bat20/AppData/Local/JetBrains/Toolbox/scripts/idea.cmd' # opens IntelliJ
alias prom='/c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/SoftwareLabs/204/Unit8/Prometheus/prometheus.exe'
alias fiji='ImageJ-win64.exe 2>/dev/null' # open FIJI for image analysis
alias glow='winpty glow.exe' # use Glow for .md files
alias sql='winpty mysqlsh -u root -pBuBB@l002ooosql --sql' # start SQL
# runs python programs -{
function p {
    # see if we have an argument
    if [ -z $1 ]; then
        # just run R
        winpty python3.exe
    else

        # check that we only have one file
        if [ $# -ne 1 ]; then
            echo "use only one file in the argument"
            return 0
        fi

        # check that the file is the right type
        if [ -n $(echo $1 | grep .py$) ]; then
            python $1
        else
            echo "use an appropriate file type"
            fi
    fi
}
# }-
# runs C++ programs -{
function runc {

    # make sure that we have the first args that we need
    if [ -z "$1" ] || [ -z $(echo $1 | grep -E '.cpp$|.c$') ]; then
        echo "pattern: runCpp <program_to_compile> <output_name> <optional_args>"
    else

        # initialize the arg Compile variable with the first file
        argCompile="-g $1"

        # shift
        shift 1

        # see if we have a *.cpp going on, if we do, add it to the -g and shift
        for arg in "$@"
        do
            if [ -n "$(echo $arg | grep .cpp&)" ]; then
                
                argCompile+=" $arg"
                shift 1
            else
                break
            fi
        done


        # add the output to argCompile depending on if we have that argument or not
        if [ -z $1 ]; then 
            argCompile+=" -o out"
            output="out"
        else
            argCompile+=" -o $1"
            output="$1"
        fi


        # skip over that argument now
        shift 1

        # initialize the arg variable
        argVar=""

        # loop the args and add them
        for arg in "$@"
        do
            argVar+=" $arg"
        done

        # now we can actually run the command we want to run
        if [ -z $argVar ]; then
            g++ -std=c++17 $argCompile 
        else
            g++ -std=c++17 $argCompile && ./$output$argVar
        fi
    fi
}
# }-
# runs R programs -{
function rr {
    # see if we have an argument
    if [ -z $1 ]; then
        # get the current path
        gp here
        cds
        cd Stats
        # just run R
        R
        cd "$here"
    else

        # check that we only have one file
        if [ $# -ne 1 ]; then
            echo "use only one file in the argument"
            return 0
        fi

        # check that the file is the right type
        if [ -n $(echo $1 | grep .R$) ]; then
            rscript $1
        else
            echo "use an appropriate file type"
        fi
    fi
}
# }-
# view PDFs -{
function pdf {
    if [ -z $1 ]; then
        echo "Please provide the file you want to see"
    else 
        pdftotext $* - | less
    fi
}
# }-

alias chess='java -jar /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Fall/CS240/Chess/out/artifacts/client_jar/client.jar' # start ChessCafe
alias cheser='java -jar /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Fall/CS240/Chess/out/artifacts/server_jar/server.jar' # start ChessCafe Server
function ms {
    python "/c/Users/bat20/OneDrive - Brigham Young University/BYU/Coding/Python/MineSweeper/ms.py" $@
}

# Set up Python env -{
function newEnv {
    if [ -z "$1" ]; then
        echo "match: newEnv <env name>"
    else
        python -m venv $1
        source $1/Scripts/activate
    fi
}
# }-
alias dct='deactivate' # Deactivate env

# move from downloads -{
function mdn {
    for file in ~/Downloads/$1; do
        mv "$file" .
    done
}
function mpc {
    for file in ~/OneDrive/Fun\ Stuff/Pictures/Screenshots/$1; do
        mv "$file" .
    done
}

# delete from downloads
function ddn {
    for file in ~/Downloads/$1; do
        rm "$file"
    done
}
# }-

# }-


# Bindings -{

bind 'set bell-style none' # no bells
bind 'set completion-ignore-case on' # ignore case in autocomplete
bind 'set show-all-if-ambiguous on' # to show all options from tab
bind '\C-e:end-of-line' # to move to end of line
bind '\C-b:beginning-of-line' # to move to beginning of line
bind -r '\' # remove binding on \
bind '"\\":self-insert' # make \ show \

# }-


# Git Commands -{

alias gs='git status'
alias gaa='git add .'
alias gg='git push'
alias gl='git log'
function gm {
    git commit -am "$1"
}
function ga {
    git add $1
}
function gc {
    if [ -z $1 ]; then
        git checkout main
    else
        git checkout $1
    fi
}
function cfu {
    gp here
    cd ~/ConfigFiles
    cp ../.vimrc .
    cp ../.bashrc .
    cp ../.Rprofile .
    gm "Update: $(date)"
    gg
    cd "$here"
}

# }-


# Updated Bash Commands -{
   
alias grep='grep -n --color=auto' # format grep output
alias wcL='echo \ \ L \ \ W \ \ C \ \ File && wc' # format wc output
   
# }-


# Shortcut Bash Commands -{

alias c='clear' # clear
alias cx='clear -x' # clear with scroll back

alias e='vim ~/.bashrc' # edit bashrc
alias s='source ~/.bashrc' # source bashrc
alias cb='cat ~/.bashrc' # show bashrc
alias ev='vim ~/.vimrc' # edit vimrc
alias er='vim ~/.Rprofile' # edit rprofile


alias gb='go build' # build go projects
alias sp='echo $PATH | sed "s/:/\n/g" | grep $1' # search PATH
alias col='cat ~/.colorcodes.txt' # show colors for echo

# Open files in Chrome -{
function open {
    chrome "$(pwd)/$1"
}
# }-
# Get current directory path -{
function gp {
    if [ -z $1 ]; then
        echo "please provide a path name"
    else 
        eval "$1=$(pwd | tr -d '\n' | sed 's/\ /\\ /g')"
    fi
}
# }-
# Run go build from anywhere -{
function gbt {
    gp here
    tds
    gb
    cd "$here"
}
# }-
# Show hidden files -{
function hid {
    if [ -z $1 ]; then
        ls -a | grep ^'\.'
    else
        ls -a $1 | grep ^'\.'  
    fi
}
# }-
# Run UML from anywhere -{
alias uml='java -jar /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/Coding/Java/.plantuml.jar'
# }-

# }-


# WSL Commands -{

alias mvn='wsl mvn'

alias gradle='wsl gradle'

alias tree='wsl tree' # list in tree

# view Images -{
function img {
    if [ -z $1 ]; then
        echo "please provide an image or video file"
    else
        # update to change screen size
        wsl timg -g50x50 $1
    fi
}
# }-

# use Pandoc -{
function pdoc {
    if [ -z $1 ]; then
        echo "Please provide the file you want to use and the name of the file"
    elif [ -z $2 ]; then
        echo "Please provide a name for the file"
    elif [ -z $3 ]; then
        # use the pandoc
        wsl pandoc $1 -o $2
    else
        wsl pandoc $1 -o $2 -H $3
    fi
}
# }-

# }-


# Messing Around -{

function helpme {

    if [ $# -gt 0 ] && [ "$1" != "t" ] && [ "$1" != "g" ] && [ "$1" != "e" ]; then
        echo -e "  \u001b[38;5;160mThat is not a valid argument\u001b[38;5;15m"
        echo -e "  \u001b[38;5;160mThe valid arguments are the following: g, t, e\u001b[38;5;15m"
        echo -e "  \u001b[38;5;160mPlease try again with one of those arguments (or none)\u001b[38;5;15m"
    fi

    if [ $# -eq 0 ] || [ "$1" == "t" ]; then
        echo -e ""
        echo -e "  \u001b[38;5;5mTerminal Commands:\u001b[38;5;15m"
        echo -e "  \u001b[38;5;5m------------------\u001b[38;5;15m"
        echo -e "    \u001b[38;5;12mcd\u001b[38;5;13m <folder>\u001b[38;5;15m                   moves to the specified folder"
        echo -e "                                    \u001b[38;5;136mUsing '..' for the folder moves you up a folder\u001b[38;5;15m"
        echo -e "    \u001b[38;5;12mcode\u001b[38;5;13m <folder>\u001b[38;5;15m                 open Visual Studio Code with the folder"
        echo -e "                                    \u001b[38;5;136mUse '.' as the folder when you are in the project folder\u001b[38;5;15m"
        echo -e "    \u001b[38;5;12mls\u001b[38;5;15m                            lists all the files/folders in the current folder"
        echo -e "                                    \u001b[38;5;136mFolders are blue and have / at the end\u001b[38;5;15m"
        echo -e "    \u001b[38;5;46m[c]\u001b[38;5;12mlear\u001b[38;5;15m                       clear the screen"
    fi


    if [ $# -eq 0 ] || [ "$1" == "g" ]; then
        echo -e ""
        echo -e "  \u001b[38;5;5mGit Commands:\u001b[38;5;15m"
        echo -e "  \u001b[38;5;5m-------------\u001b[38;5;15m"
        echo -e "    \u001b[38;5;46m[gp]\u001b[38;5;15m \u001b[38;5;12mgit pull\u001b[38;5;15m                 pull down the changes from GitHub"
        echo -e "                                    \u001b[38;5;136mMake sure to do this every time you start coding\u001b[38;5;15m"
        echo -e "    \u001b[38;5;46m[ga]\u001b[38;5;15m \u001b[38;5;12mgit add\u001b[38;5;13m <file>\u001b[38;5;15m           add a file to be tracked by git"
        echo -e "                                    \u001b[38;5;136mMake sure to add all new files\u001b[38;5;15m"
        echo -e "    \u001b[38;5;46m[gm]\u001b[38;5;15m \u001b[38;5;12mgit commit\u001b[38;5;13m -am <\"me\">\u001b[38;5;15m    commit changes to git"
        echo -e "                                    \u001b[38;5;136mThe -a makes it track all the files you have changed\u001b[38;5;15m"
        echo -e "                                    \u001b[38;5;136mThe -m tells it you are giving the message me (make sure the message is meaningful)\u001b[38;5;15m"
        echo -e "    \u001b[38;5;46m[gg]\u001b[38;5;15m \u001b[38;5;12mgit push\u001b[38;5;15m                 pushes all your committed changes to GitHub"
        echo -e "                                    \u001b[38;5;136mMake sure to do this every time you are done working\u001b[38;5;15m"
        echo -e "    \u001b[38;5;46m[gs]\u001b[38;5;15m \u001b[38;5;12mgit status\u001b[38;5;15m               shows you the status of your git files"
        echo -e "                                    \u001b[38;5;136mthis shows which files have not been added\u001b[38;5;15m"
        echo -e "                                    \u001b[38;5;136mthis also shows which files have not been committed after editing\u001b[38;5;15m"
    fi

    if [ $# -eq 0 ] || [ "$1" == "e" ]; then
        echo -e ""
        echo -e "  \u001b[38;5;5mExplanation:\u001b[38;5;15m"
        echo -e "  \u001b[38;5;5m------------\u001b[38;5;15m"

        echo -e "    To get this help, type 'helpme' and then Enter"
        echo -e "    If you only want specific commands, you can use different arguments"
        echo -e "      This is how you use the arguments: \u001b[38;5;12mhelpme \u001b[38;5;13m<argument>\u001b[38;5;15m"
        echo -e "    You can use the following arguments:"
        echo -e "      g - for the git commands"
        echo -e "      t - for the terminal commands"
        echo -e "      e - for the explanation"

        echo -e "    For each command, the part in the \u001b[38;5;12m[]\u001b[38;5;15m is the shorthand,"
        echo -e "    This makes it so you don't have to type the whole command."
        echo -e "      For example: gm \"my message here\""

        echo -e "    The \u001b[38;5;13m<>\u001b[38;5;15m that follows are the arguments you need to provide."
        echo -e "    The \u001b[38;5;226m()\u001b[38;5;15m indicates that an argument is optional."

        echo -e "    The indented part after a command gives some additional help."

        echo -e ""
        echo -e "    Let me know if you have any questions. :)"
    fi
}

# }-

odd

