" .vimrc

"------------------------------------------------------------
" colors

"colorscheme elflord
"colorscheme badwolf
"colorscheme solarized
"colorscheme torte
"colorscheme darkblue
colorscheme industry
"colorscheme molokai
"colorscheme slate
"set background=dark

"------------------------------------------------------------
" formatting

syntax enable

set tabstop=4       " spaces per tab
set softtabstop=4   " spaces when editing
set expandtab       " save tabs as spaces

"------------------------------------------------------------
" ui

set number          " line numbers
set showcmd         " bottom command bar
set cursorline      " highlight current line

filetype indent on  " file specific indent

set wildmenu        " autocomplete for menus
set lazyredraw      " redraw only when necessary
set showmatch       " highlight pairs of [{()}]

"------------------------------------------------------------
" search

set incsearch       " search as pattern is entered
set hlsearch        " highlight matches

" turn off search highlight with "<comma><space>"
nnoremap <leader><space> :nohlsearch<cr>

"------------------------------------------------------------
" folding

set foldenable      " enable folding
set foldlevelstart=10   " open top levels by default
set foldnestmax=10  " max fold depth

" <space> open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on source indent

"------------------------------------------------------------
" movement

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" suppress normal $/^
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last insert
nnoremap gV `[v`]

"------------------------------------------------------------
" movement

let mapleader=","       " leader is comma

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" save session
nnoremap <leader>s :mksession<CR>

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"------------------------------------------------------------
" language specific setup with autogroups

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"------------------------------------------------------------
" backup

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"------------------------------------------------------------
" end
"------------------------------------------------------------
