" 1) Opening Notes -{
"
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
"     (I have a custom command list that you can have show 
"     when vim opens if you want that)
"   - Functions that make writing MarkDown much easier such
"     as creating tables, adding rows, making check box
"     lists, writing subscript and superscript, writing
"     bold, and more
"   - Code that makes working in vim more similar to the 
"     IDEs that you are used to writing in; providing 
"     help with autocompleting pairs ({}, [], etc),
"     commenting out sections of code, and more
"
"   Here is a list of mappings and commands that I have 
"   included in this file for use in vim (the same that
"   show in my custom command list in Section 13):
"   - Insert Mode:
"       - Open/Close a cheat sheet window on the side
"           - It is preset to show my commands, though
"             you can edit it to show whatever you want
"       - Run the Markdown commands
"       - Make a list in Markdown
"       - Change code indentation
"       - Toggle commented code
"       - Do normal mode commands with the <leader> key
"           - Copy/Paste
"           - Undo/Redo
"           - Move along the line
"           - Save/Quit
"           - Fold/Unfold Sections
"   - Normal Mode:
"       - Functions for Markdown notes to:
"           - Add check boxes
"           - Create a table
"           - Add rows to the table
"           - Add columns to the table
"           - Delete columns in the table
"   - Visual Mode:
"       - Comment out or in lines of code at a time
"       - Increase or decrease indentation
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


" 2) Folding Sections -{

set foldenable
set foldmethod=marker
if expand('%') =~# 'vimrc$' || expand('%') =~# 'bashrc$'
    set foldmarker=-{,}-
    set foldlevel=0
else
    set foldmarker={,}
    set foldlevel=99
endif
set foldminlines=2
set foldcolumn=0

" allows me to open and close with the mouse
nnoremap <silent> <2-LeftMouse> :call ToggleFold()<CR>
inoremap <silent> <2-LeftMouse> <C-o>:call ToggleFold()<CR>

function! ToggleFold()

if foldclosed(line('.')) == -1
    normal! zc
else
    normal! zo
endif

endfunction

"}-


" 3) Map Leader Commands -{

" Set the leader to do my own commands
let mapleader=";"

" Moving in file operations
inoremap <leader>4 <C-o>$
inoremap <leader>0 <C-o>0
inoremap <leader>G <C-o>G
inoremap <leader>gg <C-o>gg
inoremap <leader>b <C-o>b
inoremap <leader>e <C-o>e


" File Operations
inoremap <leader><leader> <Esc>
inoremap <leader>q <Esc>:q!<Return>
inoremap <leader>x <Esc>:x<Return>
inoremap <leader>w <Esc>:w<Return>i<Right>
inoremap <leader>s <Esc>:w<Return>:source ~/.vimrc<Return>

" Formatting Operations
imap <leader>n <Esc>o
imap <leader>N <Esc>O
inoremap <leader>r <C-o><C-r>
inoremap <leader>y <C-o>y
inoremap <leader>p <C-o>p
inoremap <leader>P <C-o>P
inoremap <leader>d <C-o>d
inoremap <leader>u <C-o>u
inoremap <leader>dd <C-o>dd


" Toggle Help Window
inoremap <leader>ch <Esc>:CH<Return>
inoremap <leader>oh <Esc>:OH<Return>

" Change Help Window
inoremap <leader>vim <Esc>:VIM<Return>
inoremap <leader>col  <Esc>:COL<Return>
" inoremap <leader>rh

" Markdown Tools
inoremap <leader>ct <C-o>:CT<CR>
inoremap <leader>al <C-o>:AL 1<CR>
inoremap <leader>ala <C-o>:AL 0<CR>
inoremap <leader>ac <C-o>:AC 1<CR>
inoremap <leader>acl <C-o>:AC 0<CR>
inoremap <leader>dc <C-o>:DC<CR>
inoremap <leader>ck <C-o>:CK 1<CR>
inoremap <leader>cka <C-o>:CK 0<CR>
inoremap <leader>` ```<CR><CR>```<Up>
inoremap <expr> <leader>bo AddTagI("<b>","</b>")
inoremap <expr> <leader>it AddTagI("<i>","</i>")
inoremap <expr> <leader>st AddTagI("<s>","</s>")
inoremap <expr> <leader>su AddTagI("<sup>","</sup>")
inoremap <expr> <leader>dn AddTagI("<sub>","</sub>")
inoremap <leader>fr <C-o>:FR<CR>
vnoremap <leader>bo :call AddTagV("<b>", "</b>")<CR>
vnoremap <leader>it :call AddTagV("<i>", "</i>")<CR>
vnoremap <leader>st :call AddTagV("<s>", "</s>")<CR>
vnoremap <leader>su :call AddTagV("<sup>", "</sup>")<CR>
vnoremap <leader>dn :call AddTagV("<sub>", "</sub>")<CR>

" Coding Tools
inoremap <leader>/o <C-o>:call Comment(&filetype, line('.'), 1)<CR>
inoremap <leader>/i <C-o>:call Comment(&filetype, line('.'), 0)<CR>
vnoremap <leader>/o :call Comment(&filetype, line('.'), 1)<CR>
vnoremap <leader>/i :call Comment(&filetype, line('.'), 0)<CR>
inoremap <leader>] <C-o>:call Indent(line('.'), 1)<CR>
inoremap <leader>[ <C-o>:call Indent(line('.'), 0)<CR>
vnoremap <leader>] :call Indent(line('.'), 1)<CR>
vnoremap <leader>[ :call Indent(line('.'), 0)<CR>

" R Tools
inoremap <leader>cat cat("\n\n")<Left><Left><Left><Left>
inoremap <leader>t TRUE
inoremap <leader>f FALSE
inoremap <leader>ll NULL
inoremap <leader>l \|>

"}-


" 4) Other Mappings -{

" Open/Close Brackets
inoremap zzc <C-o>zc
inoremap zzo <C-o>zo
inoremap zzM <C-o>zM
inoremap zzR <C-o>zR

" Add to Dictionary
inoremap zzg <C-o>zg

" Newline
nmap o A<CR>
nmap O <Up>A<CR>

" For Lists
inoremap <expr> <CR> CRFxn()
inoremap <expr> <Tab> ListIndent("\<Tab>")
inoremap <expr> <BS> BSFxn()

" Enter visual mode from insert mode
inoremap <C-v> <C-o>V

" Mappings for the Markdown Table function
" for letter in range(97, 122)
"     let char = nr2char(letter)
"     execute 'inoremap ' . char . ' ' . char . '<C-o>:call ColumnWidth()<CR>'
" endfor
" for Letter in range(65, 90)
"     let char = nr2char(Letter)
"     execute 'inoremap ' . char . ' ' . char . '<C-o>:call ColumnWidth()<CR>'
" endfor
" for number in range(48, 57)
"     let char = nr2char(number)
"     execute 'inoremap ' . char . ' ' . char . '<C-o>:call ColumnWidth()<CR>'
" endfor
" inoremap <Space> <Space><C-o>:call ColumnWidth(' ')<CR>

" }-


" 5) Custom Commands -{

" Resize Help Window to Close/Open
command! CH call ToggleHelp('CH') | startinsert
command! OH call ToggleHelp('OH') | startinsert
command! COL call OpenColorsWindow() | startinsert
command! VIM call UpdateCommandList() | startinsert

" Markdown Tools commands
command! -nargs=* CT call CreateTable(<f-args>) | startinsert
command! -nargs=? AL call AddLine(<f-args>) | startinsert
command! -nargs=? AC call AddColumn(<f-args>) | startinsert
command! DC call DeleteColumn() | startinsert
command! -nargs=? FR call Fraction(<f-args>) | call cursor(line('.'), col('$') + 1) | startinsert
command! -nargs=? CK call AddCheckBox(<f-args>) | call cursor(line('.'), col('$') + 1) | startinsert

" }-


" 6) Navigation and Visual Properties -{

set virtualedit+=onemore " allow cursor to stay at line end
syntax on " makes syntax highlighting work
set number " adds numbers on the left side of the screen
set cursorline " adds a white line under the cursor's line
set cursorcolumn " highlights the cursor's column
set mouse=a " Allows mouse movement and clicking

" Show whitespace
set list
set listchars=space:·,eol:.,trail:~,extends:>,precedes:>
highlight SpecialKey ctermfg=Grey

" }-


" 7) Windows and Tabs -{

" Move to other windows
map <C-j> <C-W>j
map <C-k> <C-W>
map <C-l> <C-W>l
map <C-h> <C-W>h

set splitright " vertical split to the right of the current window
set splitbelow " horizontal split below the current window

" }-


" 8) Indentation -{
set breakindent " makes the wrapped line indent match the OG
set breakindentopt=shift:2 " shifts that broken line 2 over
set shiftwidth=4 " makes auto indents 4 spaces
set tabstop=4 " makes tab 4 spaces long
set softtabstop=4 " make it so delete all 4 tab spaces at once
set expandtab " makes tab actually spaces
filetype indent on " Sets indent rules based on filetype
set smartindent " Enables auto indent based on context

" Function to set up brackets for a function -{
function! BracketIndent()

    " see if the characters are { and }
    if getline(line('.'))[col('.') - 2] ==# '{' && getline('.')[col('.') - 1] ==# '}'

        " do two returns, move up a line, and indent
        let [num, char, char2] = SpacesAndFirstChar('.')
        return "\<CR>\<CR>" . "\<Up>" . repeat("\<Tab>", num / 4 + 1)

    endif 

    " return just the <CR> else
    return "return"

endfunction

" }-

" }-


" 9) Line Wrapping -{

set whichwrap+=<,>,h,l,[,] " Allows move by line wrapping

" Move on wrapped lines to the next row, not the next line
noremap j gj
noremap k gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

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


" 10) Searching -{

set incsearch " highlights matching characters as you search
set ignorecase " searches capitals even if you don't type them
set smartcase " if you type capitals, it matches case
set showmatch " show the matching brackets and parentheses and such
set nohlsearch " does not persist in highlighting the previous search

"}-"


" 11) Status Bar and Command Line -{

set history=1000 " let the command history be large
set wildmode=list:longest " shows multiple options for autocomplete
set wildmenu " enables autocompletion of commands with TAB
set showmode " shows the mode you are in on the command line
set showcmd " shows partial commands at the bottom right
set ruler " show line and column number in the status bar

" }-"


" 12) Run Configuration -{

set spell " Check spelling

" Set up the file to ignore words for checking
let $MYSPELL = expand('~') . '.vim/spell/en.utf-8.add' 

set omnifunc=syntaxcomplete#Complete
set completeopt+=menuone,noselect
set modeline " allows mode line options for files

set encoding=utf-8 " Sets the UTF encoding to 8
set fileformat=unix " Use LF for line terminator

" Ignore certain file types for vim
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Sets up the path to python for Vim plugins
set pythonthreedll=C:/Users/bat20/AppData/Local/Programs/Python/Python311/python311.dll 
set pythonthreehome=C:/Users/bat20/AppData/Local/Programs/Python/Python311/

" Show a column at the left with notifications
set signcolumn=yes

" Stop errors from showing or sounding
set noerrorbells visualbell t_vb=

" Sets up undo control
set nobackup " Doesn't save backup files
set noswapfile " Doesn't store .swp files
set undodir=~/.vim/undodir
set undofile

"}-


" 13) Popup Menu Configuration -{

set completeopt+=longest " complete the longest common text
set completeopt+=menuone " show even if there's one item
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt><Down>" : ""<CR>'

" }-"


" 14) Cheat Sheet Window -{

" Function to focus on Command Window and back -{
function! ToggleHelp(command)

    " get the current buffer that is in focus
    let curBuf = bufnr('%')
    let curWin = bufwinnr(curBuf)

    " find the buffer for the help window
    let helpBuf = bufnr('CheatSheet')
    let helpWin = bufwinnr(helpBuf)

    " make sure the help buffer is open
    if helpWin != -1
        execute helpWin . "wincmd w"
    else
        echom "The help window is not open in this tab"
        return
    endif

    " execute the command
    if a:command ==# 'CH'
        vertical resize 0
    elseif a:command ==# 'OH'
        vertical resize 22
    else
        echom "That is not an appropriate command"
        return
    endif

    " return to the previous window
    execute curWin . "wincmd w"

endfunction
"}-

" Function to show the command list -{
function! UpdateCommandList()

    let command_list = [
        \ "     Vim Commands     .",
        \ "-----------------------",
        \ "<l>4   -> end line    .",
        \ "<l>0   -> start line  .",
        \ "<l>G   -> end file    .",
        \ "<l>gg  -> start file  .",
        \ "<l>e   -> end word    .",
        \ "<l>b   -> start word  .",
        \ "<l>q   -> quit, !save .",
        \ "<l>x   -> quit, save  .",
        \ "<l>w   -> save        .",
        \ "<l>n   -> newline     .",
        \ "<l>N   -> newline up  .",
        \ "<l>y   -> copy        .",
        \ "<l>p   -> paste below .",
        \ "<l>P   -> paste above .",
        \ "<l>d   -> cut         .",
        \ "<l>u   -> undo        .",
        \ "<l>r   -> redo        .",
        \ "<l>dd  -> delete line .",
        \ "<l>ch  -> close help  .",
        \ "<l>oh  -> open help   .",
        \ "<l>vim -> Vim help    .",
        \ "<l>col -> colors help .",
        \ "<l>rh  -> R help      .",
        \ "<l>ct  -> make table  .",
        \ "<l>al  -> add row     .",
        \ "<l>ac  -> add col     .",
        \ "<l>dc  -> delete col  .",
        \ "<l>ck  -> add check   .",
        \ "<l>bo  -> set bold    .",
        \ "<l>it  -> set italics .",
        \ "<l>st  -> set striked .",
        \ "<l>su  -> superscript .",
        \ "<l>dn  -> subscript   .",
        \ "<l>fr  -> fraction    .",
        \ "<l>/o  -> comment on  .",
        \ "<l>/i  -> comment off .",
        \ "<l>]   -> up indent   .",
        \ "<l>[   -> down indent .",
        \ "<l>zzc -> close fold  .",
        \ "<l>zzo -> open fold   .",
        \ "<l>zzM -> close folds .",
        \ "<l>zzR -> open folds  .",
        \ "<l>zzg -> add word    .",
        \ "<C-v>  -> visual line .",
        \ "",
        \ "",
        \ ]

    " Insert new content
    call setbufline('CheatSheet', 1, command_list)

endfunction
" }-

" Function for opening command window -{
function! OpenCommandList()
    leftabove vertical split CheatSheet
    vertical resize 0
    setlocal nowrap
    setlocal listchars=extends:\|,
    setlocal winfixwidth
    setlocal nonumber
    setlocal nocursorcolumn
    setlocal nocursorline
    setlocal signcolumn=no
    wincmd w
    call UpdateCommandList()
endfunction
" }-

" Function to autoclose the help window -{
function! CloseHelpAuto()

    if bufwinnr('CheatSheet') != -1 
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

" Declare the triggers -{

" Open a new Command list if a new tab is opened
autocmd TabNew * if winnr('$') == 1 | call OpenCommandList() | endif

" Open a new Command list when the program starts
autocmd VimEnter * call OpenCommandList()

" Close the help buffer if needed
autocmd WinClosed * call CloseHelpAuto()

" }-

" Open the colors cheat sheet -{

function! OpenColorsWindow()

    " declare the list
    let color_list = [
    \ "     Format Codes     .",
    \ "----------------------.",
    \ "Escape    \\u001b      .",
    \ "Clear     Esc[HEsc[2J .",
    \ "Bold      Esc[2K      .",
    \ "Faint     Esc[2m      .",
    \ "RS BF     Esc[22m     .",
    \ "Italic    Esc[3m      .",
    \ "RS It     Esc[23m     .",
    \ "Underline Esc[4m      .",
    \ "RS Un     Esc[24m     .",
    \ "Blink     Esc[5m      .",
    \ "RS Bl     Esc[25m     .",
    \ "Text Col  Esc[38;5;   .",
    \ "RS Text   Color + 0m  .",
    \ "BG Color  Esc[48;5;   .",
    \ "RS BG     BG + 0m     .",
    \ "                      .",
    \ "      Color Codes     .",
    \ "----------------------.",
    \ "Black           0m    .",
    \ "Light Grey      242m  .",
    \ "Dark Grey       235m  .",
    \ "Red             160m  .",
    \ ".Green          46m   .",
    \ ".Dark Green     22m   .",
    \ ".Yellow         226m  .",
    \ ".Blue           12m   .",
    \ ".Magenta        5m    .",
    \ ".Dark Purple    56m   .",
    \ ".White          15m   .",
    \ ".Cyan           51m   .",
    \ ".Light Cyan     87m   .",
    \ ".Orange         208m  .",
    \ ".Pink           13m   .",
    \ ".Light Pink     218m  .",
    \ ".Brown          94m   .",
    \ ".Light Brown    136m  .",
    \ ".Purple         129m  .",
    \ ".Light Purple   177m  .",
    \ ".Teal           37m   .",
    \ ".Light Teal     43m   .",
    \ "",
    \ "",
    \ "",
    \ "",
    \ ]

    " set it in the window
    call setbufline('CheatSheet', 1, color_list)

endfunction

" }-

" }-


" 15) Coding Tools -{

" Autocomplete Pairs -{

" Checking for autocompletion of ", ', and ` -{

function! CheckAdd(char1, char2)

    " get the chars before and after the char of interest
    let afterChar=getline('.')[col('.') - 1]
    let beforeChar=getline('.')[col('.') - 2]

    " if the char after is the same, move past it
    if afterChar ==# a:char1
        return "\<Right>"

    else
        " check to see if one is an alphanum
        if afterChar =~# '[[:alnum:]\|<\|[\|{\|(]' || (index(['"', "'", '`'], a:char1) >= 0 && beforeChar =~# '[[:alnum:]\|?\|\.\|,\|>\|]\|}\|)\|!\|:]')
            return a:char1

        else
            " return a concatenation of the char
            return a:char1 . a:char2 . "\<Left>"

        endif

    endif

endfunction
" }-

inoremap <expr> { CheckAdd('{', '}')
inoremap <expr> } getline('.')[col('.') - 1] =~# '}' ? "\<Right>" : "}"

inoremap <expr> [ CheckAdd('[', ']')
inoremap <expr> ] getline('.')[col('.') - 1] =~# ']' ? "\<Right>" : "]"

inoremap <expr> ( CheckAdd('(', ')')
inoremap <expr> ) getline('.')[col('.') - 1] =~# ')' ? "\<Right>" : ")"

inoremap <expr> " CheckAdd('"', '"')

inoremap <expr> ' CheckAdd('''', '''')

inoremap <expr> ` CheckAdd('`', '`')


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
        return "return"
    endif

endfunction

" }-

" }-

" Auto Comment -{

function! Comment(ft, line, on)

    " Let's start by getting the appropriate comment mark

    if index(['python', 'ruby', 'perl', 'sh', 'yaml', 'r', 'make', 'tcl', 'awk', 'gherkin', 'haskell'], a:ft) >= 0
        let commentMark = "#"
    elseif index(['javascript', 'java', 'cpp', 'c', 'cs', 'go', 'rust', 'kotlin', 'swift', 'scala', 'dart', 'php', 'typescript', 'ogjc'], a:ft) >= 0
        let commentMark = "//"
    elseif a:ft == 'vim'
        let commentMark = "\""
    elseif index(['asm', 'lisp', 'scheme'], a:ft) >= 0
        let commentMark = ";"
    elseif index(['matlab', 'prolog', 'tex'], a:ft) >= 0
        let commentMark = "%"
    elseif index(['lua', 'sql', 'ada'], a:ft) >= 0
        let commentMark = "--"
    else
        return
    endif

    " Then we can add/remove the mark from the start of the line

    call setline(a:line, a:on ? commentMark . " " . getline(a:line) : strpart(getline(a:line), len(commentMark) + 1))

endfunction
" }-

" Change Indentation -{
function! Indent(line, right)

    " get the number of spaces at the beginning
    let [num, char, char2] = SpacesAndFirstChar('.')

    " remove or add the first 4 spaces
    call setline(a:line, a:right ? "    " . getline(a:line) : num >= 4 ? strpart(getline(a:line), 4) : getline(a:line))

endfunction

" }-

" }-


" 16) Markdown Tools -{

" Function to create Tables -{

function! CreateTable(...)

    " initialize variables
    let oneRow = "|"
    let header = "|"
    let top = "|"
    let labels = []

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

        " get the columns and add them
        let [head, heads, row] = MakeTableColumns(label)
        let top .= head
        let header .= heads
        let oneRow .= row

    endfor

    " print the table out with a new line before and after
    call append(line('.'), top)
    call append(line('.') + 1, header)
    for i in range(1, rows)
        call append(line('.') + 1 + i, oneRow)
    endfor

endfunction

" }-

" Function to add lines (default below) -{ 

function! AddLine(below, ...)

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

        call append(curLine + (a:below ? 0 : -1), substitute(getline(curLine), pattern, replacement, 'g'))

    endfor

endfunction

" }-"

" Function to add columns (default on the right) -{

function! AddColumn(right, ...)

    " see if we have an arg and get the name
    if len(a:000) != 0
        let name = a:1
    else
        let name = input("Name: ")
    endif

    " make the columns
    let [header, justify, filler] = MakeTableColumns(name)

    " find the rows we need to loop over to add to
    let [beg, fin] = AboveBelow('.')

    " find the pipe to add next to
    let pipe = SidePipe('.', a:right)

    " set the first two rows
    call setline(beg, strpart(getline(beg), 0, pipe) . header . strpart(getline(beg), pipe))
   call setline(beg + 1, strpart(getline(beg + 1), 0, pipe) . justify . strpart(getline(beg + 1), pipe))

   " then the rest
    for line in range(beg + 2, fin)
        call setline(line, strpart(getline(line), 0, pipe) . filler . strpart(getline(line), pipe))
    endfor

endfunction

" }-

" Function to delete columns -{

function! DeleteColumn()

    " get the pipe on the left and right
    let leftPipe = SidePipe('.', 0)
    let rightPipe = SidePipe('.', 1)

    " get the rows that need to be gone
    let [beg, fin] = AboveBelow('.')

    " loop those and delete everything between the pipes
    for line in range(beg, fin)
        call setline(line, strpart(getline(line), 0, leftPipe) . strpart(getline(line), rightPipe))
    endfor

endfunction

" }-"

" Function to add check boxes (default below) -{

function! AddCheckBox(below)

    " get the number of tabs needed
    let [num, char, char2] = SpacesAndFirstChar('.')
    let tabs = num / 4

    " return the CheckBox
    call append(line('.') + (a:below ? 0 : -1), repeat("\<Tab>", tabs) . '- [ ] ')

    " move appropriately
    if a:below
        normal! j
    else
        normal! k
    endif

endfunction

" }-

" Function to loop list lines -{

function! LeftList()

    " see if  we are in a list or table (if table, move to the next cell with
    " right or left; if list, move to the next line up, only left going)

endfunction

" }-

" Function for list and table cursor placement -{

function! CursorMoved()

    " see if we are on a table line
    if getline('.') =~ '^\s*|.*|\s*$'

        " see if we are in the table, if not, move us into the table
        if col('.') == col('$')
            call cursor(line('.'), col('$') - 1)
            return
        elseif col('.') == 1
            call  cursor(line('.'), 2)
            return
        endif

        " get the ends of the cell we are in
        let left = SidePipe('.', 0)
        let right = SidePipe('.', 1) - 1

        " see if we are in an empty cell and move to the middle if we are
        if strpart(getline('.'), left, right-left) =~ '^\s*$'
            call cursor(line('.'), left + 1 + (right - left) / 2)
        endif


    " see if we are in a list now
    else

        " get the num of spaces and the first characters
        let [num, char, char2] = SpacesAndFirstChar('.')

        " if the first char is -, see where we are in the line
        if char ==# '-'

            if col('.') < num + 3

                call cursor(line('.'), num + 3)

            endif

        endif

    endif

endfunction

autocmd CursorMoved * call CursorMoved()
autocmd CursorMovedI * call CursorMoved()

" }-

" Function to change column width in tables -{

function! ColumnWidth(arg='')

    " see if we are in a table
    let line = getline('.')
    if line =~ '^\s*|.*|\s*$'

        " get the left and right side and the column content
        let left = SidePipe('.', 0)
        let right = SidePipe('.', 1)
        let colContent = strpart(line, left, right - left - 1)

        " get the width of the content and the max width we can have
        let maxWidth = len(colContent) - 2
        let length = a:arg == ' ' ? len(matchstr(colContent, '\a\+\( \a\+\)*\s')) : len(matchstr(colContent, '\a\+\( \a\+\)*'))

        " adjust the column size appropriately
        let curCol = col('.')
        if maxWidth > length
            if length % 2 == 1
                call setline(line('.'), strpart(line, 0, curCol - 1) . strpart(line, curCol))
            else
                call setline(line('.'), strpart(line, 0, left) . strpart(line, left + 1))
                call cursor(line('.'), col('.') - 1)
            endif
        else
            " we have to update all lines, not just the one we are on
            let [beg, fin] = AboveBelow('.')

            " update the :---: row
            call setline(beg + 1, strpart(getline(beg + 1), 0, left + 3) . "-" . strpart(getline(beg + 1), left + 3))

            " update the other rows
            if length % 2 == 1
                call setline(beg, strpart(getline(beg), 0, left) . ' ' . strpart(getline(beg), left))
                for line in range(beg + 2, fin)
                    if line == line('.')
                        continue
                    endif
                    call setline(line, strpart(getline(line), 0, left) . ' ' . strpart(getline(line), left))
                endfor

            else
                call setline(beg, strpart(getline(beg), 0, right - 2) . ' ' . strpart(getline(beg), right - 2))
                for line in range(beg + 2, fin)
                    if line == line('.')
                        continue
                    endif
                    call setline(line, strpart(getline(line), 0, right - 2) . ' ' . strpart(getline(line), right - 2))
                endfor

            endif

        endif

    else
        return "return"
    endif

endfunction

" }-

" Function to make lists -{

function! ListIndent(option)

    " get the num of spaces and the first character
    let [num, char, char2] = SpacesAndFirstChar('.')

    " see if it is the right first char
    if char ==# '-'

        " if we don't have anything but the -
        if getline('.') =~ '^\s*-[ ]$'

            " if we are pressing enter
            if a:option =~# "\<CR>"

                " if we are at the beginning of the row
                if col('.') < 4

                    return repeat("\<BS>", (num / 4) + 2)

                else

                    return repeat("\<BS>", (num / 4) + 2) . repeat("\<Tab>", (num / 4) - 1) . "- "

                endif

            elseif a:option =~# "\<Tab>"

                return repeat("\<BS>", (num / 4) + 2) . repeat("\<Tab>", (num / 4) + 1) . "- "

            elseif a:option =~# "\<BS>"

                return repeat("\<BS>", (num / 4) + 2)

            endif

        else

            " if we are pressing enter
            if a:option =~# "\<CR>"
                return "\<CR>" . "- "

            elseif a:option =~# "\<Tab>"

                return "\<Tab>"

            elseif a:option =~# "\<BS>"

                return "\<BS>"

            endif

        endif

    else

        return a:option

    endif

endfunction

" }-

" Function to make fractions -{

function! Fraction(...)

    " check if we have the right number of args
    if len(a:000) == 2

        " set the vars for the fraction
        let num1 = a:1
        let num2 = a:2

    else

        " get the args 
        let num1 = input("Numerator: ")
        let num2 = input("Denominator: ")

    endif

    " return the fraction"
    call setline(line('.'), getline('.') . "<sup>" . num1 . "</sup>/<sub>" . num2 . "</sub>")

endfunction

" }-

" Function to add HTML tags in visual mode -{

function! AddTagV(first, second)

    " get the beginning and end of the selection
    let beg = getpos("'<")[2] - 1
    let fin = getpos("'>")[2]

    " get the line first
    let line = getline('.')

    " put the tags in place
    call setline(line('.'), strpart(line, 0, beg) . a:first . strpart(line, beg, fin - beg) . a:second . strpart(line, fin))

endfunction

" }-

" Function to add HTML tags in insert mode -{

function! AddTagI(first, second)

    " find the char before and after the current col
    let line = getline('.')
    let col = col('.')

    let before = strpart(line, col - 2, 1)
    let after = strpart(line, col - 1, 1)

    " set the line based on what value we are next to
    if (before == ' ' || col == 1) && (after == ' ' || col == col('$'))
        return a:first . a:second . repeat("\<Left>", len(a:second))
    elseif before == ' '
        return a:first
    else
        return a:second
    endif

endfunction

"  }-

" }-


" 17) Helper Functions -{

" Get Lines above and below in tables -{

function! AboveBelow(ln)

    " find all lines above and below that are part of a table
    let curLine = line(a:ln)
    let startLine = 0
    let endLine = 0

    " above first
    while 1
        if getline(curLine - startLine) =~ '^\s*|.*|\s*$'
            let startLine = startLine + 1
            continue
        else
            let startLine = startLine - 1
            break
        endif
    endwhile

    " below next
    while 1
        if getline(curLine + endLine) =~ '^\s*|.*|\s*$'
            let endLine = endLine + 1
            continue
        else
            let endLine = endLine - 1
            break
        endif
    endwhile

    return [curLine - startLine, curLine + endLine]

endfunction


" }-

" Get Pipe position in tables -{

function! SidePipe(ln, right)

    " get the current col
    let curCol = col(a:ln) - 1

    " set up the trackers based on which side we want
    let pipePos = a:right ? 0 : -1
    let mover = a:right ? 1 : -1

    " get the line and loop it until we hit a pipe
    let line = getline(a:ln)
    while 1
        if strpart(line, curCol + pipePos, 1) ==# '|'
            let pipePos = pipePos + 1
            break
        else
            let pipePos = mover + pipePos
            continue
        endif
    endwhile

    return pipePos + curCol


endfunction

" }-

" Make Table headers, justify, and filler columns -{

function! MakeTableColumns(name)

    " make the header, justification, and filler based on size
    let length = len(a:name)

    if length >= 5
        let header = " " . a:name . " |"
        let justify = " :" . repeat("-", length - 2) . ": |"
        let filler = repeat(" ", length + 2) . "|"
    else

        " see if it's odd or even
        if length % 2 == 0
            let header = " " . repeat(" ", ((5 - length) / 2) + 1) . a:name . repeat(" ", (5 - length) / 2) . " |"
        else
            let header = " " . repeat(" ", (5 - length) / 2) . a:name . repeat(" ", (5 - length) / 2) . " |"
        endif

        let justify = " :---: |"
        let filler = "       |"

    endif

    return [header, justify, filler]

endfunction


" }-

" Get # spaces at beginning of line and first non space character -{

function! SpacesAndFirstChar(ln)

    " find out how many tabs to do
    let chars = getline(a:ln)
    let num = 0
    let char = ''
    while 1
        if chars[num] ==# ' '
            let num += 1
        else
            let char = chars[num]
            let char2 = chars[num]
            break
        endif
    endwhile

    return [num, char, char2]

endfunction

" }-

" <CR> Functions -{

function! CRFxn()

    " get the return from bracket first
    let ret = BracketIndent()
    
    " if it is just a <CR>, do the next function
    if ret =~# "return"
        let ret = ListIndent("\<CR>")
    endif

    return ret

endfunction

" }-

" <BS> Functions -{

function! BSFxn()

    " see if we are in a table first
"     let ret = ColumnWidth('bs')
    let ret="return"

    " if it is not in a table, see delete pair
    if ret =~# "return"
        let ret = DeletePair()
    endif

    " if it is just a <BS>, do the next function
    if ret =~# "return"
        let ret = ListIndent("\<BS>")
    endif

    return ret

endfunction

" }-

" }-


" 18) Abbreviations -{

abbrev alpha α
abbrev beta β
abbrev gamma γ
abbrev delta δ
abbrev epsilon ε
abbrev zeta ζ
abbrev eta η
abbrev theta θ
abbrev iota ι
abbrev kappa κ
abbrev lambda λ
abbrev mu μ
abbrev nu ν
abbrev xi ξ
abbrev omicron ο
abbrev pi π
abbrev rho ρ
abbrev sigma σ
abbrev tau τ
abbrev upsilon υ
abbrev phi φ
abbrev chi χ
abbrev psi ψ
abbrev omega ω

abbrev Alpha Α
abbrev Beta Β
abbrev Gamma Γ
abbrev Delta Δ
abbrev Epsilon Ε
abbrev Zeta Ζ
abbrev Eta Η
abbrev Theta Θ
abbrev Iota Ι
abbrev Kappa Κ
abbrev Lambda Λ
abbrev Mu Μ
abbrev Nu Ν
abbrev Xi Ξ
abbrev Omicron Ο
abbrev Pi Π
abbrev Rho Ρ
abbrev Sigma Σ
abbrev Tau Τ
abbrev Upsilon Υ
abbrev Phi Φ
abbrev Chi Χ
abbrev Psi Ψ
abbrev Omega Ω

" }-

" TODO: make it so I can remove the - easily like comments
" TODO: make it so I can use a,b,c and i,ii,iii in lists
" TODO: make a function to find the next char to use in a list (for indent) or
" the previous one that should be used (for back indent)
" TODO: make it so when we change indentation, we change the thing at the
" beginning of the list
" TODO: make a function to find if what is at the beginning of the line is for" a list or not
" TODO: update cursor movement to wrap tables and lists (lists at beginning,
" tables at the edge of either column)
" TODO: incorporate BS and Delete into the table width adjustment (from their functions, call and add necessary spaces to the column to make up for loss)



" this is for comments in vimrc specifically
inoremap <expr> -{ "-{}-<Left><Left>"
