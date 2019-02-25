set background=light
colorscheme PaperColor
if !has('nvim')
    set term=screen-256color
endif
set guicursor=
set nocompatible

set clipboard=unnamedplus

syntax enable
set colorcolumn=80
set hlsearch
set incsearch

set softtabstop=4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

filetype indent plugin on

set number
set cursorline
set showcmd
set signcolumn=yes

set autoindent
set smartindent
set hidden

set encoding=utf8
set ffs=unix,dos,mac

set dir=~/.vim/swapfiles
set backup
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undodir

for ch in map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)')
    execute printf('inoremap <M-%s> <Esc>%s', ch, ch)
endfor

let mapleader = " "
nmap <expr> <bslash> mapleader

" Clear highlighting on escape in normal mode
" This can cause errors
" nnoremap <esc> :noh<return><esc>
" nnoremap <esc>^[ <esc>^[
" nnoremap <CR> :noh<CR>
nnoremap <leader>j :noh<CR>

inoremap <CR> <C-G>u<CR>
inoremap # X<BS>#
inoremap jk <esc>

packloadall
silent! helptags ALL

let g:ale_virtualenv_dir_names = []

set path+=**
set wildmenu
set wildmode=list:longest,full
set dictionary+=/usr/share/dict/words
set complete=.,w,b,u,t

set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap S :%s//g<Left><Left>

vnoremap <C-c> "+y
map <C-p> "+P
" Remove trailing space on safe.
autocmd BufWritePre * %s/\s\+$//e

vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

autocmd FileType python map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/ipython3)" run %:p Enter'<Bar>redraw!<C-M>
autocmd FileType matlab map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/matlab)" "$(basename % .m)" Enter'<Bar>redraw!<C-M>
