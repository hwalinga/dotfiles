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
" Plug 'tpope/vim-scriptease'
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
" mgedmin/python-imports.vim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

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

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
" Currently running this in vim fails on my machine.
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

" Plug 'ncm2/float-preview.nvim'

call plug#end()

if !has('nvim')
    call plug#load('vim-fixkey')
endif

" Latex
" Not yet fully writing any Latex.
" let g:tex_flavor='latex'

" ########
" WEBSTACK
" ########

" HTML
let g:html_indent_script1 = "inc"
" Map shift enter
" inoremap <CR><ESC>O
inoremap <M-Enter> <CR><ESC>O

let g:user_emmet_mode='a'
imap <C-y>, <esc>$<Plug>(emmet-expand-abbr)
nmap <C-y>, $<Plug>(emmet-expand-abbr)

au BufRead,StdinReadPost * if getline(1) =~ '<html>' | setlocal ft=html | endif
au StdinReadPost * if getline(1) =~ '[\|{' | setlocal ft=json | endif

au BufEnter * if &ft ==# 'html' | exec 'RainbowToggleOff' | endif

" #############
" VISUALIZATION
" #############

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

" RAINBOW
let g:rainbow_active = 1
let g:rainbow_conf = {'ctermfgs': [238, 41, 170, 147]}
map <leader>r :RainbowToggle<enter>
au BufEnter * if &ft ==# 'html' | exec 'RainbowToggleOff' | endif

" indentLine uses conceal, disable for markdown and json and tex
let g:indentLine_fileTypeExclude = ['markdown', 'json', 'tex']
autocmd FileType markdown set cole=0

" ===========

" FILE DIRS
set dir=~/.vim/swapfiles
set backup
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undodir

" NUMBERS AND SUCH
set history=1000
set colorcolumn=80
set linebreak
set showbreak=..
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
" inoremap kj <esc>
" nmap ; :
" map End key to end of line in command mode
cm OF 
" let g:easyescape_chars = { "j": 1, "k": 1  }
" let g:easyescape_timeout = 100
" cnoremap kj <ESC>

nnoremap <leader>i :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <leader>I :exec "normal a".nr2char(getchar())."\e"<CR>

inoremap <C-U> <C-G>u<C-U>

map <m-a> ggVG

vnoremap // y/<C-R>"<CR>

nnoremap <leader>o }ko<CR>
nnoremap <leader>O {ko<CR>

" ======

" nnoremap <expr> <Leader>o line('.') == line('$') ? '}o<CR>' : '}O<CR>'
" nnoremap <expr> <Leader>O line('.') == 1 ? '{O<CR><Esc>ki' : '{O<CR>''}'}'

set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap S :%s//g<Left><Left>

" map paste, yank and delete to named register so the content
" will not be overwritten (I know I should just remember...)
" nnoremap x "_x
" vnoremap x "_x

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

" ##############
" LINTING/FIXING
" ##############

let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
let g:ale_virtualenv_dir_names = []
let g:ale_linters = {
\   'javascript': ['eslint', 'standard']
\}
let g:ale_fixers = {
\   'python': ['isort', 'black'],
\   'javascript': ['eslint', 'standard'],
\}
" \   'pyton': ['isort'],
" , 'prettier', 'standard', 'prettier_standard', 'prettier_eslint', 'importjs'],
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

autocmd FileType matlab setl cms=%\ %s
autocmd FileType json setl cms=//\ %s

" Remove trailing space on safe.
autocmd BufWritePre * if &ft != 'markdown' | %s/\s\+$//e | endif
function TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
au BufWritePre *.py call TrimEndLines()

" ##############
" AUTOCOMPLETION
" ##############

" GENERAL

set shortmess+=c
set completeopt=menu,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" JEDI

" Disable Jedi-vim autocompletion and enable call-signatures options
let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#show_call_signatures_delay = 0

" DEOPLETE

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#statement_length = 500
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" COC.NVIM

" autocmd FileType json syntax match Comment +\/\/.\+$+

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()


" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" Restart conky on safe
" autocmd BufWritePost note.txt !bash -c 'pkill -f "conky -c /home/hielke/.conky/MX-Emays/MX-emays"; conky -c /home/hielke/.conky/MX-Emays/MX-emays & echo test23 > /home/hielke/tmp/echotest'

" EXECUTERS/COMPILERS
autocmd FileType python map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/ipython3)" \%run\ %:p Enter'<Bar>redraw!<C-M>
autocmd FileType matlab map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/matlab)" "$(basename % .m)" Enter'<Bar>redraw!<C-M>

autocmd BufNewFile *.py .!pystamp.bash

autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %
