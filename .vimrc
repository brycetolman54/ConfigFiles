
" Opening Notes -{
" 
"
"   _________________________.___._________ ___________
"   \______   \______   \__  |   |\_   ___ \\_   _____/
"    |    |  _/|       _//   |   |/    \  \/ |    __)_ 
"    |    |   \|    |   \\____   |\     \____|        \
"    |______  /|____|_  // ______| \______  /_______  /
"           \/        \/ \/               \/        \/ 
"
"
"
"   This is the personal .vimrc file for Bryce Tolman.
"   It's not amazing, but it's there.
"   Enjoy it
"
" }-


" Folding Sections -{

set foldenable
set foldmethod=marker
if expand('%:p') =~# 'vimrc$'
    set foldmarker=-{,}-
else
    set foldmarker={,}
endif
set foldminlines=2
set foldcolumn=0

"}-


" Map Leader Commands -{

" Set the leader to do my own commands
let mapleader=";"

" Open/Close Brackets
inoremap <leader>zc <Esc>zc
inoremap <leader>zo <Esc>zo   

" Moving in file operations
inoremap <leader>7 <Esc>$i<Right>
inoremap <leader>0 <Esc>0i
inoremap <leader>g <Esc>G
inoremap <leader>gg <Esc>gg


" File Operations
inoremap <leader><leader> <Esc>
inoremap <leader>q <Esc>:Q<Return>
inoremap <leader>w <Esc>:W<Return>
inoremap <leader>s <Esc>:w<Return>i<Right>

" Formatting Operations
inoremap <leader>o <Esc>o
inoremap <leader>r <Esc><C-r>
inoremap <leader>y <Esc>yi<Right>
inoremap <leader>p <Esc>pi<Right>
inoremap <leader>d <Esc>di<Right>
inoremap <leader>u <Esc>ui<Right>
inoremap <leader>dd <Esc>ddi


" Toggle Help Window
inoremap <leader>ch <Esc>:CH<Return>i
inoremap <leader>oh <Esc>:OH<Return>i

" Markdown Tools
inoremap <leader>ct <Esc>:CT<Return>
inoremap <leader>al <Esc>:AL<Return>i
inoremap <leader>dl <Esc>:DL<Return>i

"}-

   
" Custom Commands -{

" Makes my sourcing commands
command Q q!
command W wq

" Resize Help Window to Close/Open
command CH call ToggleHelp('CH') 
command OH call ToggleHelp('OH')

" Function to focus on Command Window and back -{
function! ToggleHelp(command)
    
    " get the current buffer that is in focus
    let curBuf = bufnr('%')
    let curWin = bufwinnr(curBuf)

    " find the buffer for the help window
    let helpBuf = bufnr('CommandList')
    let helpWin = bufwinnr(helpBuf)

    " make sure the help buffer is open
    if helpWin != -1
        execute helpWin . "wincmd w"
    else
        echo "The help window is not open in this tab"
        return
    endif

    " execute the command
    if a:command ==# 'CH'
        vertical resize 0
    elseif a:command ==# 'OH'
        vertical resize 20
    else
        echo "That is not an appropriate command"
        return
    endif

    " return to the previous window
    execute curWin . "wincmd w"

endfunction
"}-

" Markdown Tools commands
command -nargs=* CT call CreateTable(<f-args>)
command AL call AddLine()
command DL call DeleteLine()
" }-


" Navigaition and Visual Properties -{

set virtualedit+=onemore " allow cursor to stay at line end
syntax on " makes syntax highlighting work
set number " adds numbers on the left side of the screen
set cursorline " adds a white line under the cursor's line
set cursorcolumn " highlights the cursor's column
set mouse=a " Allows mouse movement and clicking

" }-"


" Indentation -{
set shiftwidth=4 " makes auto indents 4 spaces
set tabstop=4 " makes tab 4 spaces long
set softtabstop=4 " deletes all tab spaces at once
set expandtab " makes tab actually spaces
filetype indent on " Sets indent rules based on filetype
set smartindent " Enables auto indent based on context

" Function to set up brackets for a function -{
function! BracketIndent()
        
    " see if the characters are { and }
    if getline(line('.'))[col('.') - 2] ==# '{' && getline('.')[col('.') - 1] ==# '}'

        " find out how many tabs to do
        let chars = getline('.')
        let num = 0
        while 1
            if chars[num] ==# ' '
                let num += 1
            else
                break
            endif
        endwhile

        " do two returns, move up a line, and indent       
        return "\<CR>\<CR>\<Up>" . repeat("\<Tab>", num / 4 + 1)
            
    endif 

    " return just the <CR> else
    return "\<CR>"
    
endfunction

" See if we need to indent the brackets
inoremap <expr> <CR> BracketIndent()

" }-

" }-


" Line Wrapping -{

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

"}-

 
"Searching -{

set incsearch " highlights matching characters as you search
set ignorecase " searches capitals even if you don't type them
set smartcase " if you type capitals, it matches case
set showmatch " show the matching brackets and parentheses and such
set nohlsearch " does not persist in highlighting the previous search

"}-"


" Status Bar and Command Line -{

set history=1000 " let the command history be large
set wildmode=list:longest " shows multiple options for autocompelte
set wildmenu " enables autocompletion of commands with TAB
set showmode " shows the mode you are in on the command line
set showcmd " shows partial commands at the bottom right
set ruler " show line and column number in the status bar

" }-"


" Run Configuration -{

set modeline " allows modeline options for files

set encoding=utf-8 " Sets the UTF encoding to 8
set nobackup " doesn't save backup files

" Ignore certain file types for vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Sets up the path to python for Vim plugins
set pythonthreedll=C:/Users/bat20/AppData/Local/Programs/Python/Python311/python311.dll  
set pythonthreehome=C:/Users/bat20/AppData/Local/Programs/Python/Python311/ 

"}-


" Command List Window -{

" Function to show the command list -{
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
" }-

" Function for opening command window -{
function! OpenCommandList()
    vertical split CommandList
    vertical resize 20
    setlocal winfixwidth
    setlocal nonumber
    setlocal nocursorcolumn
    setlocal nocursorline
    wincmd w
    call UpdateCommandList()
endfunction
" }-

" Function to autoclose the help window -{
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
" }-

" Open a new Command list if a new tab is opened
autocmd TabNew * if winnr('$') == 1 | call OpenCommandList() | endif

" Open a new Command list when the program starts
autocmd VimEnter * call OpenCommandList()

" Close the help buffer if needed
autocmd WinClosed * call CloseHelpAuto()

" }- 


" Coding Tools -{ 

" Autocomplete Pairs -{

inoremap { {}<Left>
inoremap <expr> } getline('.')[col('.') - 1] =~# '}' ? "\<Right>" : "}"

inoremap [ []<Left>
inoremap <expr> ] getline('.')[col('.') - 1] =~# ']' ? "\<Right>" : "]"

inoremap ( ()<Left>
inoremap <expr> ) getline('.')[col('.') - 1] =~# ')' ? "\<Right>" : ")"

inoremap < <><Left>
inoremap <expr> > getline('.')[col('.') - 1] =~# '>' ? "\<Right>" : ">"

" Checking for autocompletion of ", ', and ` -{
function! CheckAdd(char)
    " get the chars before and after the char of interest
    let afterChar=getline('.')[col('.') - 1]
    let beforeChar=getline('.')[col('.') - 2]

    " if the char after is the same, move past it
    if afterChar ==# a:char
        return "\<Right>"

    else
        " check to see if one is an alphanum
        if afterChar =~# '[[:alnum:]]' || beforeChar =~# '[[:alnum:]]'
            return a:char
    
        else
            " return a concatenation of the char
            return a:char . a:char . "\<Left>"

        endif

    endif

endfunction
" }-

inoremap <expr> " CheckAdd('"')

inoremap <expr> ' CheckAdd('''')

inoremap <expr> ` CheckAdd('`')


" Function to delete second of pair -{

function! DeletePair()
    
    " get the characters before and after the <BS>
    let beforeChar = getline('.')[col('.') - 2]
    let afterChar = getline('.')[col('.') - 1]

    if(beforeChar ==# '{' && afterChar ==# '}')
        return "\<BS>\<Del>"
    elseif(beforeChar ==# '[' && afterChar ==# ']')
        return "\<BS>\<Del>"
    elseif(beforeChar ==# '(' && afterChar ==# ')')
        return "\<BS>\<Del>"
    elseif(beforeChar ==# '<' && afterChar ==# '>')
        return "\<BS>\<Del>"
    elseif(beforeChar ==# '"' && afterChar ==# '"')
        return "\<BS>\<Del>"
    elseif(beforeChar ==# '''' && afterChar ==# '''')
        return "\<BS>\<Del>"
    elseif(beforeChar ==# '`' && afterChar ==# '`')
        return "\<BS>\<Del>"
    else
        return "\<BS>"
    endif

endfunction

" actually mapping out the <BS>
inoremap <expr> <BS> DeletePair()

" }-

" }-

" Auto Comment -{

" }-

" }-


" Markdown Tools -{
   
" Function to create Tables -{

function! CreateTable(...)

    " make sure the number of args is right
    if len(a:000) > 2
        echo "That is too many arguments"
        return
    elseif len(a:000) == 2
        let rows = a:1
        let cols = a:2
    elseif len(a:000) == 0
        let rows = input("Rows: ")
        let cols = input("Cols: ")
    else
        echo "That is not the right amount of arguments"
        return
    endif

    " Start making the table
    let oneRow = "|" . repeat("       |", cols)
    let header = "|" . repeat(" :---: |", cols)

    " print the table out with a new line before and after
    call append(line('.'), oneRow)
    call append(line('.') + 1, header)
    for i in range(1, rows)
        call append(line('.') + 1 + i, oneRow)
    endfor
    
    
endfunction

" }-

" Function to add lines -{ 

function! AddLine()

    " get the current line number
    let curLine = line('.')

    " get all ready for the substitution
    let pattern = '[^[:space:]|]'
    let replacement = ' '

    " add the new line with empty cells
    call append(curLine, substitute(getline(curLine), pattern, replacement, 'g'))

endfunction

" }-"

" Function to delete lines -{

function! DeleteLine()

    " delete the line
    normal! dd

endfunction

" }-



" }-










" this is for comments in vimrc specifically
inoremap <expr> -{ "-{}-<Left><Left>" 
