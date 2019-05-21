if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" VIM/NVIM -- SANE DEFAULTS
if !has('nvim')
    " set term=screen-256color
    " set t_Co=256
    set term=rxvt-unicode-256color
    so $VIMRUNTIME/defaults.vim
else
    so ~/dotfiles/defaults.vim
endif
" Remove autocmd 'jump to last known cursor position'
" augroup vimStartup | au! | augroup END
" autocmd BufEnter * set mouse=

let mapleader = " "
nmap <expr> <bslash> mapleader

call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" vim-easy-align

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-ragtag'
" tbone?

Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'mustache/vim-mustache-handlebars'
Plug 'vimwiki/vimwiki'

" Plug 'romainl/vim-cool'
Plug 'jiangmiao/auto-pairs'

Plug 'luochen1990/rainbow'
" , { 'on': 'LoadRainbow' }
Plug 'Yggdroot/indentLine'
Plug 'NLKNguyen/papercolor-theme'
Plug 'w0rp/ale'

Plug 'wellle/targets.vim'
Plug 'aldantas/vim-custom-surround'

Plug 'tmux-plugins/vim-tmux'

Plug 'Houl/repmo-vim'

" Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'

Plug 'drmikehenry/vim-fixkey'

call plug#end()

" RAINBOW
let g:rainbow_active = 1
let g:rainbow_conf = {'ctermfgs': [238, 41, 170, 147]}

map <leader>r :RainbowToggle<enter>

au BufRead,StdinReadPost * if getline(1) =~ '<html>' | setlocal ft=html | endif
au StdinReadPost * if getline(1) =~ '[\|{' | setlocal ft=json | endif

au BufEnter * if &ft ==# 'html' | exec 'RainbowToggleOff' | endif

" Latex
" let g:tex_flavor='latex'

" HTML
let g:html_indent_script1 = "inc"
" Map shift enter
" inoremap [13;2u <CR><ESC>O
inoremap <M-Enter> <CR><ESC>O


let g:user_emmet_mode='a'
imap <C-y>, <esc>$<Plug>(emmet-expand-abbr)
nmap <C-y>, $<Plug>(emmet-expand-abbr)

" THEME
set background=light
colorscheme PaperColor
set guicursor=
set nocompatible
let g:PaperColor_Theme_Options = {
\   'language': {
\    'python': { 'highlight_builtins' : 1 },
\    'cpp': { 'highlight_standard_library': 1 },
\    'c': { 'highlight_builtins' : 1 }
\   }
\}

" FILE DIRS
set dir=~/.vim/swapfiles
set backup
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undodir

" NUMBERS AND SUCH
set colorcolumn=80
set linebreak
set hlsearch
set number! relativenumber!
" set incsearch
set cursorline
set showcmd
set signcolumn=yes

" TABS
set tabstop=8
set softtabstop=4
set shiftwidth=4
" set smarttab
set expandtab
let g:vim_indent_cont = 0

" set autoindent
set smartindent
set hidden

au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2

" indentLine uses conceal, disable for markdown and json.
let g:indentLine_fileTypeExclude = ['markdown', 'json']

" GENERAL
set encoding=utf8
set ffs=unix,dos,mac
set clipboard^=unnamed,unnamedplus

packloadall
silent! helptags ALL

set path+=**
" set wildmenu
set wildmode=list:longest,full
set dictionary+=/usr/share/dict/words
set complete=.,w,b,u,t

" MAPPINGS
" nvim behave like normal command line.
" for ch in map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)')
"     execute printf('inoremap <M-%s> <Esc>%s', ch, ch)
" endfor

call customsurround#map('<leader>b', '\fB', '\fP')
call customsurround#map('<leader>i', '\fI', '\fP')

" map a motion and its reverse motion:
:noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
:noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

" if you like `:noremap j gj', you can keep that:
:map <expr> j repmo#Key('gj', 'gk')|sunmap j
:map <expr> k repmo#Key('gk', 'gj')|sunmap k

" repeat the last [count]motion or the last zap-key:
:map <expr> ; repmo#LastKey(';')|sunmap ;
:map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;' or `,':
:noremap <expr> f repmo#ZapKey('f')|sunmap f
:noremap <expr> F repmo#ZapKey('F')|sunmap F
:noremap <expr> t repmo#ZapKey('t')|sunmap t
:noremap <expr> T repmo#ZapKey('T')|sunmap T

" inoremap <CR> <C-G>u<CR>
inoremap # X<BS>#
inoremap kj <esc>
" nmap ; :
" map End key to end of line in command mode
cm OF 

map <leader>h :noh<CR>

map <m-a> ggVG

vnoremap // y/<C-R>"<CR>

nnoremap <leader>o }ko<CR>
nnoremap <leader>O {ko<CR>

" nnoremap <expr> <Leader>o line('.') == line('$') ? '}o<CR>' : '}O<CR>'
" nnoremap <expr> <Leader>O line('.') == 1 ? '{O<CR><Esc>ki' : '{O<CR>''}'}'

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

nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" LINTING/FIXING
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

let g:ale_virtualenv_dir_names = []
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\   'javascript': ['eslint', 'standard', 'prettier_standard', 'prettier_eslint'],
\}
" , 'prettier', 'standard', 'prettier_standard', 'prettier_eslint', 'importjs'],
let g:ale_fix_on_save = 1

" Remove trailing space on safe.
autocmd BufWritePre * %s/\s\+$//e

" EXECUTERS/COMPILERS
autocmd FileType python map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/ipython3)" \%run\ %:p Enter'<Bar>redraw!<C-M>
autocmd FileType matlab map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/matlab)" "$(basename % .m)" Enter'<Bar>redraw!<C-M>

autocmd BufWritePost ~/.Xresources,~/.Xdefaults ~xrdb %

set fo+=o
set fo-=r
set fo-=t
set isfname-==

" Multiple byte characters (like alt)
set ttimeoutlen=5
