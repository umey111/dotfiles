"---------------------------------------------------------------------------
" 検索の挙動に関する設定:

" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=2
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:

" 行番号を非表示 (number:表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
"set nobackup

"---------------------------------------------------------------------------
" カスタム{{{
if has('win32') || has('win64')
  set encoding=utf-8
endif
set   cmdheight=2                   " : 行は 2 行
set   tabstop=4                    " タブの画面上での幅
set   shiftwidth=4                 " シフト幅
set   autoindent                   " auto indent を使用
set   smartindent                  " smart indent を使用
set nobackup                       " .bak ファイルは通常作らない
if has('win32')
  set   directory=m:/vim/tmp             " > で、始めているとファイルと同じ所には
                                   " .swp を作らずに指定した所 (d:\tmp) に作る
else
  set   directory=/tmp             " > で、始めているとファイルと同じ所には
endif
if has('win32')
  set   backupdir=>%TMP%             " .bakファイルを作るときは、指定したところに作る。
else
  set   backupdir=>/tmp
endif
set noerrorbells                   " 煩いのでベルは最小限
set noexpandtab                   " TAB は TAB のまま
"set   tags=tags\ C:\\Progra~1\\Micros~1\\VC98\\Include\\tags " tag ファイルを複数使う時
                                   " には "\ " としてスペースで区切る
"set   textmode                     " CR+LF ファイルを指定
"set   textwidth=0                  " 禁則処理 OFF
set   whichwrap=11                 " 左右のカーソルキーでは行を跨って移動
set   wildchar=9                   " コマンド行の補完キーを TAB<0x9> に
set   showmatch
set   number
"set   backspace=2                  " BACKSPACEで、改行も消せる
set   backspace=indent,eol,start   " BACKSPACEで、改行も消せる
set   scrolloff=3                  " スクロールするときに３行余分がある？
"set   grepprg=grep\ -nH            " grepに使用するプログラムを変更する
"command! CD cd %:p:h               " CDでカレントバッファのディレクトリに移動
set   shellslash                   " ディレクトリの区切り文字を"/"にする
if has('win32')
  set   runtimepath+=$VIM/chalice
  set   runtimepath+=$VIM/chalice/after
else
  set   runtimepath+=$HOME/.vim/chalice
  set   runtimepath+=$HOME/.vim/chalice/after
endif
set   listchars=tab:>-,trail:-,eol:$ " set list時の表示を変える
set   keymap&			   " keymapをdefaultに設定
set   history=3000		    " コマンド行の履歴を1000行残す
"set nowrap     " 長い行を折り返して表示 (nowrap:折り返さない)
"set sidescroll=10    " 表示していない領域にカーソルを動かそうとすると自動的にスクロールするようにする
"runtime plugin/chalice.vim
"let   MRU_num=19                   " 最近使ったファイルに残す数
"let   $MRU=$HOME . '/_vimrecent'   " 最近使ったファイルの情報を＄HOME/_vimrecentに残す
let   autodate_format = '%Y/%m/%d'
				   " 最終更新日を自動的に入れるスクリプトのフォーマット定義

" mapはすぐ後ろにコメントを書かないこと！
" 行の移動を表示されている行で移動する(１行に書くとおかしくなるので、コメントを下に移動）
noremap j gj
noremap gj j
" 行の移動を表示されている行で移動する(１行に書くとおかしくなるので、コメントを下に移動）
noremap k gk
noremap gk k
" 全選択コピー(ノーマルモード時のみ、VisualMode時はアスキーコード表示)
nnoremap   ga   :%y<CR>
" Yはカーソルより後ろの行をコピーするようにする
nnoremap   Y y$

" Ctrl+Tabでウィンドウの切り替えを行う、Ctrl+Shift+Tabで逆の切り替え(serverlist.vimを使用)
"nnoremap <silent> <C-Tab> :call CycleNextWindow()<CR>
"nnoremap <silent> <C-S-Tab> :call CyclePrevWindow()<CR>
"vnoremap <silent> <C-Tab> :call CycleNextWindow()<CR>
"vnoremap <silent> <C-S-Tab> :call CyclePrevWindow()<CR>
"inoremap <silent> <C-Tab> <C-O>:call CycleNextWindow()<CR>
"inoremap <silent> <C-S-Tab> <C-O>:call CyclePrevWindow()<CR>
" Tabでバッファの切り替えを行う
" Ctrl+Tabでバッファの切り替えを行う
nnoremap <silent> <C-Tab> :bn<CR>
nnoremap <silent> <C-S-Tab> :bp<CR>
vnoremap <silent> <C-Tab> :bn<CR>
vnoremap <silent> <C-S-Tab> :bp<CR>

" 直前にヤンクした文字列を現在の選択範囲に上書きする
xnoremap <silent> p <Esc>:let current_reg = @*<CR>gvs<C-R>=current_reg<CR><Esc>
" gpは貼り付け後にカーソルが貼り付けた領域の最後に移動
xnoremap <silent> gp <Esc>:let current_reg = @*<CR>gvs<C-R>=current_reg<CR><Esc>

" マーク行の色を変える、ztとかで場所をわかりやすくしてもいいかも
"nnoremap gg gg/^.*\%#.*/<CR>

" Insertモード時にCtrl+Lで行補完
"inoremap <silent> <C-L> <C-X><C-L>
if has('win32') || has('win64') || has('gui_macvim')
	" gwを現在バッファにある単語と置き換える
	nnoremap <silent> gw :let current_reg=@*<CR>ciw<C-R>=current_reg<CR><ESC>:let @*=current_reg<CR>
	xnoremap <silent> gw :let current_reg=@*<CR>ciw<C-R>=current_reg<CR><ESC>:let @*=current_reg<CR>
	nnoremap <silent> gW :let current_reg=@*<CR>ciw<C-R>=current_reg<CR><ESC>
	xnoremap <silent> gW :let current_reg=@*<CR>ciw<C-R>=current_reg<CR><ESC>
else
	" gwを現在バッファにある単語と置き換える
	nnoremap <silent> gw :let current_reg=@"<CR>ciw<C-R>=current_reg<CR><ESC>:let @"=current_reg<CR>
	xnoremap <silent> gw :let current_reg=@"<CR>ciw<C-R>=current_reg<CR><ESC>:let @"=current_reg<CR>
	nnoremap <silent> gW :let current_reg=@"<CR>ciw<C-R>=current_reg<CR><ESC>
	xnoremap <silent> gW :let current_reg=@"<CR>ciw<C-R>=current_reg<CR><ESC>
endif


" xの時にクリップボードに保存しないようにする
nnoremap x "_x

" 選択してシフト (選択範囲が解除されないのでそのまま繰り返せる)
xnoremap < <gv
xnoremap > >gv

" CTRL-W,CTRL-Dでpositionを開始位置に戻す {{{
let mapleader = "\<C-w>"
nnoremap <silent> <Leader>d :<C-u>winpos 0 326<CR>
nnoremap <silent> <Leader><C-d> :<C-u>winpos 0 326<CR>
" CTRL-W,CTRL-Fで現在のファイルをあふで開く
nmap <silent> <Leader>f :<C-u>AfxOpen<CR>
nmap <silent> <Leader><C-f> :<C-u>AfxOpen<CR>
unlet mapleader
" }}}

"Spaceで行移動{{{
"nnoremap <silent> <Space> <C-D>
"nnoremap <silent> <S-Space> <C-U>

" grep.vim用設定 {{{
if has('win32')
  let Grep_Path = 'D:\gnuwin32\bin\grep.exe'
  let FGrep_Path = 'D:\gnuwin32\bin\grep.exe -F'
  let EGrep_Path = 'D:\gnuwin32\bin\grep.exe -E'
  let Grep_Find_Path = 'D:\gnuwin32\bin\find.exe'
  let Grep_Xargs_Path = 'D:\gnuwin32\bin\xargs.exe'
  let Grep_Shell_Quote_Char = '"'
endif

" scrnmode.vim用設定(画面いっぱいにvimを広げたとき(:Fever)のFontサイズの指定) {{{
if has('win32')
  let g:fever_guifont = 'ＭＳ_ゴシック:h9:cSHIFTJIS'
endif

" chalice用設定(オートプレビュー機能を使用しない) {{{
let g:chalice_preview=0
" chalice用設定(オートプレビュー時にオートクローズする)
let g:chalice_previewflags='autoclose'
" chalice用設定(起動時にBookmarkを表示)
let chalice_startupflags = 'bookmark'
" cacheディレクトリの設定
if has('win32')
  let g:chalice_cachedir = 'D:/data/2chcache/'
else
  let g:chalice_cachedir = '$HOME/.vim/2chcache'
endif

" AutoCmd memo file {{{
au BufNewFile,BufRead *.memo			setf memo
au BufNewFile,BufRead *.vb			setf vbnet
" }}}

" デフォルトのtab表示の設定 {{{
set showtabline=2
" 新しいバッファを開くときに常に新しいTABで
"au BufAdd,BufNewFile * nested tab sball

" 現在のバッファをすべてtabで開く {{{
let mapleader = "\<C-w>"
nnoremap <silent> <Leader><C-t> :<C-u>tab ball<CR>
nnoremap <silent> <Leader>t :<C-u>tab ball<CR>
unlet mapleader
" }}}

" 現在のバッファの検索結果をvimgrep+quickfixで一覧表示 {{{
nmap <unique> <F3> :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>

" match time {{{
set matchtime=2
" }}}

" コマンドモード時にカーソル移動するのに便利 {{{
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>
" }}}

" 挿入モードでも<A-Space>でシステムメニューを表示 {{{
imap <A-Space> <ESC>:simalt ~<CR>gi
" }}}

" Omni Completion {{{
"imap <C-Space> <C-x><C-o><C-p>
" }}}

" カーソルラインの切り替え {{{
nmap \\cl :set cursorline!<CR>
" }}}

" ステータスライン用 {{{
function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" :help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

"ステータスラインに文字コードと改行文字を表示する
"set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P

" ステータスラインの表示
set statusline=%<     " 行が長すぎるときに切り詰める位置
"set statusline+=[%n]  " バッファ番号
set statusline+=%m    " %m 修正フラグ
set statusline+=%r    " %r 読み込み専用フラグ
set statusline+=%h    " %h ヘルプバッファフラグ
set statusline+=%w    " %w プレビューウィンドウフラグ
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
set statusline+=%y    " バッファ内のファイルのタイプ
set statusline+=\     " 空白スペース
"if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
"else
"  set statusline+=%t    " ファイル名のみ
"endif
set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
set statusline+=\ \   " 空白スペース2個
set statusline+=[%{GetB()}] " カーソル行の文字コードを表示
"set statusline+=%1l   " 何行目にカーソルがあるか
"set statusline+=/
"set statusline+=%L    " バッファ内の総行数
"set statusline+=,
"set statusline+=%c    " 何列目にカーソルがあるか
"set statusline+=%V    " 画面上の何列目にカーソルがあるか
"set statusline+=\ \   " 空白スペース2個
set statusline+=%P    " ファイル内の何％の位置にあるか


"CTRL-Aで8進数の計算をさせない {{{
set nrformats-=octal

" FuzzyFinderFile  {{{
"let g:mapleader = "\\"
"nnoremap <silent> <Leader>f :FuzzyFinderFile<CR>
"nnoremap <silent> <Leader>f :<C-u>FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
"nnoremap <silent> <Leader>b :<C-u>FuzzyFinderBuffer<CR>
"nnoremap <silent> <Leader>h :<C-u>FuzzyFinderMruFile<CR>
"nnoremap <silent> <Leader>c :<C-u>FuzzyFinderMruCmd<CR>
"unlet g:mapleader

"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'MruFile':{}, 'Bookmark':{}, 'Dir':{}, 'Tag':{}, 'TaggedFile':{}}
"大文字小文字を無視する
"let g:FuzzyFinderOptions.Base.ignore_case = 1
"短縮形の追加
"let g:FuzzyFinderOptions.File.abbrev_map = {
"  \ '\C^VP' : [
"  \     '$VIMRUNTIME/plugin/',
"  \     '~/.vim/plugin/',
"  \     '$VIM/.vim/plugin/',
"  \   ],
"  \ '\C^VC' : [
"  \     '$VIMRUNTIME/colors/',
"  \     '~/.vim/colors/',
"  \     '$VIM/.vim/colors/',
"  \   ],
"  \ }
"直前のバッファでオープン
"let g:FuzzyFinderOptions.Base.key_open = '<C-CR>'
"Tabでオープン
"let g:FuzzyFinderOptions.Base.key_open_tab = '<CR>'
"let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|2chcache|\.tmp$|\.howm$|\.exe$|\.dll$|\=$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)'
"let g:FuzzyFinderOptions.MruFile.max_item = 500
"let g:FuzzyFinderOptions.MruFile.excluded_path = '\v\~$|2chcache|\.tmp$|\.howm$|\.exe$|\.dll$|\=$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)'

"let  g:FuzzyFinderOptions = {
      "\   'ignore_case' : 1,
      "\
      "\   'file' : {
      "\     'abbrev_map' : {
      "\       '\C^VP' : [
      "\         '$VIMRUNTIME/plugin/',
      "\         '~/.vim/plugin/',
      "\         '$VIM/.vim/plugin/',
      "\         '$VIM/vimfiles/plugin/',
      "\       ],
      "\       '\C^VC' : [
      "\         '$VIMRUNTIME/colors/',
      "\         '~/.vim/colors/',
      "\         '$VIM/.vim/colors/',
      "\         '$VIM/vimfiles/colors/',
      "\       ],
      "\     },
      "\       'excludedPath' : '\v\~$|\.exe$|\.dll$|\=$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)',
      "\   },
      "\
      "\   'mru_file' : {
      "\       'max_item' : 500,
      "\       'excludedPath' : '\v\~$|\.exe$|\.dll$|\=$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)',
      "\   },
      "\
      "\   'mru_cmd' : {
      "\       'max_item' : 500,
      "\   },
      "\
      "\ }
"}}}

" Tabラベルの設定 {{{
"function GuiTabLabel()
"  let label = ''
"  let bufnrlist = tabpagebuflist(v:lnum)
"  " このタブページに変更のあるバッファがるときには '+' を追加する
"  for bufnr in bufnrlist
"    if getbufvar(bufnr, "&modified")
"      let label = '+'
"      break
"    endif
"  endfor
"  " ウィンドウが複数あるときにはその数を追加する
"  let wincount = tabpagewinnr(v:lnum, '$')
"  if wincount > 1
"    let label .= wincount
"  endif
"  if label != ''
"    let label .= ' '
"  endif
"  " バッファ名を追加する
"  return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
"endfunction
"set guitablabel=%N\ %{GuiTabLabel()}

" tabページの移動 {{{
if has('win32') || has('win64')
	nnoremap <silent> <A-1> :<C-u>tabfirst<CR>
	nnoremap <silent> <A-2> :<C-u>tabnext 2<CR>
	nnoremap <silent> <A-3> :<C-u>tabnext 3<CR>
	nnoremap <silent> <A-4> :<C-u>tabnext 4<CR>
	nnoremap <silent> <A-5> :<C-u>tabnext 5<CR>
	nnoremap <silent> <A-6> :<C-u>tabnext 6<CR>
	nnoremap <silent> <A-7> :<C-u>tabnext 7<CR>
	nnoremap <silent> <A-8> :<C-u>tabnext 8<CR>
	nnoremap <silent> <A-9> :<C-u>tablast<CR>
	nnoremap <silent> <A-0> :<C-u>tablast<CR>
elseif has('gui_macvim')
	nnoremap <silent> <D-1> :<C-u>tabfirst<CR>
	nnoremap <silent> <D-2> :<C-u>tabnext 2<CR>
	nnoremap <silent> <D-3> :<C-u>tabnext 3<CR>
	nnoremap <silent> <D-4> :<C-u>tabnext 4<CR>
	nnoremap <silent> <D-5> :<C-u>tabnext 5<CR>
	nnoremap <silent> <D-6> :<C-u>tabnext 6<CR>
	nnoremap <silent> <D-7> :<C-u>tabnext 7<CR>
	nnoremap <silent> <D-8> :<C-u>tabnext 8<CR>
	nnoremap <silent> <D-9> :<C-u>tablast<CR>
	nnoremap <silent> <D-0> :<C-u>tablast<CR>
endif
nnoremap <silent> <C-N> :<C-u>tabnext <CR>
nnoremap <silent> <C-P> :<C-u>tabprevious <CR>

" 開いたバッファのディレクトリに移動 {{{
"set autochdir

"" :eをしたときに自動でC-dしてリストを表示する
"cabbrev e <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'e <C-d>' : 'e')<CR>
" :grep を入力したら自動的にその後にカーソル下の単語を挿入する
" fuzzyfinderとの関係で最後の<CR>を削除
"cabbrev grep <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Grep <C-r><C-w>' : 'grep')<CR>

"ChangeLog設定{{{
"let g:changelog_username = ''
""mapを有効にする
"runtime ftplugin/changelog.vim

"migemo辞書
if has('win32')
  set migemodict=m:/migemodict/org/dict/migemo-dict
else
endif

"project.vim設定{{{
"let g:proj_flags="imstg"

"viewを保存しておく,diffモード時と無名バッファは保存しない,helpとhowmのファイルも保存しない{{{
function! ChkMkView()
	if &diff == 0 && empty(expand("%")) == 0 && match(expand("%:e"), "jax") == -1 && match(expand("%:p"), "howm\/.*\.howm") == -1
		mkview
	endif
endfunction
"オプションを保存しない
set viewoptions=folds,cursor
if has('win32')
  set viewdir=$HOME/vimfiles/view
else
  set viewdir=$HOME/.vim/view
endif

au BufWinLeave *.* call ChkMkView()
au BufWinEnter *.* silent loadview

"howm設定 {{{
if has('win32')
  set runtimepath+=$VIM/howm_vim
else
  set runtimepath+=$HOME/.vim/howm_vim
endif

let g:howm_fileencoding='utf-8'
let g:howm_dir='~/howm'
"let g:howm_findprg='\"D:/Program\ Files/gnuwin32/bin/find.exe\"'
"let g:howm_grepprg='\"D:/Program\ Files/gnuwin32/bin/grep.exe\"'
"let g:howm_findprg='\"D:/gnuwin32/bin/find.exe\"'
"let g:howm_grepprg='\"D:/gnuwin32/bin/grep.exe\"'
"動いたらすぐプレビュー
"let g:howm_instantpreview = 1
"autopureviewを無効に
"let g:howm_autopreview = 0
"autoshowpreview
let g:howm_auto_show_preview = 1
function! HowmActionlockSnoopy(str, head)
  echo 'よく見るとスヌーピーには似ていない'
endfunction
let g:howm_actionlock_list = [
    \ {
      \ 'list': [
        \ '[ ]',
        \ '[          :  0%]',
        \ '[+         : 10%]',
        \ '[++        : 20%]',
        \ '[+++       : 30%]',
        \ '[++++      : 40%]',
        \ '[+++++     : 50%]',
        \ '[++++++    : 60%]',
        \ '[+++++++   : 70%]',
        \ '[++++++++  : 80%]',
        \ '[+++++++++ : 90%]',
        \ '[++++++++++:100%]'
      \ ],
    \ },
    \ {
      \ 'func': function('HowmActionlockSnoopy'),
      \ 'pat': 'でつ'
    \ },
    \ { 'list': ['[o]', '[x]'] }
  \ ]
"検索文字列の入力時にタグを補完する{{{
function! FullTextSearchInputTgrep()
    let l:searchWord = input('howm Full text search(tgrep): ', '', 'customlist,HowmEnumTags')
    if l:searchWord == '' | return | endif
    let l:searchWord = escape(l:searchWord, '\')
    let l:searchWord = substitute(l:searchWord, l:searchWord , '^' .g:howm_title_pattern. ' .*\\V&', '')
    call HowmCommand('FullTextSearchInputVgrepA', l:searchWord)
endfunction
function! HowmEnumTags(...)
  let l:complist = []
  if a:1 =~ '^[\d32-\d126]\{2,}$'
    let l:searchWord = migemo(a:1)
  else
    let l:searchWord = a:1
  endif
  for l:item in readfile(expand(g:howm_keywordfile))
    " 中間部分一致してほしいならば、'^'をはずす
    if l:item =~ '^'.l:searchWord
      call insert(l:complist, l:item)
    endif
  endfor
  return l:complist
endfunction
command! -nargs=? -complete=customlist,HowmEnumTags HowmTags
nnoremap <silent> ,,s :call FullTextSearchInputTgrep()<CR>

"()を入力した際に色が変わるのをなくす
let loaded_matchparen=1

"grep後に自動でQuickfixを開く
"au QuickfixCmdPost make,grep,grepadd,vimgrep copen
"au QuickfixCmdPost l* lopen

"<F2>でNaviをコール
"nnoremap <silent> <F2> :call Navi()<CR>

"カレントディレクトリから親ディレクトリにさかのぼってtagsファイルを検索する
set tags+=tags;

"sessionを読み込む {{{
"nnoremap  <F11> :wa<Bar>exe "mksession! " . v:this_session<CR>:so $VIM/sessions/<C-D>
"sessionのオプション
"set sessionoptions-=curdir
"set sessionoptions+=sesdir
"set sessionoptions+=resize
"}}}

"{}で同じインデントの行に移動する
nnoremap { :call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^
nnoremap } :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^

"NERD_commenter {{{
"/**/を/* */にする
"let NERDSpaceDelims = 1
"未対応のファイルがあった場合の警告を消す
"let NERDShutUp = 1
"}}}

"autocomplpop設定 {{{
"補完時に大文字小文字を区別しない
"let g:AutoComplPop_IgnoreCaseOption = 1
"起動時にautocomplpopを有効にしない
"let g:AutoComplPop_NotEnableAtStartup = 1
"function! ToggleAutoComplPop()
  "if !exists('s:AutoComplPoping')
    "let s:AutoComplPoping=0
  "endif
  "if s:AutoComplPoping==1
    "AutoComplPopEnable
    "let s:AutoComplPoping=0
  "else
    "AutoComplPopDisable
    "let s:AutoComplPoping=1
  "endif
"endfunction
"<C-k>kで有効、<C-k>dで無効
"let g:mapleader = "\<C-k>"
" nnoremap <silent> <Leader>k :AutoComplPopEnable<CR>
" nnoremap <silent> <Leader><C-k> :AutoComplPopEnable<CR>
" nnoremap <silent> <Leader><C-d> :AutoComplPopDisable<CR>
" nnoremap <silent> <Leader>d :AutoComplPopDisable<CR>
"nnoremap <silent> <Leader>k :call ToggleAutoComplPop()<CR>
"nnoremap <silent> <Leader><C-k> :call ToggleAutoComplPop()<CR>
"unlet g:mapleader
"}}}

" Autocompletion using the TAB key {{{
" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
"function! InsertTabWrapper()
"        let col = col('.') - 1
"        if !col || getline('.')[col - 1] !~ '\k'
"                return "\<TAB>"
"        else
"                if pumvisible()
"                        return "\<C-N>"
"                else
"                        return "\<C-N>\<C-P>"
"                end
"        endif
"endfunction
" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" Autocompletion using the TAB key
"}}}

" サーチの入るときにデフォルトで日本語にしない {{{
set imsearch=0

" like visual studio{{{
nmap <F4> :<C-u>copen<CR>\|:cnext<CR>
" like visual studio
nmap <S-F4> :<C-u>copen<CR>\|:cprev<CR>
"}}}

" AutoClose初期表示OFF {{{
"let g:autoclose_on=0
"}}}

" バッファから検索
"nmap <unique> G/ :silent exec ':bufdo vimgrepadd /' . getreg('/') . '/j %'<CR>\|:silent cwin<CR>

"コマンドモード時にceditで編集モード
set cedit=<C-O>

"日付の挿入{{{
imap <F2> <C-r>=Strftime2("%Y-%m-%d")<CR>

"diffの設定{{{
"F7とF8で前後の変更箇所へ移動
nnoremap <F7> [c
nnoremap <F8> ]c
"let g:mapleader = "\\"
"<Leader>dqでDiffから抜ける
"nmap <Leader>dq :winc l<CR>:bw<CR>:diffoff<CR>
"dqでDiffから抜ける
"nnoremap <silent> dq :call DiffOff()<CR>
"unlet g:mapleader
"Diffモードを抜ける
"function! DiffOff()
"  if &diff
"    " change to diff window(right)
"    wincmd l
"    " buffer delete
"    silent execute ":bwipeout"
"    silent execute ":diffoff"
"  endif
"endfunction
nnoremap <silent> J :call NextDiff()<CR>
nnoremap <silent> K :call Prevdiff()<CR>
function! NextDiff()
	if &diff
		silent normal ]c
	else
		silent normal! J
	endif
endfunction
function! Prevdiff()
	if &diff
		silent normal [c
	else
		"silent execute ":<C-u>call ref#K('normal')"
		silent execute ":call ref#K('normal')"
	endif
endfunction
"}}}

"refe.vimの設定{{{
"augroup BufferAu
"    autocmd! BufferAu
"    "初期化
"    au BufEnter * nnoremap K K
"    ".rbファイルでKでRefe検索
"    au BufEnter *.rb nnoremap <silent> K :Refe <cword><CR>
"augroup END
"}}}

"Rubyの設定{{{
"preview interpreter's output(Tip #1244)
function! Ruby_eval_vsplit() range
    if &filetype == "ruby"
        let src = tempname()
        let dst = "Ruby Output"
        " put current buffer's content in a temp file
        silent execute ": " . a:firstline . "," . a:lastline . "w " . src
        " open the preview window
        silent execute ":pedit! " . dst
        " change to preview window
        wincmd P
        " set options
        setlocal buftype=nofile
        setlocal noswapfile
        setlocal syntax=none
        setlocal bufhidden=delete
        " replace current buffer with ruby's output
        silent execute ":%! ruby " . src . " 2>&1 "
        " change back to the source buffer
        wincmd p
    endif
endfunction
"<F10>でバッファのRubyスクリプトを実行し、結果をプレビュー表示
vmap <silent> <F10> :call Ruby_eval_vsplit()<CR>
nmap <silent> <F10> mzggVG<F10>`z
map  <silent> <S-F10> :pc<CR>
"<M-F10>でRubyスクリプトを保存後シンタックスチェックし、エラーをQuickFixに表示
nmap <silent> <M-F10> :w<CR>:make -c %<CR>:cw<CR>:cfirst<CR>zz
nmap <silent> <M-S-F10> :ccl<CR>
"<C-F10>でRubyスクリプトを保存後コマンドプロンプトから実行
nmap <silent> <C-F10> :w<CR>:!ruby %<CR>

" 「:OccurMigemo ame」で「雨」とか「飴」とか「AME」とか探せる。{{{
command -complete=tag -nargs=1 OccurMigemo call s:OccurMigemo() | cwindow
command -complete=tag -nargs=1 MultiOccurMigemo call s:MultiOccurMigemo() | cwindow
" 「:GrepMigemo ame *.txt」みたいに。
command -complete=tag -nargs=+ GrepMigemo call s:GrepMigemo() | cwindow

function s:OccurMigemo(pat)
  execute 'vimgrep /' . migemo(a:pat) . '/ ' . escape(expand('%'), ' \')
endfunction

function s:MultiOccurMigemo(pat)
  execute 'vimgrep /' . migemo(a:pat) . '/ ' . join(s:BufList(), ' ')
endfunction

function s:GrepMigemo(pat, ...)
  execute 'vimgrep /' . migemo(a:pat) . '/ ' . join(a:000, ' ')
endfunction

" 検索時に結果が中央に来るようにする
"nmap n nzz
"nmap N Nzz
"nmap * *zz
"nmap # #zz
"nmap g* g*zz
"nmap g# g#zz
"nmap g/ g/zz

"nmap sj <C-W>j<C-w>_
"nmap sk <C-W>k<C-w>_
"nmap sh <C-w>h<C-w>_
"nmap sl <C-w>l<C-w>_

"term color {{{2
if $TERM =~ "xterm-256color"
  colorscheme desert256
  " omini..
  highlight Pmenu ctermbg=8
  highlight PmenuSel ctermbg=12
  highlight PmenuSbar ctermbg=0
endif

"highlight ZenkakuSpace ctermbg=6
"match ZenkakuSpace /\s\+$\|　/
""Markに色をつける
"syntax match Mark /\%'a.../ containedin=ALL
"highlight def link Mark Todo

" <C-u>をアンドゥできるようにする。insert.jax参照
inoremap <C-u> <C-G>u<C-u>
inoremap <C-w> <C-G>u<C-w>

"smartchrの設定{{{
"autocmd FileType php inoremap <buffer> <expr> = smartchr#one_of('=', ' = ', ' == ', ' === ','=')
"autocmd FileType php inoremap <buffer> <expr> ! smartchr#one_of('!', ' != ', ' !== ', '!')
"前に<buffer>付けるとバッファonly
"inoremap <buffer> <expr> =  smartchr#one_of(' = ', '=', ' == ')
"inoremap <expr> =  smartchr#one_of(' = ', '=', ' == ', ' = ')
"inoremap <expr> %  smartchr#one_of(' % ', '%', ' %= ', ' % ')
"inoremap <expr> +  smartchr#one_of(' + ', '+', '++', ' += ')
"inoremap <expr> -  smartchr#one_of(' - ', '-', '--', ' -= ')
"スラッシュはあるとだめかも。。
"inoremap <expr> /  smartchr#one_of(' / ', '/')
"inoremap <expr> *  smartchr#one_of(' * ', '*', ' *= ')
"inoremap <expr> ,  smartchr#one_of(', ', ',', ', ')
" }}}

" 最後に編集したところを選択する
nnoremap gc `[v`]
" Specify the last changed text as {motion}.
onoremap gc :<C-u>normal gc<CR>

" 分割したときの移動を楽にする（最後に_が着くと、現在の画面が広くなる）
" nnoremap <C-j> <C-W>j<C-w>_
" nnoremap <C-k> <C-W>k<C-w>_
" nnoremap <C-h> <C-w>h<C-w>_
" nnoremap <C-l> <C-w>l<C-w>_

""split時の移動
"nnoremap sh <C-w>h
"nnoremap sj <C-w>j
"nnoremap sk <C-w>k
"nnoremap sl <C-w>l
""split時の位置入れ替え
"nnoremap sH <C-w>H
"nnoremap sJ <C-w>J
"nnoremap sK <C-w>K
"nnoremap sL <C-w>L

" to show <Space> in the bottom line.
map <Space>  [Space]

" fallback
noremap [Space]  <Nop>

"検索時のハイライト消し
nnoremap <silent> [Space]/ :<C-u>nohlsearch<CR>

" 保存と終了のマッピング
nnoremap <silent> [Space]w :<C-u>write<CR>
nnoremap <silent> [Space]q :<C-u>quit<CR>

" マーク一覧
nnoremap <silent> [Space]m  :marks<CR>
" レジスタ一覧
nnoremap <silent> [Space]r  :registers<CR>

"ALT-UPでメニュー隠す、ALT-DOWNでメニュー復活
nnoremap <A-UP> :set guioptions-=m<CR>
nnoremap <A-DOWN> :set guioptions+=m<CR>

"ノーマルモードでエンターキーで改行挿入
"nnoremap <CR> o<ESC>

"挿入モード時にCtrl-Iで抜けて末尾に移動
"inoremap <C-i> <C-o>A
"inoremap <C-e> <Esc>A
imap <c-e> <Esc>A

" changelogのマッピング {{{
"nnoremap <silent> [Space]o :NewChangelogEntry<CR>

" smartword ON-OFF {{{
let s:ToggleSmartWordON=0
function! ToggleSmartWord()
  if s:ToggleSmartWordON==1
    unmap w
    unmap b
    unmap e
    unmap ge
    unmap W
    unmap B
    unmap E
    unmap gE
    let s:ToggleSmartWordON=0
  else
    map w  <Plug>(smartword-w)
    map b  <Plug>(smartword-b)
    map e  <Plug>(smartword-e)
    map ge <Plug>(smartword-ge)
    noremap W  w
    noremap B  b
    noremap E  e
    noremap gE ge
    let s:ToggleSmartWordON=1
  endif
endfunction
"nnoremap <silent> [Space]j :call ToggleSmartWord()<CR>

" foldingをh,lで閉じたり開いたりするマッピング {{{
" 行頭で h を押すと折畳を閉じる。
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" 折畳上で l を押すと折畳を開く。
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる。
xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" 折畳上で l を押すと選択範囲に含まれる折畳を開く。
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'
" }}}


"Command-line windowの設定
"nnoremap <sid>(command-line-enter) q:
"xnoremap <sid>(command-line-enter) q:
"nnoremap <sid>(command-line-norange) q:<C-u>
"
"nmap :  <sid>(command-line-enter)
"xmap :  <sid>(command-line-enter)
"
"autocmd MyAutoCmd CmdwinEnter * call s:init_cmdwin()
"function! s:init_cmdwin()
"  nnoremap <buffer> q :<C-u>quit<CR>
"  nnoremap <buffer> <TAB> :<C-u>quit<CR>
"  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
"  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"
"  " Completion.
"  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"  startinsert!
"endfunction
"


"neocomplecache.vim {{{
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
        \ }
	
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"imap <C-k>     <Plug>(neocomplcache_start_unite_complete)
"smap <C-k>     <Plug>(neocomplcache_start_unite_complete)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"vimのfile補完をneocomplecacheに置き換える
inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()
"vimのオムニ補完をneocomplecacheに置き換える
inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()
" snippetsのフォルダ設定
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'
" }}}

" unite.vim {{{
"入力モード開始する
let g:unite_enable_start_insert = 1
"let g:mapleader = "\\"
let mapleader = "0"
"バッファ一覧
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
"ファイル一覧
nnoremap <silent> <Leader>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
"nnoremap <silent> <Leader>r :<C-u>Unite -buffer-name=register register<CR>
" grep一覧
nnoremap <silent> <Leader>g :<C-u>Unite -buffer-name=grep -auto-preview -no-quit grep<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>h :<C-u>Unite -buffer-name=files file_mru<CR>
" 常用セット
nnoremap <silent> <Leader>u :<C-u>Unite -buffer-name=files buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <Leader>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" outline
nnoremap <silent> <Leader>o :<C-u>Unite -buffer-name=outline outline -no-start-insert -auto-preview<CR>
nnoremap <silent> <F2> :<C-u>Unite -buffer-name=outline outline -no-start-insert -auto-preview<CR>
if has('win32') || has('win64')
	nnoremap <silent> <Leader>e :<C-u>Unite -buffer-name=files everything<CR>
else
	nnoremap <silent> <Leader>e :<C-u>Unite -buffer-name=files locate<CR>
endif
" history/command
nnoremap <silent> <Leader>: :<C-u>Unite -buffer-name=history/command history/command<CR>
"nnoremap <silent> q: :<C-u>Unite -no-start-insert -buffer-name=history/command history/command<CR>
" history/search
nnoremap <silent> <Leader>/ :<C-u>Unite -buffer-name=history/search history/search<CR>
"nnoremap <silent> q/ :<C-u>Unite -buffer-name=history/search history/search<CR>
" unite-help
nnoremap <silent> <C-h> :<C-u>Unite -buffer-name=help -start-insert help<CR>
" unite-alignta
nnoremap <silent> <Leader>A :<C-u>Unite -buffer-name=alignta -start-insert alignta<CR>
xnoremap <silent> <Leader>A :Unite -buffer-name=alignta -start-insert alignta<CR>
" unite-fire_rec project mode 
"nnoremap <silent> <Leader>r :<C-u>call <SID>unite_project("-buffer-name=files","-input=!assets")<CR>
"nnoremap <silent> <Leader>r :<C-u>call <SID>unite_project("-buffer-name=files","-input=".expand('%:e'))<CR>
nnoremap <silent> <Leader>r :<C-u>call <SID>unite_project("-buffer-name=files","-input=".expand('%:e'))<CR>
" unite-line
nnoremap <silent> <Leader>l :<C-u>Unite line<CR>
" unite-resumeでuniteバッファを復元する
nnoremap <silent> <Leader>R :<C-u>Unite resume<CR>
" unite-mappings
nnoremap <silent> <Leader>m :<C-u>Unite -buffer-name=mapping -start-insert mapping<CR>
unlet mapleader
" 00を0にする
nnoremap <silent> 00 0
" ブックマーク一覧
nnoremap <silent> gn :<C-u>Unite -buffer-name=bookmark -default-action=tabopen -input=:: -immediately -start-insert bookmark<CR>
nnoremap <silent> gN :<C-u>Unite -buffer-name=bookmark -input=:: -immediately -start-insert bookmark<CR>
"let mapleader = "1"
"" outline
"nnoremap <silent> <Leader>o :<C-u>Unite -buffer-name=outline outline -auto-preview<CR>
"unlet mapleader
"" 11を1にする
"nnoremap <silent> 11 1
" unite-outlineをfoにマッピング！
nmap <silent> fo :<C-u>Unite -buffer-name=outline outline -no-start-insert -auto-preview<CR>
" unite-lineをflにマッピング！
nmap <silent> fl :<C-u>Unite -buffer-name=line line -start-insert<CR>

" unite.vim の file_rec でプロジェクトのファイルを一望する - Alone Like a Rhinoceros Horn
" http://d.hatena.ne.jp/h1mesuke/touch/20110918/p1
function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction
" ファイル削除時に使用するコマンドの設定
if has('mac')
	let g:unite_kind_file_delete_file_command="trash $srcs"
	let g:unite_kind_file_delete_directory_command="trash $srcs"
endif

"let g:unite_source_file_rec_ignore_pattern='\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|assets'
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
 " c-wでパス単位で削除するように変更
 imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
 imap <buffer> jj <Plug>(unite_insert_leave)
 nmap <buffer> <C-w> <Plug>(unite_delete_backward_path)
 "" c-aでカーソルを先頭に移動して絞り込みテキスト入力を開始する
 "imap <buffer> <C-a> <Plug>(unite_insert_head)
 " c-eでカーソルを行末に移動して絞り込みテキスト入力を開始する
 nmap <buffer> <C-e> <Plug>(unite_append_end)
 "" c-uでカーソルから行の先頭までの文字を全て削除する
 "imap <buffer> <C-u> <Plug>(unite_delete_backward_line)
 " ESCキーを2回押すと終了する
 nmap <silent><buffer> <ESC><ESC> :<C-u>q<CR>
 imap <silent><buffer> <ESC><ESC> <ESC>:<C-u>q<CR>
 " ウィンドウを分割して開く
 nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
 " ウィンドウを縦に分割して開く
 nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 " タブで開く
 nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
 inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
 " c-dでbufferからdelete
 nnoremap <silent> <buffer> <expr> <C-d> unite#do_action('delete')
 inoremap <silent> <buffer> <expr> <C-d> unite#do_action('delete')
	" buffer-name=filesで曖昧マッチを使用する
	"call unite#set_substitute_pattern('files', '[[:alnum:]]', '*\0', 120)
	"call unite#set_substitute_pattern('files', '[[:alnum:]]', ' \0', 100)
	"call unite#set_substitute_pattern('files', '[0-9A-Za-z]', '*\0', 100)
	"call unite#set_substitute_pattern('files', '[0-9A-Za-z]', ' \0', 100)
	" oで選択したときはフォルダ展開する
	inoremap <buffer><expr> o unite#smart_map('o', unite#do_action('default')) 
	nnoremap <buffer><expr> o unite#do_action('default')
	let l:unite = unite#get_current_unite()
	if l:unite.buffer_name ==# 'grep'
		nnoremap <buffer><expr> r unite#do_action('replace')
	elseif l:unite.buffer_name ==# 'files'
		nnoremap <buffer><expr> r unite#do_action('rec')
		inoremap <buffer><expr> r unite#smart_map('r', unite#do_action('rec')) 
	endif
	"nnoremap <buffer><silent> <C-n> :<C-u>tabnext <CR>
	"nnoremap <buffer><silent> <C-p> :<C-u>tabprevious <CR>
	nnoremap <buffer><silent> <C-n> <Plug>(unite_select_next_line)
	nnoremap <buffer><silent> <C-p> <Plug>(unite_select_previous_line)
	"nnoremap <buffer><silent> <C-e> unite#do_action('edit')
endfunction

"fileに対するデフォルトのactionをtabopenに設定
"call unite#custom_default_action('file', 'tabopen')

"ショートカット
"call unite#set_substitute_pattern('files', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/*"', 2)
"call unite#set_substitute_pattern('files', '^@', '\=getcwd()."/*"', 1)
"call unite#set_substitute_pattern('files', '^\\', '~/*')
"
"if has('win32') || has('win64')
"  call unite#set_substitute_pattern('files', '^:p', 'C:/Program Files/*')
"endif
"ignorecaseに設定
"let g:unite_enable_ignore_case='1'
"let g:unite_enable_smart_case='1'
"call unite#set_buffer_name_option('files', 'smartcase', 1)
"call unite#set_buffer_name_option('files', 'ignorecase', 1)
" デフォルトでは ignorecase と smartcase を使う
"call unite#set_buffer_name_option('default', 'ignorecase', 1)
"call unite#set_buffer_name_option('default', 'smartcase', 1)
"let g:unite_source_file_mru_ignore_pattern='\.git'
" }}}

" 特殊なmappingの設定{{{
augroup my_ex_mappings
	
	autocmd! my_ex_mappings
	"autocmd FileType * nnoremap <buffer><silent> q: :<C-u>Unite -no-start-insert -buffer-name=history/command history/command<CR>
	"autocmd FileType * nnoremap <buffer><silent> q: :<C-u>Unite -buffer-name=history/command history/command<CR>
	"autocmd FileType unite,vimfiler,vimshell,ref-phpmanual nunmap <buffer> q:
	autocmd FileType vimshell nnoremap <buffer><silent> <C-N> :<C-u>tabnext <CR>
	autocmd FileType vimshell nnoremap <buffer><silent> <C-P> :<C-u>tabprevious <CR>
	autocmd FileType vimshell nmap <buffer><silent> J <Plug>(vimshell_next_prompt)
	autocmd FileType vimshell nmap <buffer><silent> K <Plug>(vimshell_previous_prompt)
	" quickfix用設定(qの記録はそこまで使わないため、Qに設定) {{{2
	"autocmd FileType * nnoremap <buffer> Q q
	"autocmd FileType unite,vimfiler,vimshell nunmap <buffer> Q
	"autocmd FileType * nnoremap <buffer> qj  :cnext<Return>
	"autocmd FileType unite,vimfiler,vimshell nunmap <buffer> qj
	"nnoremap qk  :cprevious<Return>
	"nnoremap qr  :crewind<Return>
	"nnoremap qK  :cfirst<Return>
	"nnoremap qJ  :clast<Return>
	"nnoremap qf  :cnfile<Return>
	"nnoremap qF  :cpfile<Return>
	"nnoremap ql  :clist<Return>
	"nnoremap qq  :cc<Return>
	"nnoremap qo  :copen<Return>
	"nnoremap qc  :cclose<Return>
	"nnoremap qw  :cwindow<Return>
	"nnoremap qp  :colder<Return>
	"nnoremap qn  :cnewer<Return>
	"nnoremap qm  :make<Return>
	"nnoremap qM  :make<Space>
	"nnoremap qg  :grep<Space>
	"nnoremap q   <Nop>
	"nnoremap q/  q/
	" }}}
augroup END

"}}}

" vim-surround"{{{
let g:surround_no_mappings = 1
autocmd my_ex_mappings FileType * call s:define_surround_keymappings()

function! s:define_surround_keymappings()
  if !&modifiable
    return
  endif

  nmap <buffer> ds <Plug>Dsurround
  nmap <buffer> cs <Plug>Csurround
  nmap <buffer> ys <Plug>Ysurround
  nmap <buffer> yS <Plug>YSurround
  nmap <buffer> yss <Plug>Yssurround
  nmap <buffer> ySs <Plug>YSsurround
  nmap <buffer> ySS <Plug>YSsurround
	xmap <buffer> S   <Plug>VSurround
	xmap <buffer> gS  <Plug>VgSurround
	xnoremap <buffer><silent> s :<C-U>echoerr 'surround.vim: Visual mode s has been removed in favor of S'<CR>
	if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
		imap    <buffer><C-S> <Plug>Isurround
	endif
	imap      <buffer><C-G>s <Plug>Isurround
	imap      <buffer><C-G>S <Plug>ISurround
endfunction
"autocmd my_ex_mappings FileType unite nunmap <buffer> ds
"}}}

" pathogen設定{{{
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
filetype plugin on
" }}}

" neobundle.vim {{{
"set nocompatible
"filetype off
"
"if has('vim_starting')
"  set runtimepath+='~/.vim/bundle/neobundle.vim'
"
"  call neobundle#rc(expand('~/.vim/bundle'))
"endif
"
"NeoBundle 'git://github.com/Shougo/echodoc.git'
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"NeoBundle 'git://github.com/Shougo/unite.vim.git'
"NeoBundle 'git://github.com/Shougo/vimfiler.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/Shougo/vimproc.git'
"NeoBundle 'git://github.com/vim-scripts/ZoomWin.git'
"NeoBundle 'git://github.com/mattn/gist-vim.git'
"NeoBundle 'git://github.com/Shougo/vimshell.git'
"NeoBundle 'git://github.com/ujihisa/quickrun.git'
"NeoBundle 'git://github.com/ujihisa/vimshell-ssh.git'
"NeoBundle 'git://github.com/tsukkee/unite-help.git'
"NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
"NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
"NeoBundle 'git://github.com/mivok/vimtodo.git'
"NeoBundle 'git://github.com/tpope/vim-fugitive.git'
"NeoBundle 'git://github.com/tpope/vim-surround.git'
"NeoBundle 'git://github.com/thinca/vim-unite-history.git'
"
"filetype plugin on
"filetype indent on
" }}}

" vimproc設定{{{
let g:vimproc_dll_path = $HOME . '/.vim/autoload/proc.so'
" }}}

set softtabstop=2
set tabstop=2
set shiftwidth=2

"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

"set diffopt-=filler
"set diffopt+=vertical
"半角スペースの数が比較している行で違っていてもそれを無視してdiff実行
set diffopt+=iwhite

"タブ移動リマップ
nnoremap t gt
nnoremap T gT
nnoremap <Right> gt
nnoremap <Left> gT

"セパレートウィンドウを切り替えをリマップ
"nnoremap <C-w> <C-w><C-w>

" vimshell.vim {{{
let g:vimshell_user_prompt = 'getcwd()'
let g:vimshell_max_command_history = 3000

let mapleader = "\\"
"vimshellの起動
"nnoremap <silent> <Leader>s :<C-u>VimShellTab<CR>
nnoremap <silent> <Leader>st :<C-u>VimShellTab<CR>
nnoremap <silent> <Leader>ss :<C-u>VimShell<CR>
nnoremap <silent> <Leader>s :<C-u>VimShell<CR>
"vimshellInteracitive
nnoremap <silent> <Leader>i :<C-u>VimShellInteractive 
"vimfilerの起動
nnoremap <silent> <Leader>ft :<C-u>VimFilerTab<CR>
nnoremap <silent> <Leader>ff :<C-u>VimFiler<CR>
nnoremap <silent> <Leader>f :<C-u>VimFiler<CR>
"vimfilerdoubleの起動
nnoremap <silent> <Leader>d :<C-u>VimFilerDouble<CR>
unlet mapleader
" }}}

" vimfiler.vim {{{
" デフォルトのエクスプローラーをvimfilerにする
let g:vimfiler_as_default_explorer = 1
" 起動時からsafeモード解除
let g:vimfiler_safe_mode_by_default = 0
" directoryを選択したときにgcpを使用するように修正
"if has('mac')
"  let g:unite_kind_file_copy_file_command = '/opt/local/bin/gcp -p $srcs $dest'
"  let g:unite_kind_file_copy_directory_command = '/opt/local/bin/gcp -p -r $srcs $dest'
"	let g:unite_kind_file_move_command = '/opt/local/bin/gmv $srcs $dest'
"endif
" vimfiler上の独自キーマッピング
autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
	" ファイルパス名をyank	
	if has('win32') || has('win64') || has('gui_macvim')
		"nnoremap <buffer> <C-g> :<C-u>let @*=vimfiler#get_filename(line('.'))<CR>
		nmap <buffer><silent> <C-g> :<C-u>let @*=vimfiler#get_filename(line('.'))<CR>:<C-u>echo vimfiler#get_filename(line('.'))<CR>
	else
		"nnoremap <buffer> <C-g> :<C-u>let @"=vimfiler#get_filename(line('.'))<CR>
		nmap <buffer><silent> <C-g> :<C-u>let @"=vimfiler#get_filename(line('.'))<CR>:<C-u>echo vimfiler#get_filename(line('.'))<CR>
	endif
endfunction
" }}}

" open-browser.vim {{{
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" }}}

set sessionoptions-=options
"set grepprg=jvgrep

" カーソル行をハイライト
set cursorline!
" smart indentを使用する
set smartindent

" カレントウィンドウにのみ罫線を引く
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END

" ターミナル上のみのつもりgui版以外のがいいかも？
"if !has('win32') && !has('win64') && !has('gui_macvim')
if $TERM =~ "xterm"

	":hi clear CursorLine
	":hi CursorLine gui=underline
	"highlight CursorLine ctermbg=black guibg=black

	" iTermのみ対応ターミナル上でカーソル形状を変える
	" http://yakinikunotare.boo.jp/orebase2/vim/change_cursor_shape_in_terminal_with_mode_change
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	inoremap <Esc> <Esc><Esc>
	set lazyredraw
	" マウスを使えるようにする！
	set mouse=a
endif


" for Fugitive.vim {{{
let mapleader = "\\"
nnoremap <Leader>gd :<C-u>Gdiff<Enter>
nnoremap <Leader>gs :<C-u>Gstatus<Enter>
nnoremap <Leader>gl :<C-u>Glog<Enter>
nnoremap <Leader>ga :<C-u>Gwrite<Enter>
nnoremap <Leader>gc :<C-u>Gcommit<Enter>
nnoremap <Leader>gC :<C-u>Git commit --amend<Enter>
nnoremap <Leader>gb :<C-u>Gblame<Enter>
unlet mapleader

" fugitive上の独自キーマッピング
autocmd FileType gitcommit call s:gitcommit_my_settings()
function! s:gitcommit_my_settings()
  " gitcommit上で?を押したときにhelpを表示
  nmap <buffer><silent> ? :<C-u>Unite -no-start-insert -buffer-name=fugitive/mapping fugitive/mapping<CR>
endfunction
" }}}

" c-gを2c-gに
nnoremap <C-g> <Esc>2<C-g>
" aをa!に
"cnoremap a<CR> a!<CR>

" foldmethod=markerに
set foldmethod=marker
" :mes で出てくるメッセージは適当にクリップボードにコピーする。 in Vim - Humanity{{{
" http://d.hatena.ne.jp/tyru/20110624/copy_messages_to_clipboard
command! MessCopy call s:messcopy()
if has('win32') || has('win64') || has('gui_macvim')
	function! s:messcopy()
    redir @+>
    silent messages
    redir END
    " Copy to selection too.
			call setreg('*', getreg('*', 1), getregtype('*'))
	endfunction
else
	function! s:messcopy()
			redir @">
			silent messages
			redir END
			" Copy to selection too.
			call setreg('"', getreg('"', 1), getregtype('"'))
	endfunction
endif
" }}}
 
" F12でset nonuをtoggleする{{{
let g:setnumber = 1
function! ToggleSetNumber()
  if g:setnumber==1
    set number
		let g:setnumber = 0
  else
		set nonumber
		let g:setnumber = 1
  endif
endfunction
nnoremap <silent> <F12> :call ToggleSetNumber()<CR>
" }}}

" dt(とかをd(とかでできる{{{
onoremap ( t(
onoremap ) t)
onoremap [ t[
onoremap ] t]
" }}}

" ZoomWin設定{{{
nmap <unique> <c-w>o  <Plug>ZoomWin
nmap <unique> <c-w><c-o>  <Plug>ZoomWin
" }}}

" submode.vim{{{
" たとえば、ウィンドウのサイズ変更（<C-w>+とか）を
" 繰り返し入力するのは大変！
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
" textmanip{{{
call submode#enter_with('textmanip', 'v', 'r', '<C-t>h', '<Plug>(textmanip-move-left)')
call submode#enter_with('textmanip', 'v', 'r', '<C-t>j', '<Plug>(textmanip-move-down)')
call submode#enter_with('textmanip', 'v', 'r', '<C-t>k', '<Plug>(textmanip-move-up)')
call submode#enter_with('textmanip', 'v', 'r', '<C-t>l', '<Plug>(textmanip-move-right)')
call submode#map('textmanip', 'v', 'r', 'h', '<Plug>(textmanip-move-left)')
call submode#map('textmanip', 'v', 'r', 'j', '<Plug>(textmanip-move-down)')
call submode#map('textmanip', 'v', 'r', 'k', '<Plug>(textmanip-move-up)')
call submode#map('textmanip', 'v', 'r', 'l', '<Plug>(textmanip-move-right)')
" }}}
" }}}

" Ex modeの履歴を遡るのもちょっと楽できる{{{
" yokohama.vim#2 by tsukkee
cnoremap <C-p> <Up>
cnoremap <Up> <C-p>
cnoremap <C-n> <Down>
cnoremap <Down> <C-n>
" }}}

" vimtodo.vim{{{
let g:todo_checkbox_states = [
        \[" ", "X", "-"]]
" vimtodo.vim上でのキーマッピング
autocmd FileType todo call s:todo_my_settings()
function! s:todo_my_settings()
  nmap <buffer> 9x :Overdue<CR>
  nmap <buffer> 9w :Week<CR>
  nmap <buffer> 9f :Tomorrow<CR>
  nmap <buffer> 9d :Today<CR>
  nmap <buffer> 9e <Plug>TodoUpdateTimeTotal
  nmap <buffer> 9a <Plug>TodoArchiveDone
  nmap <buffer> 9l <Plug>TodoLoadLink
  nmap <buffer> 9t <Plug>TodoLoadTaskLink
  nmap <buffer> 9s <Plug>TodoNextTaskState
  nmap <buffer> 9v <Plug>TodoPromptTaskState
  nmap <buffer> 9c <Plug>TodoCheckboxToggle
  nmap <buffer> 9b <Plug>TodoInsertCheckbox
  nmap <buffer> 9n oTODO ds<Space>
  iabbrev <buffer> cc [ ]
  nnoremap <buffer><silent> 99 9
	nmap <buffer><silent> J /\<TODO[^:]<CR>
	nmap <buffer><silent> K ?\<TODO[^:]<CR>
endfunction
" }}}

" 現在のファイルとカレントディレクトリにある同名のファイルをdiffする {{{
command! CurrentDiff call s:currentdiff()
command! CurrentVDiff call s:currentvdiff()
function! s:currentdiff()
	let filename = expand("%:t")
	execute ":diffsplit ".expand("%:t")
endfunction
function! s:currentvdiff()
	let filename = expand("%:t")
	execute ":vertical diffsplit ".expand("%:t")
endfunction
" }}}

" 環境依存設定{{{
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
if has('mac') && filereadable(expand('~/.vimrc.mac'))
	source ~/.vimrc.mac
endif
if (has('win32') || has('win64')) && filereadable(expand('~/.vimrc.win'))
	source ~/.vimrc.win
endif
" }}}

" vim-altercmd {{{
call altercmd#load()
command!
\ -bar -nargs=+
\ MapAlterCommand
\ CAlterCommand <args> | AlterCommand <cmdwin> <args>
" }}}

" restart.vim {{{
command!
\ -bar
\ RestartWithSession
\ let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
\ | Restart

MapAlterCommand res[tart] Restart
MapAlterCommand ers[tart] Restart
MapAlterCommand rse[tart] Restart
" }}}


