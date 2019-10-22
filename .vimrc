if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if !has('nvim')
    " set term=screen-256color
    " set t_Co=256
    set term=rxvt-unicode-256color
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
Plug 'junegunn/vim-peekaboo'
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
Plug 'tpope/vim-eunuch'
" tbone?
Plug 'adelarsq/vim-matchit'

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

" Text objects:
Plug 'wellle/targets.vim'
Plug 'aldantas/vim-custom-surround'

Plug 'michaeljsmith/vim-indent-object'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'saaguero/vim-textobj-pastedtext'

Plug 'christoomey/vim-titlecase'

" Plug 'tommcdo/vim-express'

" Other stuff

Plug 'derekwyatt/vim-scala'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'tmux-plugins/vim-tmux'

Plug 'Houl/repmo-vim'

" Plug 'vim-latex/vim-latex'
" A better latex alternative ??
Plug 'lervag/vimtex'

Plug 'drmikehenry/vim-fixkey', { 'for': [] }
" Plug 'zhou13/vim-easyescape'  " Not yet working as I want, pending issue

call plug#end()

if !has('nvim')
    call plug#load('vim-fixkey')
endif

" RAINBOW
let g:rainbow_active = 1
let g:rainbow_conf = {'ctermfgs': [238, 41, 170, 147]}

map <leader>r :RainbowToggle<enter>

au BufRead,StdinReadPost * if getline(1) =~ '<html>' | setlocal ft=html | endif
au StdinReadPost * if getline(1) =~ '[\|{' | setlocal ft=json | endif

au BufEnter * if &ft ==# 'html' | exec 'RainbowToggleOff' | endif

" Latex
" Not yet fully writing any Latex.
" let g:tex_flavor='latex'

" HTML
let g:html_indent_script1 = "inc"
" Map shift enter
" inoremap [13;2u <CR><ESC>O
inoremap <M-Enter> <CR><ESC>O

let g:user_emmet_mode='a'
imap <C-y>, <esc>$<Plug>(emmet-expand-abbr)
nmap <C-y>, $<Plug>(emmet-expand-abbr)

" indentLine uses conceal, disable for markdown and json and tex
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'tex']

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
set history=200
set colorcolumn=80
set linebreak
set number! relativenumber!
set ruler
set cursorline
set hlsearch
if has('reltime')
    set incsearch
endif
map <leader>h :noh<CR>
set showcmd
set signcolumn=yes

" TABS
set tabstop=8
set softtabstop=4
set shiftwidth=4
" set smarttab
set expandtab
let g:vim_indent_cont = 0

" no clue what would work best.
set autoindent
" set smartindent

set hidden

set ignorecase
set smartcase

au FileType javascript set softtabstop=2
au FileType javascript set shiftwidth=2

" GENERAL
set encoding=utf8
set ffs=unix,dos,mac
set clipboard^=unnamed,unnamedplus

packloadall
silent! helptags ALL

set path+=**
set wildmenu
set wildmode=list:longest,full
set dictionary+=/usr/share/dict/words
set complete=.,w,b,u,t
set display=truncate

" MAPPINGS
" nvim behave like normal command line.
" for ch in map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)')
"     execute printf('inoremap <M-%s> <Esc>%s', ch, ch)
" endfor

call customsurround#map('<leader>b', '\fB', '\fP')
call customsurround#map('<leader>i', '\fI', '\fP')

" map a motion and its reverse motion:
noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

noremap <expr> j repmo#SelfKey('j', 'k')|sunmap j
noremap <expr> k repmo#SelfKey('k', 'j')|sunmap k

noremap <expr> gj repmo#SelfKey('gj', 'gk')|sunmap gj
noremap <expr> gk repmo#SelfKey('gk', 'gj')|sunmap gk

" if you like `:noremap j gj', you can keep that:
" map <expr> j repmo#Key('gj', 'gk')|sunmap j
" map <expr> k repmo#Key('gk', 'gj')|sunmap k
" noremap j gj
" noremap k gk

set scrolloff=5

" repeat the last [count]motion or the last zap-key:
map <expr> ; repmo#LastKey(';')|sunmap ;
map <expr> , repmo#LastRevKey(',')|sunmap ,

" add these mappings when repeating with `;' or `,':
noremap <expr> f repmo#ZapKey('f')|sunmap f
noremap <expr> F repmo#ZapKey('F')|sunmap F
noremap <expr> t repmo#ZapKey('t')|sunmap t
noremap <expr> T repmo#ZapKey('T')|sunmap T

" inoremap <CR> <C-G>u<CR>
inoremap # X<BS>#
inoremap kj <esc>
" nmap ; :
" map End key to end of line in command mode
cm OF 

" let g:easyescape_chars = { "j": 1, "k": 1  }
" let g:easyescape_timeout = 100
" cnoremap kj <ESC>

nnoremap <leader>i :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <leader>I :exec "normal a".nr2char(getchar())."\e"<CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <C-U> <C-G>u<C-U>

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

if has('autocmd')
  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

  augroup END
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" autocmd sets these preferences with force.
autocmd FileType * set formatoptions-=o
autocmd FileType * set formatoptions-=t
autocmd FileType * set formatoptions+=r
set backspace=indent,eol,start
set isfname-==

" Multiple byte characters (like alt)
set ttimeout
set ttimeoutlen=5

" set conceallevel=0
" autocmd FileType * setlocal conceallevel=0

" LINTING/FIXING
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

let g:ale_virtualenv_dir_names = []
let g:ale_linters = {
\   'javascript': ['eslint', 'standard']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines'],
\   'python': ['isort', 'black'],
\   'javascript': ['eslint', 'standard'],
\}
" \   'pyton': ['isort'],
" , 'prettier', 'standard', 'prettier_standard', 'prettier_eslint', 'importjs'],
let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1

" Remove trailing space on safe.
autocmd BufWritePre * if &ft != 'markdown' | %s/\s\+$//e | endif

" EXECUTERS/COMPILERS
autocmd FileType python map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/ipython3)" \%run\ %:p Enter'<Bar>redraw!<C-M>
autocmd FileType matlab map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/matlab)" "$(basename % .m)" Enter'<Bar>redraw!<C-M>

autocmd BufWritePost ~/.Xresources,~/.Xdefaults ~xrdb %
