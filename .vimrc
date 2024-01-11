
" Opening Notes {-
" 
"
"   _________________________.___._________ ___________
"   \______   \______   \__  |   |\_   ___ \\_   _____/
"    |    |  _/|       _//   |   |/    \  \/ |    __)_ 
"    |    |   \|    |   \\____   |\     \____|        \
"    |______  /|____|_  // ______| \______  /_______  /
"           \/        \/ \/               \/        \/ 
""
"
"
"   This is the personal .vimrc file for Bryce Tolman.
"   It's not amazing, but it's there.
"   Enjoy it
"
" -}


" Folding Sections {-

set foldenable
set foldmethod=marker
if expand('%:p') =~# 'vimrc$'
    set foldmarker={-,-}
else
    set foldmarker={,}
endif
set foldminlines=2
set foldcolumn=0

"-}


" Map Leader Commands {-

" Set the leader to do my own commands
let mapleader=","

" Open/Close Brackets
inoremap <expr> <leader>zc "\<Esc>zc\<Up>i\<Down>"
inoremap <expr> <leader>zo "\<Esc>zo\<Up>i\<Down>"   

" Moving in file operations
inoremap <leader>7 <Esc>$
inoremap <leader>0 <Esc>0
inoremap <leader>g <Esc>G
inoremap <leader>gg <Esc>gg

" File Operations
inoremap <leader><leader> <Esc>
inoremap <leader>q <Esc>:Q<Return>
inoremap <leader>w <Esc>:W<Return>

" Formatting Operations
inoremap <leader>o <Esc>o 
inoremap <leader>r <Esc><C-r>
inoremap <leader>y <Esc>y
inoremap <leader>p <Esc>p
inoremap <leader>d <Esc>d
inoremap <leader>u <Esc>u

"-}

   
" Custom Commands {-

" Makes my sourcing commands
command Q q!
command W wq

" -}


" Navigaition and Visual Properties {-

set virtualedit+=onemore " allow cursor to stay at line end
syntax on " makes syntax highlighting work
set number " adds numbers on the left side of the screen
set cursorline " adds a white line under the cursor's line
set cursorcolumn " highlights the cursor's column
set mouse=a " Allows mouse movement and clicking

" -}"


" Indentation {-
set shiftwidth=4 " makes auto indents 4 spaces
set tabstop=4 " makes tab 4 spaces long
set softtabstop=4 " deletes all tab spaces at once
set expandtab " makes tab actually spaces
filetype indent on " Sets indent rules based on filetype
set smartindent " Enables auto indent based on context
" -}


" Line Wrapping {-

set whichwrap+=<,>,h,l,[,] " Allows move by line wrapping

" Function to set wrap based on window width
function! SetWrap()
    if winwidth(0) <= 85
        set wrap
    else
        set nowrap
    endif
endfunction

" Set Wrap when vim starts
autocmd VimEnter * call SetWrap() 

" Set wrap upon resizing
autocmd VimResized * call SetWrap()

"-}

 
"Searching {-

set incsearch " highlights matching characters as you search
set ignorecase " searches capitals even if you don't type them
set smartcase " if you type capitals, it matches case
set showmatch " show the matching brackets and parentheses and such
set nohlsearch " does not persist in highlighting the previous search

"-}"


" Status Bar and Command Line {-

set history=1000 " let the command history be large
set wildmode=list:longest " shows multiple options for autocompelte
set wildmenu " enables autocompletion of commands with TAB
set showmode " shows the mode you are in on the command line
set showcmd " shows partial commands at the bottom right
set ruler " show line and column number in the status bar

" -}"


" Run Configuration {-

set encoding=utf-8 " Sets the UTF encoding to 8
set nobackup " doesn't save backup files

" Ignore certain file types for vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Sets up the path to python for Vim plugins
set pythonthreedll=C:/Users/bat20/AppData/Local/Programs/Python/Python311/python311.dll  
set pythonthreehome=C:/Users/bat20/AppData/Local/Programs/Python/Python311/ 

"-}


" Command List Window {-

" Function to show the command list {-
function! UpdateCommandList()

    let command_list = [
        \ "    Vim Commands    ",
        \ "--------------------",
        \ "Open File: :e file",
        \ "Undo: u",
        \ "Redo: Ctrl+r",
        \ "Search: /pattern",
        \ "Start of Line: 0",
        \ "End of Line: $",
        \ "Move to line n: nG",
        \ "Copy: y",
        \ "Paste: p",
        \ "Cut: d",     
        \ ]

    " Insert new content
    call setbufline('CommandList', 1, command_list)
endfunction
" -}

" Function for opening command window {-
function! OpenCommandList()
    vertical split CommandList
    vertical resize 20
    setlocal nonumber
    setlocal nocursorcolumn
    setlocal nocursorline
    wincmd w
    call UpdateCommandList()
endfunction
" -}

" Function to autoclose the help window {-
function! CloseHelpAuto()

    if bufwinnr('CommandList') != -1 
        if tabpagewinnr(tabpagenr()) == 2
            if tabpagenr('$') == 1
                qall!
            else
                tabclose
            endif
        endif
    endif

endfunction
" -}

" Function to close the help window manually {-
function! CloseHelpManual()
    echo "hey there"
endfunction
" -}

" Map command to close the help menu
command CH call CloseHelpManual()
inoremap <leader>ch <Esc>:CH<Return>


" Open a new Command list if a new tab is opened
autocmd TabNew * if winnr('$') == 1 | call OpenCommandList() | endif

" Open a new Command list when the program starts
autocmd VimEnter * call OpenCommandList()

" Close the help buffer if needed
autocmd WinClosed * call CloseHelpAuto()

" -} 


" Autocomplete Pairs {-

inoremap { {}<Left>
inoremap <expr> } getline('.')[col('.') - 1] =~# '}' ? "\<Right>" : "}"

inoremap [ []<Left>
inoremap <expr> ] getline('.')[col('.') - 1] =~# ']' ? "\<Right>" : "]"

inoremap ( ()<Left>
inoremap <expr> ) getline('.')[col('.') - 1] =~# ')' ? "\<Right>" : ")"

inoremap < <><Left>
inoremap <expr> > getline('.')[col('.') - 1] =~# '>' ? "\<Right>" : ">"

inoremap <expr> " getline('.')[col('.') - 1] =~# '"' ? "\<Right>" : "\"\"\<Left>"

inoremap <expr> ' getline('.')[col('.') - 1] =~# '''' ? "\<Right>" : "''\<Left>"

" -}

