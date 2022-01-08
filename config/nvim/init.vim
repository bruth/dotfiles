call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bruth/vim-newsprint-theme'
Plug 'ekalinin/Dockerfile.vim'
Plug 'zaki/zazen'

call plug#end()

filetype plugin indent on

set termguicolors
set background=light

colorscheme newsprint

set number
set encoding=utf-8

set autoindent          " indent on next line
set backspace=2         " allow backspace over indent, eol, start insert
set cindent             " indent based on C programs

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
set linespace=5         " linespacing
set number              " show line numbers
set numberwidth=3       " set width of line numbers
                            " requires +linebreak feature
set ruler               " show the line and column number of cursor
                            " requires +cmdline_info feature
set shiftwidth=2        " number of spaces to use for each step
                            " of autoindent
set showbreak=...\      " visual for showing breaks
set showcmd             " show partial command in last line of screen
set showmatch           " highlight matching bracket and briefly jump
set smartcase           " smarter case-sensitive search
set smartindent         " smarter autoindenting for new line
                            " requires +smartindent feature
set smarttab            " use shiftwidth for tabs at front of line
set softtabstop=2       " number of sapces that tab counts for while editing
set tabstop=2           " width of tab character
set title               " changes the terminal's title
set wildignore=*.o,*.py?,*.sw?,*.bak,*~ " patterns to ignore
set wildmenu            " command-line completion enhanced mode
set wildmode=list:longest,full " behavior to autocompletion

set relativenumber

" Map left and right arrows to cycle through buffers
map <right> :bn<cr>
map <left> :bp<cr>

" Strip all trailing whitespace
if has('autocmd')
    autocmd FileType sql,python,javascript,yaml,html,css,scss,markdown,xml autocmd BufWritePre <buffer> :%s/\s\+$//e
    autocmd FileType sql,javascript,typescript,yaml,html,css,scss set ts=2 sts=2 sw=2
endif

" --
" Go
" --
let g:go_null_module_warning = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" ---
" coc
" ---

" \ 'coc-prettier',
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-tslint-plugin',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-yank',
      \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" vim-prettier
" Run on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
