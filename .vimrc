" Kick off pathogen
call pathogen#infect()

" Base
set autoindent          " indent on next line
set backspace=2         " allow backspace over indent, eol, start insert
if has('colorcolumn')
    set colorcolumn=80  " color column 80
endif
set nocompatible        " explicitly turn off compaitable mode with Vi
if has('cursorbind')
    set cursorbind      " move cursor to corresponding line and column
endif
                            " requires +cursorbind feature
set cursorline          " hightlight the current line
set expandtab           " replace tabs with spaces
set nofoldenable        " turn off folding
set hidden              " hide buffer when it is abandoned
set nohlsearch          " hide highlighted searched text
"set ignorecase          " case-insensitive search
set incsearch           " incremental search while typing
set infercase           " infer the case of keyword completion
set nojoinspaces        " turn off inserting two spaces after punctuation
set laststatus=2        " always show the status line
set linebreak           " wrap long lines
set linespace=3         " linespacing
set number              " show line numbers
set numberwidth=3       " set width of line numbers
                            " requires +linebreak feature
set preserveindent      " only indent as much as needed
set ruler               " show the line and column number of cursor
                            " requires +cmdline_info feature
set shiftwidth=4        " number of spaces to use for each step
                            " of autoindent
set showbreak=:::\      " visual for showing breaks
set showcmd             " show partial command in last line of screen
set showmatch           " highlight matching bracket and briefly jump
set smartcase           " smarter case-sensitive search
"set smartindent         " smarter autoindenting for new line
                            " requires +smartindent feature
set smarttab            " use shiftwidth for tabs at front of line
set softtabstop=4       " number of sapces that tab counts for while editing
set tabstop=4           " width of tab character
set wildignore=*.o,*.py?,*~ " patterns to ignore
set wildmenu            " command-line completion enhanced mode
set wildmode=list:longest,full " behavior to autocompletion

" Optional
"set exrc                " enables reading from .*rc files from cd
"set listchars=tab:▸\ ,eol:¬    " custom characters for invisible chars
"set wrapmargin=10       " auto newline lines that need wrapping
                            " not good for code..
"set secure              " prevents running autocmd; use in conjunction 
                            " with `exrc'

filetype plugin indent on   " custom indent per filetype
set t_Co=256
syntax on                   " syntax highlighting

" Set color scheme according to current time of day.
let hr = str2nr(strftime('%H'))
if hr <= 6 || hr > 18
    let cs = 'Tomorrow-Night'
else
    let cs = 'Tomorrow'
endif
execute 'colorscheme '.cs

" Map left and right arrows to cycle through buffers
map <right> :bn<cr>
map <left> :bp<cr>
nnoremap <space> za


" Shortcut to toggle `set list`
nmap <leader>l :set list!<cr>

" Powerline
let g:Powerline_symbols = 'fancy'

" GUI specific
if has ("gui")
    set guicursor=a:blinkon0,ci-i:hor10     " blink cursor, underline
                                                " in insert mode
    set guioptions=ace                      " autoselect,console dialogs
                                                " tab pages
    if has ("macunix")
        set guifont=PragmataPro\ for\ Powerline:h12
    else
        set guifont=PragmataPro\ for\ Powerline\ 12
    endif
endif
