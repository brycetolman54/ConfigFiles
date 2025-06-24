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

export PATH=$PATH:/mnt/c/Windows/System32

export EDITOR="vim" # set editor as Vim

export NVM_DIR="$HOME/.nvm"                                        # set NVM directory
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export HISTSIZE=5000       # set History for the session
export HISTFILESIZE=100000 # set History across sessions

export TERM=xterm-256color # get good colors

parse_git_branch() {
    git branch --show-current 2>/dev/null | sed 's/.*/(&)/'
}

PS1='\[\e[32m\][$(date "+%H:%M %d/%m")]\[\e[34m\]\u@\h\[\e[33m\]{$(pwd | awk -F/ '\''{n=NF; print $(n-2)"/"$(n-1)"/"$n}'\'')}\[\e[31m\]$(parse_git_branch)\[\e[35m\]\n\\$ \[\e[0m\]'

eval "$(dircolors -b ~/.dircolors)"

# }-

# Shortcuts to Locations -{
#

alias sem='pushd /mnt/c/users/bat20/OneDrive/UMN/'
alias od='pushd /mnt/c/users/bat20/OneDrive/'                                            # to BYU OneDrive
alias cds='pushd ~/Coding'                                                                # to Coding Projects
alias dn='pushd /mnt/c/users/bat20/Downloads'                                                                          # to Downloads
alias ldn='ls /mnt/c/users/bat20/Downloads'                                                                         # list Downloads
alias pic='pushd /mnt/c/users/bat20/OneDrive/Fun\ Stuff/Pictures/Screenshots'
alias nv='pushd ~/.config/nvim/'
alias bm='pushd ~/.config/nvim/pack/plugins/start/batman/lua/batman'
function up {
    if [ $# -eq 0 ]; then
        cd ..
    elif [[ "$1" =~ ^[0-9]+$ ]]; then
        for((i=0; i<$1; i++)); do
            cd ..
        done
    fi
}
alias rp='rm -rf ~/.config/nvim/pack/plugins/start/plenary'

# }-

# Shortcuts for Functionality -{

alias code='/mnt/c/Users/bat20/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe'
alias sql='winpty mysqlsh -u root -pBuBB@l002ooosql --sql' # start SQL
alias chess='java -jar /mnt/c/users/bat20/Users/bat20/OneDrive/BYU/2023/Fall/CS240/chess/out/artifacts/client_jar/client.jar' # start ChessCafe
alias cheser='java -jar /mnt/c/users/bat20/Users/bat20/OneDrive/BYU/2023/Fall/CS240/chess/out/artifacts/server_jar/server.jar'        # start ChessCafe Server
function ms {
  python "/mnt/c/Users/bat20/OneDrive/BYU/Coding/Python/MineSweeper/ms.py" $@
}
# move from downloads -{
function mdn {
  for file in /mnt/c/users/bat20/Downloads/$1; do
    mv "$file" .
  done
}
function mpc {
  for file in /mnt/c/users/bat20/OneDrive/Fun\ Stuff/Pictures/Screenshots/$1; do
    mv "$file" .
  done
}

# delete from downloads
function ddn {
  for file in /mnt/c/users/bat20/Downloads/$1; do
    rm "$file"
  done
}
# }-

# }-

# Bindings -{

bind 'set bell-style none'           # no bells
bind 'set completion-ignore-case on' # ignore case in autocomplete
bind 'set show-all-if-ambiguous on'  # to show all options from tab
bind '\C-e:end-of-line'              # to move to end of line
bind '\C-b:beginning-of-line'        # to move to beginning of line
bind -r '\'bind '"\\":self-insert'   # remove binding on \

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
  cd ~/.ConfigFiles
  cp ../.vimrc .
  cp ../.bashrc .
  gm "Update: $(date)"
  gg
  cd "$here"
}

# }-

# Updated Bash Commands -{

alias grep='grep -n --color=auto'                 # format grep output
alias wcL='echo \ \ L \ \ W \ \ C \ \ File && wc' # format wc output
alias ls='ls --color=auto'

# }-

# Shortcut Bash Commands -{

alias c='clear'     # clear
alias cx='clear -x' # clear with scroll back

alias dc='dirs -c'

alias e='vim ~/.bashrc'    # edit bashrc
alias ed='vim ~/.dircolors' # edit dircolors
alias s='source ~/.bashrc' # source bashrc
alias cb='cat ~/.bashrc'   # show bashrc
alias ev='vim ~/.vimrc'    # edit vimrc

alias sp='echo $PATH | sed "s/:/\n/g" | grep $1' # search PATH

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
# Show hidden files -{
function hid {
  if [ -z $1 ]; then
    ls -a | grep ^'\.'
  else
    ls -a $1 | grep ^'\.'
  fi
}
# }-
# use the clip.exe tool -{

clip() {
  "$@" | clip.exe
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

