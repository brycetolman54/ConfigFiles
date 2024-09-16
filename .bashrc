
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

alias sem='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Fall/' # to current semester
alias dd='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Spring-Summer/CS260/dailydose' # to DailyDose code
alias od='cd ~/OneDrive\ -\ Brigham\ Young\ University' # to BYU OneDrive
alias cds='od && cd BYU/Coding' # to Coding Projects
alias tds='cd /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/Coding/Go/Go_CLI' # to Todo app
alias dn='cd ~/Downloads' # to Downloads


# }-


# Shortcuts for Functionality -{
   
alias idea='~/../../../c/Users/bat20/AppData/Local/JetBrains/Toolbox/scripts/idea.cmd' # opens IntelliJ
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
        # just run R
        r
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
alias ms='p /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/Coding/FunProjects/MineSweeper/ms.py' # play MineSweeper


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

# }-


# Bindings -{

bind 'set completion-ignore-case on'
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
alias cx='clear -x' # clear with scrollback

alias e='vim ~/.bashrc' # edit bashrc
alias s='source ~/.bashrc' # source bashrc
alias cb='cat ~/.bashrc' # show bashrc
alias ev='vim ~/.vimrc' # edit vimrc


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
    else
        # use the pandoc
        wsl pandoc $1 -o $2
    fi
}
# }-

# }-
