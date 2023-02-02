if !has('win32') && empty(glob('~/.vim/autoload/plug.vim'))"{{{
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:python3_host_prog = '/usr/bin/python3'

if !has('win32') && !has('nvim')
    " set term=screen-256color
    " set t_Co=256
    set term=rxvt-unicode-256color
endif

let mapleader = " "
nmap <expr> <bslash> mapleader

let g:polyglot_disabled = ['markdown', 'bib']

call plug#begin('~/.vim/bundle')

Plug 'junegunn/vim-plug'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'tommcdo/vim-lion'

" From the pope.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-ragtag', { 'for': ['html', 'htmldjango'] }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
" tbone? (tmux stuff)

Plug 'romainl/vim-cool'
Plug 'jiangmiao/auto-pairs'

" Visual
Plug 'luochen1990/rainbow'
" , { 'on': 'LoadRainbow' }

" Plug 'Yggdroot/indentLine'
" Plug 'nathanaelkane/vim-indent-guides'

Plug 'NLKNguyen/papercolor-theme'
Plug 'machakann/vim-highlightedyank'
" Plug 'vim-scripts/guifontpp.vim'
" Plug 'RyanMcG/vim-guifontzoom'
" Plug 'schmich/vim-guifont'

" Text objects:
Plug 'wellle/targets.vim'
Plug 'aldantas/vim-custom-surround'
Plug 'chaoren/vim-wordmotion'
Plug 'michaeljsmith/vim-indent-object'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'saaguero/vim-textobj-pastedtext'

Plug 'christoomey/vim-titlecase'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'tommcdo/vim-express'

" Other stuff

Plug 'rhysd/vim-grammarous'

" Snips
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

Plug 'rhysd/clever-f.vim'
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'tmux-plugins/vim-tmux'

Plug 'mhinz/vim-grepper'
" flygrep?

Plug 'Houl/repmo-vim'
Plug 'machakann/vim-swap'

" Language specific stuff.

Plug 'sheerun/vim-polyglot'

" General (linters)
Plug 'w0rp/ale'

" WEBSTACK
Plug 'mattn/emmet-vim', { 'for': ['html', 'htmldjango'] }
Plug 'ap/vim-css-color'
Plug 'adelarsq/vim-matchit'

Plug 'mustache/vim-mustache-handlebars'

" Markdown
" Plug 'vimwiki/vimwiki'

" Simple syntax highlighting:
" Plug 'drmingdrmer/vim-syntax-markdown'

" Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc-syntax'

" LATEX
" Plug 'vim-latex/vim-latex'
" A better latex alternative ??
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }


" Others
" Plug 'derekwyatt/vim-scala', { 'for': ['scala'] }
" Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }

" Plugins that depend on language servers.
if !has('win32') && has('python3')
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'ncm2/float-preview.nvim'
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif

    " Python
    Plug 'deoplete-plugins/deoplete-jedi', { 'for': ['python'] }
    " TODO: Why is slow => pandas
    Plug 'davidhalter/jedi-vim', { 'for': ['python'] }

    " Javascript
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install -g tern' }
    Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
endif

" Only load in Vim (Not NeoVim).
Plug 'drmikehenry/vim-fixkey', { 'for': [] }

call plug#end()

if !has('win32') && !has('nvim')
    call plug#load('vim-fixkey')
endif

" Latex
" Not yet fully writing any Latex.
" let g:tex_flavor='latex'
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_math = 1
let g:vim_markdown_conceal = 0
" This is vim config, not vim_markdown
let g:tex_conceal = "amgs"
let g:tex_flavor = 'latex'

let g:grammarous#languagetool_cmd = 'languagetool'
nmap <buffer><leader>t <Plug>(grammarous-move-to-next-error)

let g:vimtex_view_method = "zathura"
let g:livepreview_previewer = 'zathura'

let g:vimtex_quickfix_ignore_filters = [
  \ 'Underfull',
  \ 'Overfull',
  \ 'Missing',
  \]

" https://tex.stackexchange.com/questions/416030/how-do-i-make-vim-highlight-math-properly-in-the-align-environment

" https://github.com/plasticboy/vim-markdown/issues/469

" amsmath.vim
"   Author: Charles E. Campbell
"   Date:   Jun 29, 2018 - Apr 01, 2019
"   Version: 1d	ASTRO-ONLY
"
"   Useful for \usepackage{amssymb,amsmath}
" ---------------------------------------------------------------------
" let b:loaded_amsmath = "v1d"
" let s:keepcpo        = &cpo
" set cpo&vim

" ---------------------------------------------------------------------


"  AMS-Math Package Support: {{{1
" call TexNewMathZone("E","align",1)
" call TexNewMathZone("F","alignat",1)
" call TexNewMathZone("G","equation",1)
" call TexNewMathZone("H","flalign",1)
" call TexNewMathZone("I","gather",1)
" call TexNewMathZone("J","multline",1)
" call TexNewMathZone("K","xalignat",1)
" call TexNewMathZone("L","xxalignat",0)

" syn match texBadMath		"\\end\s*{\s*\(align\|alignat\|equation\|flalign\|gather\|multline\|xalignat\|xxalignat\)\*\=\s*}"
" syn region mkdMath start="\\\@<!\\begin" end="\\end" contains=@tex keepend

" Amsmath [lr][vV]ert  (Holger Mitschke)
" let s:texMathDelimList=[
"      \ ['\\lvert'     , '|'] ,
"      \ ['\\rvert'     , '|'] ,
"      \ ['\\lVert'     , '‖'] ,
"      \ ['\\rVert'     , '‖'] ,
"      \ ]
" for texmath in s:texMathDelimList
"     execute "syntax match texMathDelim '\\\\[bB]igg\\=[lr]\\=".texmath[0]."' contained conceal cchar=".texmath[1]
" endfor

" ---------------------------------------------------------------------
" AMS-Math and AMS-Symb Package Support: {{{1
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" let s:texMathList=[
"   \ ['backepsilon'        , '∍'] ,
"   \ ['backsimeq'          , '≃'] ,
"   \ ['barwedge'           , '⊼'] ,
"   \ ['because'            , '∵'] ,
"   \ ['beth'               , 'ܒ'] ,
"   \ ['between'            , '≬'] ,
"   \ ['blacksquare'        , '∎'] ,
"   \ ['Box'                , '☐'] ,
"   \ ['boxdot'             , '⊡'] ,
"   \ ['boxminus'           , '⊟'] ,
"   \ ['boxplus'            , '⊞'] ,
"   \ ['boxtimes'           , '⊠'] ,
"   \ ['bumpeq'             , '≏'] ,
"   \ ['Bumpeq'             , '≎'] ,
"   \ ['Cap'                , '⋒'] ,
"   \ ['circeq'             , '≗'] ,
"   \ ['circlearrowleft'    , '↺'] ,
"   \ ['circlearrowright'   , '↻'] ,
"   \ ['circledast'         , '⊛'] ,
"   \ ['circledcirc'        , '⊚'] ,
"   \ ['colon'              , ':'] ,
"   \ ['complement'         , '∁'] ,
"   \ ['Cup'                , '⋓'] ,
"   \ ['curlyeqprec'        , '⋞'] ,
"   \ ['curlyeqsucc'        , '⋟'] ,
"   \ ['curlyvee'           , '⋎'] ,
"   \ ['curlywedge'         , '⋏'] ,
"   \ ['doteqdot'           , '≑'] ,
"   \ ['dotplus'            , '∔'] ,
"   \ ['dotsb'              , '⋯'] ,
"   \ ['dotsc'              , '…'] ,
"   \ ['dotsi'              , '⋯'] ,
"   \ ['dotso'              , '…'] ,
"   \ ['doublebarwedge'     , '⩞'] ,
"   \ ['eqcirc'             , '≖'] ,
"   \ ['eqsim'              , '≂'] ,
"   \ ['eqslantgtr'         , '⪖'] ,
"   \ ['eqslantless'        , '⪕'] ,
"   \ ['eth'                , 'ð'] ,
"   \ ['fallingdotseq'      , '≒'] ,
"   \ ['geqq'               , '≧'] ,
"   \ ['gimel'              , 'ℷ'] ,
"   \ ['gneqq'              , '≩'] ,
"   \ ['gtrdot'             , '⋗'] ,
"   \ ['gtreqless'          , '⋛'] ,
"   \ ['gtrless'            , '≷'] ,
"   \ ['gtrsim'             , '≳'] ,
"   \ ['iiint'              , '∭'] ,
"   \ ['iint'               , '∬'] ,
"   \ ['implies'            , '⇒'] ,
"   \ ['leadsto'            , '↝'] ,
"   \ ['leftarrowtail'      , '↢'] ,
"   \ ['leftrightsquigarrow', '↭'] ,
"   \ ['leftthreetimes'     , '⋋'] ,
"   \ ['leqq'               , '≦'] ,
"   \ ['lessdot'            , '⋖'] ,
"   \ ['lesseqgtr'          , '⋚'] ,
"   \ ['lesssim'            , '≲'] ,
"   \ ['lneqq'              , '≨'] ,
"   \ ['ltimes'             , '⋉'] ,
"   \ ['measuredangle'      , '∡'] ,
"   \ ['ncong'              , '≇'] ,
"   \ ['nexists'            , '∄'] ,
"   \ ['ngeq'               , '≱'] ,
"   \ ['ngeqq'              , '≱'] ,
"   \ ['ngtr'               , '≯'] ,
"   \ ['nleftarrow'         , '↚'] ,
"   \ ['nLeftarrow'         , '⇍'] ,
"   \ ['nLeftrightarrow'    , '⇎'] ,
"   \ ['nleq'               , '≰'] ,
"   \ ['nleqq'              , '≰'] ,
"   \ ['nless'              , '≮'] ,
"   \ ['nmid'               , '∤'] ,
"   \ ['nparallel'          , '∦'] ,
"   \ ['nprec'              , '⊀'] ,
"   \ ['nrightarrow'        , '↛'] ,
"   \ ['nRightarrow'        , '⇏'] ,
"   \ ['nsim'               , '≁'] ,
"   \ ['nsucc'              , '⊁'] ,
"   \ ['ntriangleleft'      , '⋪'] ,
"   \ ['ntrianglelefteq'    , '⋬'] ,
"   \ ['ntriangleright'     , '⋫'] ,
"   \ ['ntrianglerighteq'   , '⋭'] ,
"   \ ['nvdash'             , '⊬'] ,
"   \ ['nvDash'             , '⊭'] ,
"   \ ['nVdash'             , '⊮'] ,
"   \ ['pitchfork'          , '⋔'] ,
"   \ ['precapprox'         , '⪷'] ,
"   \ ['preccurlyeq'        , '≼'] ,
"   \ ['precnapprox'        , '⪹'] ,
"   \ ['precneqq'           , '⪵'] ,
"   \ ['precsim'            , '≾'] ,
"   \ ['rightarrowtail'     , '↣'] ,
"   \ ['rightsquigarrow'    , '↝'] ,
"   \ ['rightthreetimes'    , '⋌'] ,
"   \ ['risingdotseq'       , '≓'] ,
"   \ ['rtimes'             , '⋊'] ,
"   \ ['sphericalangle'     , '∢'] ,
"   \ ['star'               , '✫'] ,
"   \ ['subset'             , '⊂'] ,
"   \ ['Subset'             , '⋐'] ,
"   \ ['subseteqq'          , '⫅'] ,
"   \ ['subsetneq'          , '⊊'] ,
"   \ ['subsetneqq'         , '⫋'] ,
"   \ ['succapprox'         , '⪸'] ,
"   \ ['succcurlyeq'        , '≽'] ,
"   \ ['succnapprox'        , '⪺'] ,
"   \ ['succneqq'           , '⪶'] ,
"   \ ['succsim'            , '≿'] ,
"   \ ['Supset'             , '⋑'] ,
"   \ ['supseteqq'          , '⫆'] ,
"   \ ['supsetneq'          , '⊋'] ,
"   \ ['supsetneqq'         , '⫌'] ,
"   \ ['therefore'          , '∴'] ,
"   \ ['trianglelefteq'     , '⊴'] ,
"   \ ['triangleq'          , '≜'] ,
"   \ ['trianglerighteq'    , '⊵'] ,
"   \ ['twoheadleftarrow'   , '↞'] ,
"   \ ['twoheadrightarrow'  , '↠'] ,
"   \ ['ulcorner'           , '⌜'] ,
"   \ ['urcorner'           , '⌝'] ,
"   \ ['varnothing'         , '∅'] ,
"   \ ['vartriangle'        , '∆'] ,
"   \ ['vDash'              , '⊨'] ,
"   \ ['Vdash'              , '⊩'] ,
"   \ ['veebar'             , '⊻'] ,
"   \ ['Vvdash'             , '⊪']]

" for texmath in s:texMathList
"  if texmath[0] =~# '\w$'
"   exe "syn match texMathSymbol '\\\\".texmath[0]."\\>' contained conceal cchar=".texmath[1]
"  else
"   exe "syn match texMathSymbol '\\\\".texmath[0]."' contained conceal cchar=".texmath[1]
"  endif
" endfor


" ---------------------------------------------------------------------
"  Restore: {{{1
" let &cpo= s:keepcpo
" unlet s:keepcpo
" vim: ts=4 fdm=marker

" ########
" WEBSTACK {{{1
" ########

" HTML
" let g:html_indent_script1 = "inc"
" Map shift enter
" inoremap <CR><ESC>O
inoremap <M-Enter> <CR><ESC>O

let g:user_emmet_mode='a'
imap , <esc>$<Plug>(emmet-expand-abbr)
nmap , $<Plug>(emmet-expand-abbr)

au BufRead,StdinReadPost * if getline(1) =~ '<html>' | setlocal ft=html | endif
au StdinReadPost * if getline(1) =~ '[\|{' | setlocal ft=json | endif

au BufEnter * if &ft ==# 'html' | exec 'RainbowToggleOff' | endif

" #############
" VISUALIZATION {{{1
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

" View indents
" indentLine uses conceal, disable for markdown and json and tex
" let g:indentLine_fileTypeExclude = ['markdown', 'json', 'tex']

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightgrey

let g:highlightedyank_highlight_duration = 250

autocmd FileType markdown set cole=0
autocmd FileType vim set foldmethod=marker

set scrolloff=5

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
let g:goyo_width=150

" =========== UTILS {{{1

if !has('win32')
" file dirs
  set dir=~/.vim/swapfiles
  set backup
  set backupdir=~/.vim/backupfiles
  set undofile
  set undodir=~/.vim/undodir
endif

" numbers and such
set history=1000
set colorcolumn=80
set linebreak
" set showbreak=..
set number! relativenumber!
set ruler
set cursorline
map <leader>h :noh<CR>
set showcmd
set signcolumn=yes
set lazyredraw

" TABS {{{1
set tabstop=8
set softtabstop=4
set shiftwidth=4
" set smarttab
set expandtab
let g:vim_indent_cont = 0

" no clue what would work best.
set autoindent
" set smartindent
" Disable python indent on : (because type hints)
autocmd FileType python setlocal indentkeys-=<:>
autocmd FileType python setlocal indentkeys-=:

set hidden

set ignorecase
set smartcase

" GENERAL {{{1
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


" MAPPINGS {{{1
" nvim behave like normal command line.
" for ch in map(range(char2nr('a'), char2nr('z')), 'nr2char(v:val)')
"     execute printf('inoremap <M-%s> <Esc>%s', ch, ch)
" endfor
" map , <Plug>(clever-f-repeat-back)
map , <Plug>(clever-f-repeat-forward)
map ; :
noremap Y y$
let g:wordmotion_prefix = '<Leader>'
call customsurround#map('<leader>b', '\fB', '\fP')
call customsurround#map('<leader>i', '\fI', '\fP')

" fzf.vim
command F Files

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

" repeat the last [count]motion or the last zap-key:
map <expr> m repmo#LastKey('m')|sunmap ;
map <expr> , repmo#LastRevKey(',')|sunmap ,

" " add these mappings when repeating with `;' or `,':
" noremap <expr> f repmo#ZapKey('f')|sunmap f
" noremap <expr> F repmo#ZapKey('F')|sunmap F
" noremap <expr> t repmo#ZapKey('t')|sunmap t
" noremap <expr> T repmo#ZapKey('T')|sunmap T

imap <C-CR> <CR><C-o><S-o>
" imap <C-CR> <CR><CR><C-o>k<C-o>cc
" imap <C-CR> <ESC>:normal akcc
" imap <C-CR> <ESC>:exec "normal! a<C-V><CR><C-V><CR><C-V><C-O>k<C-V><C-F>"<CR>

inoremap <CR> <C-G>u<CR>
" Don't reindent #:
inoremap # X<BS>#
if !has('nvim')
    " map End key to end of line in command mode
    cm OF 

    set hlsearch
    if has('reltime')
        set incsearch
    endif
else
    set inccommand=nosplit
endif
set gdefault
" let g:easyescape_chars = { "j": 1, "k": 1  }
" let g:easyescape_timeout = 100
" cnoremap kj <ESC>

nnoremap <leader>i :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <leader>I :exec "normal a".nr2char(getchar())."\e"<CR>

nnoremap <leader>x :wall<CR>
nnoremap <leader>m :w\|mak<CR>

inoremap <C-U> <C-G>u<C-U>

" R
inoremap <M--> <-<Space>
inoremap <NL> %>%<Space>

" AutoPairs
let g:AutoPairsCenterLine = 0
" let g:AutoPairsMapCR = 1




map <m-a> ggVG

vnoremap // y/<C-R>"<CR>

" Appending paragraphs
nnoremap <leader>o }ko<CR>
nnoremap <leader>O {ko<CR>

" Indenting recently pasted text.
nnoremap <leader>p `[V`]
nnoremap <leader>[ `[V`]<
nnoremap <leader>] `[V`]>

nnoremap <leader>f :% foldo!<CR>
nnoremap <Leader>yy ^yg_
nnoremap <Leader>dd ^dg_
" ======

" nnoremap <expr> <Leader>o line('.') == line('$') ? '}o<CR>' : '}O<CR>'
" nnoremap <expr> <Leader>O line('.') == 1 ? '{O<CR><Esc>ki' : '{O<CR>''}'}'

set splitright

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

" EASYALIGN
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

autocmd FileType javascript noremap <leader>r :TernRename<CR>
autocmd FileType javascript noremap <leader>g :TernDef<CR>
autocmd FileType javascript noremap <leader>n :TernRef<CR>

" ##############
" LINTING/FIXING {{{1
" ##############

let g:ale_cpp_gcc_options = '-std=c++17 -Wall'
let g:ale_virtualenv_dir_names = []
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'json': ['jsonlint'],
\   'python':  ['flake8'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'rust': ['rustfmt'],
\   'python': ['isort', 'autopep8'],
\}
" \   'python': ['isort'],
" , 'prettier', 'standard', 'prettier_standard', 'prettier_eslint', 'importjs'],
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_lint_on_text_changed = 1

autocmd BufNewFile,BufRead * if &syntax == '' | setlocal commentstring=#\ %s | endif
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

" File specific tab size

au FileType javascript set softtabstop=4
au FileType javascript set shiftwidth=4

au FileType bib set softtabstop=2
au FileType bib set shiftwidth=2
autocmd FileType bib set expandtab

au FileType r set softtabstop=2
au FileType r set shiftwidth=2

" autosave
" too distracting with autocompile.
au InsertLeave * if &ft != 'tex' | silent! write | endif

" ##############
" AUTOCOMPLETION {{{1
" ##############

" GENERAL

" Word boundaries.
set iskeyword+=-

" How the menu works
set shortmess+=c
set completeopt=menu,menuone
if has('nvim')
    " We use float preview
    " let g:float_preview#docked = 0
else
    set completeopt+=preview
endif
" Doubly mapped at the moment.
" inoremap <expr> <CR> (!pumvisible() <Bar><Bar> get(complete_info(), 'selected', -1) < 0) ? "\<C-g>u\<CR>" : "\<C-y>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" au VimEnter * inoremap <expr> <C-e> pumvisible() ? "\<C-e>\<C-e>" : "\<C-e>"
au VimEnter * inoremap <expr> <C-e> "\<End>"
" inoremap <expr> <C-x> pumvisible() ? "\<C-e>" : "\<C-x>"

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

" let g:python3_host_prog = '/home/hielke/.venv/py3/bin/python3'
" py3 sys.path.append('/home/hielke/.venv/py3/lib/python3.7/site-packages/')
" let g:python3_host_prog = '/home/hielke/.venv/py3/bin/python3'
" py3 from pathlib import Path
" py3 sys.path.append(str(next(Path('~/.venv/py3/lib').expanduser().glob('python3*/site-packages/'))))

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#statement_length = 500
" let g:deoplete#buffer#require_same_filetype = 0
call deoplete#custom#var('buffer', 'require_same_filetype', v:false)
call deoplete#custom#option('auto_complete_delay', 200)

" https://github.com/carlitux/deoplete-ternjs/issues/88
call deoplete#custom#option('num_processes', 4)

autocmd BufNewFile,BufRead * if empty(&filetype) | call deoplete#custom#option('auto_complete', 0) | endif
" call deoplete#custom#source('jedi', 'max_info_width', 40)
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" DEOPLETE FOR JAVASCRIPT
call deoplete#custom#source('omni', 'functions', {
\ 'javascript': ['tern#Complete', 'jspc#omni']
\})
" This is new style
call deoplete#custom#var('omni', 'input_patterns', {
\ 'tex': g:vimtex#re#deoplete
\})

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

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

" EXECUTERS/COMPILERS {{{1
if !has('win32')
    autocmd FileType python map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/ipython3)" \%run\ %:p Enter'<Bar>redraw!<C-M>
    autocmd FileType matlab map <F5> :w<Bar>execute 'silent !tmux send-keys -t "$(cat $HOME/.tmux-panes/matlab)" "$(basename % .m)" Enter'<Bar>redraw!<C-M>

    autocmd BufNewFile *.py .!pystamp.bash
endif

autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

au BufReadPost  bash-fc* :set filetype=sh | :execute "normal! i#!/bin/bash\<Esc>o\<Cr>"
"}}}
