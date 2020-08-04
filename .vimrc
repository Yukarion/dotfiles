set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard=unnamed

set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set title
set scrolloff=12

set nobackup
set noswapfile

autocmd  StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

set wildmenu
set history=5000

let g:closetag_filename = '*.html,*.vue'
"閉じるタグを自動で補完

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
"閉じ括弧を自動で挿入
