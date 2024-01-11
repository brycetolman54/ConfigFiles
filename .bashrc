export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# allows me to go to my coding class
alias cs='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2024/Winter/CS312'

# allows me to go to my dailydose code quickly
alias dd='cd ~/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Spring-Summer/CS260/dailydose'

# allows me to open intellij easily
alias idea='~/../../../c/Users/bat20/AppData/Local/JetBrains/Toolbox/scripts/idea.cmd'

# takes me to my byu one drive
alias od='cd ~/OneDrive\ -\ Brigham\ Young\ University'

# allows me to run python programs with winpty
alias pysh='winpty python3.exe'

# allows acces to chatGPT
export OPENAI_API_KEY="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"

# sets up a new python environment given the name
function newEnv {
    if [ -z "$1" ]; then
        echo "match: newEnv <env name>"
    else
        python -m venv $1
        source $1/Scripts/activate
    fi
}

# deactivates the currect environment
alias dct='deactivate'

# automatically colors the grep output
alias grep='grep -n --color=auto'

# opens the glow app to look at md files
alias glow='winpty glow.exe'

# allows me to access my chatGPT
alias gpt='winpty gpt.exe'

# formats the wc for me to see liens, words, and characters columns
alias wcL='echo \ \ L \ \ W \ \ C \ \ File && wc'

# sets my main editor as vim
export EDITOR="vim"

# runs C++ programs
function runCpp {

    # make sure that we have the first args that we need
    if [ -z "$1" ] || [ -z $(echo $1 | grep .cpp$) ]; then
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

# takes me to my coding projects folder
alias cds='od && cd BYU/Coding'

# makes my history size huge
export HISTSIZE=5000

# makes the size of the histroy file huge
export HISTFILESIZE=100000

# lets me quick edit my bash config
alias e='vim ~/.bashrc'

# lets me restart bash quick
alias s='source ~/.bashrc'

# shortcut for screen clear
alias c='clear'

# shorcut for git status
alias gs='git status'

# shortcut for git commit
function gm {
    git commit -am "$1"
}

# shortcut for add all to git
alias gaa='git add .'

# shorcut to add one file to git
function ga {
    git add $1
}

# shorcut to push to git
alias gg='git push'

# shortcut to see git log
alias gl='git log'

# shorcut to open an html file
function openChrome {
    chrome "$(echo $(pwd))/$1"
}

# shortcut to quick edit vimrc
alias ev='vim ~/.vimrc'

# This is to fix the lightline vim plugin
export TERM=xterm-256color

# shortcut to open mysql locally
alias sql='winpty mysqlsh -u root -pBuBB@l002ooosql --sql'

# gets the path of the current directory and stores it in the provided name
function gp {
    if [ -z $1 ]; then
        echo "please provide a path name"
    else 
        eval "$1=$(pwd | tr -d '\n' | sed 's/\ /\\ /g')"
    fi
}

# starts ChessCafe
alias chess='java -jar /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Fall/CS240/Chess/out/artifacts/client_jar/client.jar'

# starts chess server locally
alias cheser='java -jar /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/2023/Fall/CS240/Chess/out/artifacts/server_jar/server.jar'

# shortcut to show bashrc contents
alias cb='cat ~/.bashrc'

# allows me to search in my path quickly and separates each element of the path
alias sp='echo $PATH | sed "s/:/\n/g" | grep $1'

# shortcut to go todo app source code
alias tds='cd /c/Users/bat20/OneDrive\ -\ Brigham\ Young\ University/BYU/Coding/Go/Go_CLI'

# make the completion by tab show all options if ambiguous
bind 'set show-all-if-ambiguous on'

# make me skip to the end of the line
bind '\C-e:end-of-line'

# make me skip to the front of the line
bind '\C-b:beginning-of-line'

# stop the binding on \
bind -r '\'
bind '"\\":self-insert'

# shortcut to run go build
alias gb='go build'
function gbt {
    gp here
    tds
    gb
    cd "$here"
}

# see all hidden files in the folder
function hid {
    if [ -z $1 ]; then
        ls -a | grep ^'\.'
    else
        ls -a $1 | grep ^'\.'  
    fi
}
