" Opening Notes {
"   
"   This is the personal .vimrc file for Bryce Tolman.
"   It's not amazing, but it's there.
"   Enjoy it
"
" }


" Folding Sections {

set foldenable
set foldmethod=marker
set foldmarker={,}
set foldminlines=2
set foldcolumn=0

"}


" Map Leader Commands {

" Set the leader to do my own commands
let mapleader=","

" Open/Close Brackets
inoremap <leader>zc <Esc>zc<CR>i
inoremap <leader>zo <Esc>zo<CR>i   


" File Operations
inoremap <leader><leader> <Esc>
inoremap <leader>q <Esc>:Q<Return>
inoremap <leader>w <Esc>:W<Return>

" Formatting Operations
inoremap <leader>o <Esc>o 
inoremap <leader>0 <Esc>0
inoremap <leader>$ <Esc>$
inoremap <leader>y <Esc>y
inoremap <leader>p <Esc>p
inoremap <leader>d <Esc>d
inoremap <leader>u <Esc>u

"}


" Custom Commands {

" Makes my sourcing commands
command Q q!
command W wq

" }


" Lets the cursor stay at the end of the line when in normal mode
set virtualedit+=onemore


" Makes the highlighting awesome
syntax on

" Add numbers to each line on the left-hand side
set number

" Highlights the row the cursor is on with a line underneath
set cursorline

" Highlights the cursor line underneath the cursor vertically
set cursorcolumn 

" Sets the shift width to 4 spaces
set shiftwidth=4

" Sets the tab width to 4 columns
set tabstop=4

" Makes it so backspacing a tab gets rid of all the spaces
set softtabstop=4

" Uses space characters instead of tabs so it's not one block
set expandtab 

" Does not save backup files
set nobackup

" Does not let the cursor scroll more than N lines when scrolling
set scrolloff=8

" Line Wrapping {

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

"}

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
set whichwrap+=<,>,h,l,[,] " Allows move by line wrapping
filetype indent on " Sets indent rules based on filetype
set smartindent " Enables auto indent based on context

" Vim Run Configuration {
" Ignore certain file types for vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Sets up the path to python for Vim plugins
set pythonthreedll=C:/Users/bat20/AppData/Local/Programs/Python/Python311/python311.dll  
set pythonthreehome=C:/Users/bat20/AppData/Local/Programs/Python/Python311/ 

"}


" Command List Window {

" Function to show the command list
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

    " Clear existing content
    call deletebufline('CommandList', 1, '$')

    " Insert new content
    call setbufline('CommandList', 1, command_list)
endfunction

" Open a new scratch buffer at the open of the program and populate it
autocmd VimEnter * vertical split CommandList | vertical resize 20 | setlocal nonumber | setlocal nocursorcolumn | setlocal nocursorline | wincmd w | call UpdateCommandList()

" Close the help buffer if it is the last open
autocmd WinEnter * if bufname('%') ==# 'CommandList' && winnr('$') == 1 | q! | endif 

" }
   












