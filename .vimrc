set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" Navigation
Bundle 'kien/ctrlp.vim'

" UI
Bundle 'Lokaltog/vim-powerline'
Bundle 'laktek/distraction-free-writing-vim'
Bundle 'airblade/vim-gitgutter'

" Colors
Bundle 'chriskempson/vim-tomorrow-theme'

" Commands
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'

" Lang
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-liquid'
Bundle 'davidoc/taskpaper.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'rodjek/vim-puppet'
Bundle 'leshill/vim-json'
Bundle 'plasticboy/vim-markdown'


filetype plugin indent on   " custom indent per filetype
set t_Co=256
syntax on                   " syntax highlighting

" Base
set autoindent          " indent on next line
set backspace=2         " allow backspace over indent, eol, start insert
set cindent             " indent based on C programs

if has('syntax')
    set colorcolumn=80  " color column 80
endif

if has('cursorbind')
    "set cursorbind      " move cursor to corresponding line and column
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
        set guifont=PragmataPro\ for\ Powerline\ 10
    endif
endif

let g:fullscreen_colorscheme = "iawriter"
let g:fullscreen_font = "Cousine:h14"
let g:normal_colorscheme = cs
let g:normal_font="PragmataPro for Powerline:h12"

" function! DistractionFreeWriting()
"     colorscheme iawriter
"     set background=light
"     set lines=40 columns=80           " size of the editable area
"     set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color 
"     set guioptions-=r                  " remove right scrollbar
"     set laststatus=0                   " don't show status line
"     set noruler                        " don't show ruler
"     set fullscreen                     " go to fullscreen editing mode
"     set linebreak                      " break the lines on words
" endfunction
"
" :map <leader>d :call DistractionFreeWriting()<CR>
