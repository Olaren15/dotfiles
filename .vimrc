let mapleader = " "
nnoremap <SPACE> <Nop>
set notimeout

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" line numbers / scrolling
set number
set relativenumber
set scrolloff=8

" indenting
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Others
set showmode
set showcmd
set list

" Scroll faaaaast
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>

" Faster access to system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Pane navigation
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-k> <C-w>k
nnoremap <A-j> <C-w>j
