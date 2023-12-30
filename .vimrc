" Set up my plugins with Vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  
Plugin 'VundleVim/Vundle.vim'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-syntastic/syntastic'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}

call vundle#end()
filetype plugin on

" Set some things for my plugins
let g:snipMate = { 'snippet_version' : 1 }
let g:lightline = { 
    \ 'colorscheme' : 'solarized' ,
    \ 'background' : 'light', 
    \ }
let g:syntastic_java_checkers = ['javac']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Makes my sourcing commands
command S source ~/.vimrc | nohlsearch
command Q q!
command W wq

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

" Uses space characters instead of tabs so it's not one block
set expandtab

" Does not save backup files
set nobackup

" Does not let the cursor scroll more than N lines when scrolling
set scrolloff=8

" Do not wrap lines, let them go out long
set wrap

" Highlight the characters that match with the one you are searching for as you type
set incsearch

" Ignore capital letters during search
set ignorecase

" Override previous if you include a capital in your search
set smartcase

" show the partial command you type in the last line of the screen
set showcmd

" Show the mode you are on on the last line
set showmode

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

" Ignore certain file types for vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Let's me use the mouse if I need
set mouse=a

" Sets up the path to python
set pythonthreedll=C:/Users/bat20/AppData/Local/Programs/Python/Python311/python311.dll  

set pythonthreehome=C:/Users/bat20/AppData/Local/Programs/Python/Python311/ 

" Sets the UTF encoding
set encoding=utf-8

" Lets me go to the next line from the end of the line
set whichwrap+=<,>,h,l,[,]

" Set vim to not show the mode you are in
set noshowmode

" Make indenting work cool
filetype plugin indent on
set smartindent

" Make it so my closing brace and paren auto indents the code
autocmd VimEnter * inoremap <silent> } }<Esc>=<Up>
autocmd VimEnter * inoremap ) ) <Esc>=<Up>

" Make it so I can easily escape, quit, and save
inoremap ;;; <Esc>
inoremap ;q <Esc>:Q<Return>
inoremap ;w <Esc>:W<Return>

" allow me to do a new line easily
inoremap ;o <Esc>o
