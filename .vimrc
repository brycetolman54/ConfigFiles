" Opening Notes {-
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


set virtualedit+=onemore " allow cursor to stay at line end

syntax on " makes syntax highlighting work

set number " adds numbers to lines on left hand side

set cursorline " adds a line under the current row

set cursorcolumn " highlights the current cursor column

" Indentation {-
set shiftwidth=4 " makes auto indents 4 spaces
set tabstop=4 " makes tab 4 spaces long
set softtabstop=4 " deletes all tab spaces at once
set expandtab " makes tab actually spaces
filetype indent on " Sets indent rules based on filetype
set smartindent " Enables auto indent based on context
" -}

" Does not save backup files
set nobackup

" Does not let the cursor scroll more than N lines when scrolling
set scrolloff=8

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

" Highlight the characters that match with the one you are searching for as you type
set incsearch

" Ignore capital letters during search
set ignorecase

" Makes the line and column number show in the status line
set ruler

" Override previous if you include a capital in your search
set smartcase

" show the partial command you type in the last line of the screen
set showcmd

" Show the mode you are on on the last line
set showmode " 

" Show matching words during a search
set showmatch

" Use highlighting when doing a search
set hlsearch

" Set the commands to save in history default
set history=10000

" Enables auto completion menu after pressing TAB
set wildmenu

" Make wildmenu behave like similar to Bash completion
set wildmode=list:longest


set mouse=a " Allows mouse movement and clicking
set encoding=utf-8 " Sets the UTF encoding to 8

" Vim Run Configuration {-
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

inoremap " ""<Left>
"inoremap <expr> " getline('.')[col('.') - 1] =~# '\"' ? "\<Right>" : "\""

inoremap ' ''<Left>
"inoremap <expr> ' getline('.')[col('.') - 1] =~# '\'' ? "\<Right>" : "\'"

" -}

