
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
"   
"   This .vimrc file contains a ton of regular options that
"   you could find in any old .vimrc file. But that's not
"   the cool part...
"
"   This .vimrc file is well organized into many different
"   categories so that editing and manipulating it is made
"   much easier
"
"   These categories include:
"   - A list of commands that are available in insert mode
"     that allow you to easily do the things you would in 
"     normal mode
"   - A list of custom commands that call various functions
"     to make your life easier
"   - Functions that allow you to have a cheat sheet open
"     in your vim files so you can remember pesky key 
"     strokes without having to look them up constantly
"   - Functions that make writing MarkDown much easier such
"     as creating tables, adding rows, making check box
"     lists, writing subscript and superscript, writing
"     bold, and more
"   - Code that makes working in vim more similar to the 
"     IDEs that you are used to writing in; providing 
"     help with autocompleting pairs ({}, [], etc), 
"     changing line indentation, commenting out sections
"     of code, and more
"
"   I have tried to set this file up so it is easy to
"   understand, manipulate, and add to as you desire.
"
"   I have not included anything for any plugins, as I
"   found them frustrating to set up, but you can add 
"   whatever you would like.
"
"   Please enjoy this file and all it offers!
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
inoremap <leader>4 <Esc>$i<Right>
inoremap <leader>0 <Esc>0i
inoremap <leader>g <Esc>G
inoremap <leader>gg <Esc>gg


" File Operations
inoremap <leader><leader> <Esc>
inoremap <leader>q <Esc>:q!<Return>
inoremap <leader>x <Esc>:x<Return>
inoremap <leader>w <Esc>:w<Return>i<Right>

" Formatting Operations
inoremap <leader>o <Esc>o
inoremap <leader>r <Esc><C-r>
inoremap <leader>y <Esc>yi<Right>
inoremap <leader>p <Esc>pi<Right>
inoremap <leader>d <Esc>di<Right>
inoremap <leader>u <Esc>ui<Right>
inoremap <leader>dd <Esc>ddi


" Toggle Help Window
inoremap <leader>ch <Esc>:CH<Return>
inoremap <leader>oh <Esc>:OH<Return>

" Markdown Tools
inoremap <leader>ct <Esc>:CT<Return>
inoremap <leader>al <Esc>:AL<Return>
inoremap <leader>dl <Esc>:DL<Return>
inoremap <leader>ck <Esc>:CK<Return>


"}-

   
" Custom Commands -{

" Resize Help Window to Close/Open
command CH call ToggleHelp('CH') | startinsert
command OH call ToggleHelp('OH') | startinsert

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
command -nargs=? AL call AddLine(<f-args>) | startinsert
command -nargs=? DL call DeleteLine(<f-args>) | startinsert
command CK call AddCheckBox() | startinsert

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

        " do two returns, move up a line, and indent       
        let num = BeginSpaces()
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

set viminfo+=n'100 " set up to save marks in the file
set omnifunc=syntaxcomplete#Complete
set completeopt+=menuone,noselect
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
        \ "Delete line: dd",
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

" Change Indentation -{
"   
" }-

" }-


" Markdown Tools -{
 
" Function to create Tables -{

function! CreateTable(...)

    " initialize variables
    let oneRow = "|"
    let header = "|"
    let top = "|"
    let labels = []

    functi

    " get the args for the table details
    if len(a:000) > 2
        
        " get the rows and cols
        let rows = a:1
        let cols = a:2

        " get the labels
        for i in range(1, cols)
            let label = get(a:, i + 2, "")
            call add(labels, label)
        endfor

    " if you only got the rows and cols
    elseif len(a:000) == 2

        " get the rows and cols
        let rows = a:1
        let cols = a:2

        let oneRow .= repeat("       |", cols)
        let top .= repeat("       |", cols)
        let header .= repeat(" :---: |", cols)
        

    " if you got no args
    elseif len(a:000) == 0
        
        " get the rows and cols
        let rows = input("Rows: ")
        let cols = input("Cols: ")
        
        " get all the labels
        for i in range(1, cols)
            let label = input("Label ". i . ": ")
            call add(labels, label)    
        endfor
    
    endif

    " Start making the table
    for label in labels

        " get the length of the label
        let length = len(label)

        let one
        " update the different rows
        if length >= 5

            let top .= " " . label . " |"
            let header .= " :" . repeat("-", length - 2) . ": |"
            let oneRow .= repeat(" ", length + 2) . "|"

        else

            " see if it's odd or even
            if length % 2 == 0
                
                let top .= " " . repeat(" ", ((5 - length) / 2) + 1) . label . repeat(" ", (5-length) / 2) . " |"

            else
                
                let top .= " " . repeat(" ", (5 - length) / 2) . label . repeat(" ", (5 - length) / 2) . " |"

            endif

            let header .= " :---: |"
            let oneRow .= "       |"

        endif

    endfor

    " print the table out with a new line before and after
    call append(line('.'), top)
    call append(line('.') + 1, header)
    for i in range(1, rows)
        call append(line('.') + 1 + i, oneRow)
    endfor
    
    
endfunction

" }-

" Function to add lines -{ 

function! AddLine(...)

    " see if we got any args
    if(len(a:000) != 0)
        let end = a:1
    else
        let end = 1
    endif

    " get the current line number
    let curLine = line('.')

    " get all ready for the substitution
    let pattern = '[^[:space:]|]'
    let replacement = ' '

    " add the new line with empty cells
    for i in range(1,end)
    
        call append(curLine, substitute(getline(curLine), pattern, replacement, 'g'))

    endfor

endfunction

" }-"

" Function to delete lines -{

function! DeleteLine(...)

    " see if we got any args
    if(len(a:000) != 0)
        let end = a:1
    else
        let end = 1
    endif

    " delete the line
    for i in range(1,end)
    
        normal! dd

    endfor

endfunction

" }-

" Function to add check boxes -{
    
function! AddCheckBox()
        
    " get the number of tabs needed
    let tabs = BeginSpaces() / 4

    " return the CheckBox
    call append(line('.') - 1, repeat("\<Tab>", tabs) . '- [ ] ')
    normal! k
    normal! $l

endfunction

" }-

" }-


" Helper Functions -{

" Find the Number of spaces at the beginning of the line -{

function! BeginSpaces()

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

    return num

endfunction

" }-

" }-



" Sand Box {


" }


" this is for comments in vimrc specifically
inoremap <expr> -{ "-{}-<Left><Left>" 
