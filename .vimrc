set background=light
colorscheme PaperColor
if !has('nvim')
    set term=screen-256color
endif
set guicursor=

syntax enable
set colorcolumn=80 

set softtabstop=4
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

:inoremap # X<BS>#

filetype indent on

set number 
set cursorline
set showcmd
set signcolumn=yes

set autoindent
set smartindent
set hidden

set formatoptions+=o

inoremap jk <esc>

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

nmap <CR> o<ESC>
inoremap <CR> <C-G>u<CR>

packloadall
silent! helptags ALL

let g:ale_virtualenv_dir_names = []
