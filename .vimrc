if has('vim_starting')
	set rtp+=~/.vim/plugged/vim-plug
	if !isdirectory(expand('~/.vim/plugged/vim-plug'))
		echo 'install vim-plug...'
		call system('mkdir -p ~/.vim/plugged/vim-plug')
		call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
		echo 'input ":PlugInstall" on your vim. '
	end
endif

" vim/plugがないとき用，ほぼコピペ
" TODO プラグイン周りを書き換えたあとは必ず:PlugInstallすること！

call plug#begin('~/.vim/plugged')
"プラグイン入れる(vim-plug)

Plug 'scrooloose/nerdtree'
" :NERDTree でディレクトリツリーを表示 Ctrl+W -> hjkl で分割画面を移動

Plug 'tomtom/tcomment_vim'
" Shift+vで行単位で選択->Ctrl+_を2回入力でコメントアウト

Plug 'bronson/vim-trailing-whitespace'
"行末の空白を可視化 :FixWhiteSpaceで削除可能

Plug 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()}
"なんかGitいろいろ触れるらしいけどブランチ表示したいだけ，
"Git触るときはTigで．

Plug 'fatih/vim-go'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
filetype plugin on
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
let g:deoplete#sources#go#gocode_binary = '/home/mackyson/go/bin/gocode'
"GoをIDEに

Plug 'prettier/vim-prettier', {
	\'do': 'yarn install',
	\'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']}
"JS用のコード整形
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"TypeScriptのSystax highlight

Plug 'elzr/vim-json'
"jsonを見やすくする

Plug 'airblade/vim-gitgutter'
"更新箇所に+や-がつく

Plug 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"JK移動をもっと早く"

Plug 'alvan/vim-closetag'
let g:closetag_filename = '*.html,*.vue,*.tsx'
"閉じるタグを自動で補完

Plug 'dhruvasagar/vim-table-mode'
"mdで表書く時に起動すると色々自動補完

Plug 'bronson/vim-trailing-whitespace'
autocmd BufWritePre * :FixWhitespace
"保存時に空白を削除

Plug '907th/vim-auto-save'
"自動保存機能
let g:auto_save = 1
"enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0
"insertモードでは自動保存しない

Plug 'Yggdroot/indentLine'
"インデント可視化


call plug#end()

set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set clipboard=unnamed

set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set title
set scrolloff=12
set shiftwidth=2
set virtualedit=onemore

set nobackup
set noswapfile

autocmd  StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:tex_conceal=''
"TeXの数式が自動でアレするのを防ぐ

autocmd BufReadPost * :NERDTree
"起動時にNERDTreeを自動で開く
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
":qでNERDTreeも一緒に消す
if argc() == 0 || argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
		autocmd vimenter * NERDTree
else
		autocmd vimenter * NERDTree | wincmd p
	endif
"起動時にファイルの方にフォーカスをする，ただしディレクトリを開いたときはTreeにフォーカス

set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

set wildmenu
set history=5000

imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
"閉じ括弧を自動で挿入

nnoremap あ a
nnoremap い i
nnoremap お o
nnoremap っｄ dd
nnoremap ：ｗ :w
nnoremap ：ｑ :q
nnoremap ：ｑ！ :q!

