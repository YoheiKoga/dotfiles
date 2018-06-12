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


" set netrw config
" set nocp
" filetype plugin on
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
" "  autocmd VimEnter * :Vexplore
" augroup END
" 
" function! ToggleVExplorer()
"   if !exists("t:netrw_bufnr")
"     exec '1wincmd w'
"     25Vexplore
"     let t:netrw_bufnr = bufnr("%)
"     return
"   endif
"   let win = bufwinnr(t:netrw_bufnr)
"   if win != -1
"     let cur = winnr()
"     exe win . 'wincmd w'
"     close
"     exe 'wincmd p'
"   endif
"   unlet t:netrw_bufnr
" endfunction
" map <silent> <leader>e :call ToggleVExplorer()<cr><c-w>p


"############### NERDTree
nnoremap <silent> <C-p> :<C-u>NERDTreeToggle<CR>

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('scala', 'Magenta', 'none', '#ff00ff', '#151515')


" taglist
"set tags = tags
" ctagsのコマンド
"let Tlist_Ctags_Cmd = ""/usr/local/bin/ctags"  

" 現在表示中のファイルのみのタグしか表示しない
let Tlist_Show_One_File = 1     

" 右側にtag listのウインドうを表示する                    
let Tlist_Use_Right_Window = 1          

" taglistのウインドウだけならVimを閉じる          
let Tlist_Exit_OnlyWindow = 1           

" <C-l>でtaglistウインドウを開いたり閉じたり出来るショートカット           
"map <silent> <leader>E :TlistToggle<CR>      
map <silent> <C-l> :TlistToggle<CR>

" for tyru/caw.vim
" comment out toggle shortcut by \c 
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)
nmap <Leader>, <Plug>(caw:zeropos:toggle)
vmap <Leader>, <Plug>(caw:zeropos:toggle)


" deoplete config , python3
let g:python3_host_prog = '/usr/local/bin/python3'

" insert blank line by 0 key
nnoremap 0 :<C-u>call append(expand('.'), '')<Cr>j



"#####おまじない#####
set encoding=utf-8
scriptencoding utf-8

"#####表示設定#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set expandtab "to insert space characters the tab key is pressed
set tabstop=2 
set smartindent "オートインデント
set shiftwidth=2 "自動インデントでずれる幅
set smarttab "空白文字をいい感じで挿入する
set autoindent "改行時に前の行のインデントを継続する
set mouse-=a "off mouse
"set nowrap "stop line breaking
set wrap
vnoremap v $h

"##### sキーへの画面分割割当######
"##### 参考 http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca #####
nnoremap s <Nop>    "disable substitute text(same as cl)
nnoremap S <Nop>    "disable substitute line(same as cc)


nnoremap sj <C-w>j
nnoremap sk <C-w>k 
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w

"move window itself
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r

nnoremap sn gt
nnoremap sp gT
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

set ignorecase "大文字/小文字の区別なく検索する
"set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

" 括弧の自動入力設定はとりあえずコメントアウト
"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap  <Left>
"inoremap ' ''<Left>
inoremap {<Enter> {<CR>}<ESC><S-o>

"##### Buffer #####
set autoread "外部ファイルが変更されたら自動で読み直す
set noswapfile "swap file（クラッシュした時のためのキャッシュみたいなもの)を作らない
set cmdheight=2

"##### Input #####
set clipboard=unnamed "ヤンクなどで*レジスタにも書き込む
set clipboard+=unnamedplus "ヤンクなどで+レジスタにも書き込む
