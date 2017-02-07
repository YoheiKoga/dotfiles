" dein settings {{{
if &compatible
  set nocompatible
endif
" directory of dein.vim
" auto install dein itself
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if there is not, git clone
if !isdirectory (s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " file written managed plugin
  let s:toml = '~/.dein.toml'
  let s:lazy_toml = '~/.dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install(['vimproc'])
  call dein#install()
endif

if dein#check_install()
  call dein#install()
endif

let g:seoul256_background = 234
colo seoul256
" }}}


"#####おまじない#####
set encoding=utf-8
scriptencoding utf-8

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set expandtab "to insert space characters the tab key is pressed
set tabstop=2 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set shiftwidth=2 "自動インデントでずれる幅
set autoindent "改行時に前の行のインデントを継続する
set mouse-=a "off mouse
set nowrap "stop line breaking
vnoremap v $h



"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

" 括弧の自動入力設定はとりあえずコメントアウト
"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap  <Left>
"inoremap ' ''<Left>

