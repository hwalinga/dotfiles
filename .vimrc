if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'

Plug 'romainl/vim-cool'

Plug 'NLKNguyen/papercolor-theme'
Plug 'w0rp/ale'

Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'wellle/targets.vim'
Plug 'aldantas/vim-custom-surround'
Plug 'tmux-plugins/vim-tmux'

call plug#end()


so $VIMRUNTIME/defaults.vim
" Remove autocmd 'jump to last known cursor position'
" augroup vimStartup | au! | augroup END
autocmd BufEnter * set mouse=

let g:rainbow_active = 1
let g:rainbow_conf = {'ctermfgs': [238, 41, 170, 147]}

set background=light
colorscheme PaperColor
if !has('nvim')
    set term=screen-256color
endif
set guicursor=
set nocompatible
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': { 'highlight_builtins' : 1 },
  \     'cpp': { 'highlight_standard_library': 1 },
  \     'c': { 'highlight_builtins' : 1 }
  \   }
  \ }

set clipboard=unnamedplus

" syntax enable
set colorcolumn=80
set linebreak
set hlsearch
set number! relativenumber!
" set incsearch

set softtabstop=4
set shiftwidth=4
set tabstop=4
set softtabstop=4
" set smarttab
set expandtab

" filetype indent plugin on

set number
set cursorline
set showcmd
set signcolumn=yes

" set autoindent
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

call customsurround#map('<leader>b', '\fB', '\fP')
call customsurround#map('<leader>i', '\fI', '\fP')

" inoremap <CR> <C-G>u<CR>
inoremap # X<BS>#
inoremap jk <esc>
" nmap ; :
" map End key to end of line in command mode
cm OF 

set fo+=o
set fo-=r
set fo-=t

packloadall
silent! helptags ALL

let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

let g:ale_virtualenv_dir_names = []
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\}
let g:ale_fix_on_save = 1
"
" Remove trailing space on safe.
autocmd BufWritePre * %s/\s\+$//e

set path+=**
" set wildmenu
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

vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

autocmd FileType python map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/ipython3)" \%run\ %:p Enter'<Bar>redraw!<C-M>
autocmd FileType matlab map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/matlab)" "$(basename % .m)" Enter'<Bar>redraw!<C-M>

nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
