" kick off pathogen
call pathogen#infect()

" Buffer becomes hidden when it is abandoned
set hid

" general
set nocompatible

set hidden

" Turn off error bells
set noerrorbells

" Show current position
set ruler
set cursorline
set showcmd
set showmatch

" soft wrap
set wrap
set linebreak
set nolist

" number of columns for line numbers
set number
set nuw=3

" Show column at 80
set colorcolumn=80
set linespace=3
set numberwidth=3
set laststatus=2
set wildignore=*.o,*.py?,*~,*.bak
set wildmode=list:longest
"set statusline=%{fugitive#statusline()}%<\ %n:%f\ %m%r%y%=%-0.(\[%l\/%L\,%c%V\]\ (%P)%)

" tmp, backup
set backupdir=./.backup,.,/tmp
set directory=./.backup,.,/tmp

" search
set nohls
set incsearch
set showmatch

" -[ indentation ]-
set autoindent
set smartindent

" Shift width in normal mode
set shiftwidth=4
" Remove N spaces at a time
set softtabstop=4
" Width of a tab character
set tabstop=4
" Use spaces instead of tabs
set expandtab

" command mode
syntax on
set t_Co=256
colorscheme Tomorrow

" -[ FileTypes ]-
filetype plugin indent on

" Map left and right arrows to cycle through buffers
map <right> :bn<cr>
map <left> :bp<cr>
nnoremap <space> za


" Shortcut to toggle `set list`
nmap <leader>l :set list!<cr>

" Customize invisible characters
set listchars=tab:▸\ ,eol:¬

" Powerline
let g:Powerline_symbols = 'fancy'

" vimcasts.org tidying whitespace
function! Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<cr>
nmap _= :call Preserve("normal gg=G")<cr>

" GUI
if has ("gui")
    set guioptions=ce
    set mousehide
    if has ("macunix")
        set guifont=PragmataPro\ for\ Powerline:h12
    else
        set guifont=PragmataPro\ for\ Powerline\ 12
    endif
    set guicursor=a:blinkon0,ci-i:hor10

    " Open Marked.app for markdown files
    nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
endif
