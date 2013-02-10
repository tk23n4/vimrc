"python用 インデント設定
autocmd FileType python setl autoindent  "オートインデント有効化
autocmd FileType python setl smartindent "スマートインデント有効化
autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class "該当するワード時に自動的にインデント

"javascritp用設定
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS


"タブ設定
set expandtab      "タブを半角空白として設定
set tabstop=8      "タブを半角スペース8文字として表示(pythonのインタプリタはタブ文字を8文字として扱う為)
set softtabstop=4  "タブ入力時半角スペース4文字として表示
set shiftwidth=4   "インデント時に半角スペース4文字として表示

"コード編集設定
filetype plugin indent on  "ファイル形式別プラグイン有効化
syntax enable              "シンタックスハイライト

"文字コード設定
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp

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

"クリップボード設定
set clipboard=unnamed

"検索ハイライト削除
nmap <Leader>nh :nohlsearch<CR>

"矩形選択設定
set virtualedit=block


"NeoBundle設定
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim
  call neobundle#rc(expand('$HOME/vimfiles/bundle'))
endif

"quickrun
NeoBundle 'http://github.com/thinca/vim-quickrun.git'
let g:quickrun_config={}
let g:quickrun_config["_"] = {'into':1}

"vimfiler
NeoBundle 'http://github.com/Shougo/vimfiler.git'
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0
nnoremap <F9> :VimFiler -buffer-name=explorer -split -winwidth=30 -no-quit<CR>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
endfunction

"unitevim
NeoBundle 'http://github.com/Shougo/unite.vim.git'
" バッファ一覧
nnoremap <C-u>b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <C-u>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <C-u>r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <C-u>m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <C-u>u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <C-u>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

"indent-guides
NeoBundle 'http://github.com/nathanaelkane/vim-indent-guides.git'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=30
let g:indent_guides_guide_size=1

"ref
NeoBundle 'http://github.com/thinca/vim-ref.git'
let g:ref_use_vimproc = 0
"webdictサイトの設定
let g:ref_source_webdict_sites = {
\   'english': {
\     'url': 'http://eow.alc.co.jp/search?q=%s',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }
 
"デフォルトサイト
let g:ref_source_webdict_sites.default = 'e'
nmap <Leader>e :<C-u>Ref webdict english<Space>
nmap <Leader>w :<C-u>Ref webdict wiki<Space>

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

"jscomplete-vim
NeoBundle 'http://github.com/myhere/vim-nodejs-complete.git'
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1

"surround-vim
NeoBundle 'http://github.com/tpope/vim-surround.git'

"vim-alignta
NeoBundle 'http://github.com/h1mesuke/vim-alignta.git'
vmap <Leader>al :Alignt<Space>

"calendar-vim
NeoBundle 'http://github.com/mattn/calendar-vim.git'
nmap <Leader>ma :Calendar<CR>

"vim-smartchr
NeoBundle 'http://github.com/kana/vim-smartchr.git'
imap <expr> = smartchr#loop(' = ','=',' == ')

"zencoding-vim
NeoBundle 'http://github.com/mattn/zencoding-vim.git'

filetype plugin indent on
