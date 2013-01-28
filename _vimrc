"python用 インデント設定
autocmd FileType python setl autoindent  "オートインデント有効化
autocmd FileType python setl smartindent "スマートインデント有効化
autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class "該当するワード時に自動的にインデント

"タブ設定
set expandtab      "タブを半角空白として設定
set tabstop=8      "タブを半角スペース8文字として表示(pythonのインタプリタはタブ文字を8文字として扱う為)
set softtabstop=4  "タブ入力時半角スペース4文字として表示
set shiftwidth=4   "インデント時に半角スペース4文字として表示

"コード編集設定
filetype plugin indent on  "ファイル形式別プラグイン有効化
syntax enable              "シンタックスハイライト

"文字コード設定
set enc=utf-8

"行数設定
set number

"バックアップファイル設定
set nobackup
set noswapfile

"背景色設定
colorscheme torte

"補完設定
set completeopt=menu

"カレントディレクトリ設定(自動的に開いたファイルのディレクトリに移動)
if exists('+autochdir')
  set autochdir
endif

"NeoBundle設定
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim
  call neobundle#rc(expand('$HOME/vimfiles/bundle'))
endif

"NERDTree
NeoBundle 'http://github.com/scrooloose/nerdtree.git'
nmap <F9> :NERDTreeToggle<CR>

"quickrun
NeoBundle 'http://github.com/thinca/vim-quickrun.git'
let g:quickrun_config={}
let g:quickrun_config["_"] = {'into':1}

"vimfiler
NeoBundle 'http://github.com/Shougo/vimfiler.git'

"unitevim
NeoBundle 'http://github.com/Shougo/unite.vim.git'

"indent-guides
NeoBundle 'http://github.com/nathanaelkane/vim-indent-guides.git'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size=1

"ref
NeoBundle 'http://github.com/thinca/vim-ref.git'
let g:ref_use_vimproc = 0
if exists('*ref#register_detection')
	" filetypeが分からんならalc
	call ref#register_detection('_', 'alc')
endif

"gist
NeoBundle 'http://github.com/mattn/gist-vim.git'
let g:github_user='hatakazu'
let g:github_token='1073e24d7f4d29c2c39c9812fa345dc4'

"neocomplecache
NeoBundle 'http://github.com/Shougo/neocomplcache.git'
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

"pythoncomplete
NeoBundle 'http://github.com/vim-scripts/pythoncomplete.git'
autocmd FileType python set omnifunc=pythoncomplete#Complete

"vim-django-support
NeoBundle 'http://github.com/lambdalisue/vim-django-support.git'

"Simple-Javascript-Indenter
NeoBundle 'http://github.com/jiangmiao/simple-javascript-indenter.git'
let g:SimpleJsIndenter_BriefMode = 1
let g:SimpleJsIndenter_CaseIndentLevel = -1

"vim-javascript-syntax
NeoBundle 'http://github.com/jelera/vim-javascript-syntax.git'

"jscomplete-vim
NeoBundle 'http://github.com/teramako/jscomplete-vim.git'
let g:jscomplete_use = ['dom', 'moz', 'es6th']

filetype plugin indent on
