" vim-plug install
" $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
" $   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"vim-plug{{{1
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug',
			\ {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'LeafCage/yankround.vim'
Plug 'kana/vim-smartword'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-gf-user'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'rking/ag.vim'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neossh.vim'
Plug 'Shougo/vinarise.vim'
Plug 'h1mesuke/vim-alignta'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
Plug 'vim-scripts/DrawIt'
" unite関連
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-help'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'Sixeight/unite-grep'
Plug 'basyura/unite-rails'
Plug 'thinca/vim-unite-history'
Plug 'tsukkee/unite-tag'
Plug 'choplin/unite-vim_hacks'
Plug 'sgur/unite-qf'
Plug 'glidenote/memolist.vim'
call plug#end()

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:{{{1
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" サーチの入るときにデフォルトで日本語にしない
set imsearch=0
"---------------------------------------------------------------------------
" 編集に関する設定:{{{1
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu wildmode=list:full
" textwidthで自動改行しない
set formatoptions=q
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=M
" 禁則処理 OFF
set textwidth=0
if has('win32') || has('win64')
  set encoding=utf-8
endif
set autoindent                   " auto indent を使用
set smartindent                  " smart indent を使用
set cindent                      " c indent を使用
" 左右のカーソルキーでは行を跨って移動
set whichwrap=b,s,[,],<,>
" TABはTABのまま
set noexpandtab
" BACKSPACEで、改行も消せる
set backspace=indent,eol,start   
" 現在のバッファをすべてtabで開く
let mapleader = "\<C-w>"
nnoremap <silent> <Leader><C-t> :<C-u>tab ball<CR>
nnoremap <silent> <Leader>t :<C-u>tab ball<CR>
unlet mapleader
"コマンドモード時にceditで編集モード
set cedit=<C-O>
" 括弧両方入力時自動で中に移動
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:{{{1
" 行番号を表示
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を非表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>-,trail:_,eol:$
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
" スクロールするときに３行余分がある？
set scrolloff=3                  
" マッチしているカッコを表示するための時間
set matchtime=2
" tabを常に表示
set showtabline=2
"()を入力した際に色が変わるのをなくす
let loaded_matchparen=1

"---------------------------------------------------------------------------
" ファイル操作に関する設定:{{{1
" バックアップファイルを作成しない
set nobackup                       " .bak ファイルは通常作らない
if has('win32') || has('win64')
  set   directory=c:/temp             " > で、始めているとファイルと同じ所には
else
  set   directory=/tmp             " > で、始めているとファイルと同じ所には
endif
if has('win32') || has('win64')
  set   backupdir=>%TMP%             " .bakファイルを作るときは、指定したところに作る。
else
  set   backupdir=>/tmp
endif
set   shellslash                   " ディレクトリの区切り文字を"/"にする
"オプションを保存しない
set viewoptions-=options
""""""""""""""""""""""""""""""{{{1
"Kaoriya版に添付されているプラグインの無効化
"問題があるものもあるので一律に無効化します。
"ファイルを参照(コメント部分で gf を実行)した上で、必要なプラグインは
"let plugin_..._disableの設定行をコメント化(削除)して有効にして下さい。
""""""""""""""""""""""""""""""
"$VIM/plugins/kaoriya/autodate.vim
let plugin_autodate_disable  = 1
"$VIM/plugins/kaoriya/cmdex.vim
" let plugin_cmdex_disable     = 1
"$VIM/plugins/kaoriya/dicwin.vim
let plugin_dicwin_disable    = 1
"$VIMRUNTIME/plugin/format.vim
let plugin_format_disable    = 1
"$VIM/plugins/kaoriya/hz_ja.vim
let plugin_hz_ja_disable     = 1
"$VIM/plugins/kaoriya/scrnmode.vim
let plugin_scrnmode_disable  = 1
"$VIM/plugins/kaoriya/verifyenc.vim
let plugin_verifyenc_disable = 1
"カレントディレクトリから親ディレクトリにさかのぼってtagsファイルを検索する{{{1
set tags+=tags;

"---------------------------------------------------------------------------
" misc{{{1
set noerrorbells                   " 煩いのでベルは最小限
"set   tags=tags\ C:\\Progra~1\\Micros~1\\VC98\\Include\\tags " tag ファイルを複数使う時
                                   " には "\ " としてスペースで区切る
"set   grepprg=grep\ -nH            " grepに使用するプログラムを変更する
"command! CD cd %:p:h               " CDでカレントバッファのディレクトリに移動
if has('win32')
  set   runtimepath+=$VIM/chalice
  set   runtimepath+=$VIM/chalice/after
else
  set   runtimepath+=$HOME/.vim/chalice
  set   runtimepath+=$HOME/.vim/chalice/after
endif
set keymap&			   " keymapをdefaultに設定
set history=3000		    " コマンド行の履歴を1000行残す
"set sidescroll=10    " 表示していない領域にカーソルを動かそうとすると自動的にスクロールするようにする
"runtime plugin/chalice.vim
"let   MRU_num=19                   " 最近使ったファイルに残す数
"let   $MRU=$HOME . '/_vimrecent'   " 最近使ったファイルの情報を＄HOME/_vimrecentに残す
"let   autodate_format = '%Y/%m/%d'
				   " 最終更新日を自動的に入れるスクリプトのフォーマット定義
set sessionoptions-=options
"set grepprg=jvgrep
" VimでESCの反応を素早くする，再び ~timeoutlenとttimeoutlen~ | 日々の記録
" http://gajumaru.ddo.jp/wordpress/?p=1101
set timeout timeoutlen=1000 ttimeoutlen=75
"---------------------------------------------------------------------------
" map設定{{{1
" mapはすぐ後ろにコメントを書かないこと！
" 行の移動を表示されている行で移動する(１行に書くとおかしくなるので、コメントを下に移動）
nnoremap j gj
onoremap j gj
xnoremap j gj
nnoremap gj j
onoremap gj j
xnoremap gj j
" 行の移動を表示されている行で移動する(１行に書くとおかしくなるので、コメントを下に移動）
nnoremap k gk
onoremap k gk
xnoremap k gk
nnoremap gk k
onoremap gk k
xnoremap gk k
" 全選択コピー(ノーマルモード時のみ、VisualMode時はアスキーコード表示)
nnoremap ga :%y<CR>
" Yはカーソルより後ろの行をコピーするようにする
nnoremap Y y$

" Ctrl+Tabでウィンドウの切り替えを行う、Ctrl+Shift+Tabで逆の切り替え(serverlist.vimを使用)
"nnoremap <silent> <C-Tab> :call CycleNextWindow()<CR>
"nnoremap <silent> <C-S-Tab> :call CyclePrevWindow()<CR>
"vnoremap <silent> <C-Tab> :call CycleNextWindow()<CR>
"vnoremap <silent> <C-S-Tab> :call CyclePrevWindow()<CR>
"inoremap <silent> <C-Tab> <C-O>:call CycleNextWindow()<CR>
"inoremap <silent> <C-S-Tab> <C-O>:call CyclePrevWindow()<CR>
" Tabでバッファの切り替えを行う
" Ctrl+Tabでバッファの切り替えを行う
"nnoremap <silent> <C-Tab> :bn<CR>
"nnoremap <silent> <C-S-Tab> :bp<CR>
"vnoremap <silent> <C-Tab> :bn<CR>
"vnoremap <silent> <C-S-Tab> :bp<CR>

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

" コマンドモード時にカーソル移動するのに便利
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-f> <Right>
cmap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" like visual studio
nmap <F4> :<C-u>copen<CR>\|:cnext<CR>
nmap <S-F4> :<C-u>copen<CR>\|:cprev<CR>
" 日付の挿入
imap <F2> <C-r>=Strftime2("%Y-%m-%d")<CR>
" <C-u>をアンドゥできるようにする。insert.jax参照
inoremap <C-u> <C-G>u<C-u>
inoremap <C-w> <C-G>u<C-w>
" 最後に編集したところを選択する
nnoremap gc `[v`]
" Specify the last changed text as {motion}.
onoremap gc :<C-u>normal gc<CR>
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
"挿入モード時にCtrl-A,Eでに移動
imap <c-a> <HOME>
imap <c-e> <END>
imap <c-@> <c-[>

" visualモードで選択して*後に:%s//{置換文字列}/gで選択した文字列を置換できる
vnoremap * "zy:let @/ = @z<CR>

"{}で同じインデントの行に移動する{{{1
nnoremap { :call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^
nnoremap } :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^

" 挿入モードでも<A-Space>でシステムメニューを表示
imap <A-Space> <ESC>:simalt ~<CR>gi
" 現在のバッファの検索結果をvimgrep+quickfixで一覧表示
nmap <unique> <F3> :exec ':vimgrep /' . getreg('/') . '/j %\|cwin'<CR>

"Spaceで行移動{{{1
"nnoremap <silent> <Space> <C-D>
"nnoremap <silent> <S-Space> <C-U>

" grep.vim用設定 {{{1
if has('win32')
  let Grep_Path = 'D:\gnuwin32\bin\grep.exe'
  let FGrep_Path = 'D:\gnuwin32\bin\grep.exe -F'
  let EGrep_Path = 'D:\gnuwin32\bin\grep.exe -E'
  let Grep_Find_Path = 'D:\gnuwin32\bin\find.exe'
  let Grep_Xargs_Path = 'D:\gnuwin32\bin\xargs.exe'
  let Grep_Shell_Quote_Char = '"'
endif

" chalice用設定(オートプレビュー機能を使用しない) {{{1
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

" AutoCmd memo file {{{1
au BufNewFile,BufRead *.memo			setf memo
au BufNewFile,BufRead *.vb			setf vbnet

" ステータスライン用 {{{1
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
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}  " Gitのブランチ名を表示
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


"CTRL-Aで8進数の計算をさせない {{{1
set nrformats-=octal

" Tabラベルの設定 {{{1
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

" tabページの移動 {{{1
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
" 	nnoremap gl :macaction selectNextWindow:<CR>
" 	nnoremap gh :macaction selectPreviousWindow:<CR>
endif
" nnoremap <silent> <C-N> :<C-u>tabnext <CR>
" nnoremap <silent> <C-P> :<C-u>tabprevious <CR>
"タブ移動リマップ
"nnoremap t gt
"nnoremap T gT
nnoremap <Left> gT
nnoremap <Right> gt
nnoremap gh gT
nnoremap gl gt
nnoremap H gT
nnoremap L gt



"ChangeLog設定{{{1
"let g:changelog_username = ''
""mapを有効にする
"runtime ftplugin/changelog.vim

"migemo辞書{{{1
if has('win32') || has('win64')
  set migemodict=$HOME/tool/migemodict/org/dict/utf-8/migemo-dict
else
endif

"viewを保存しておく,diffモード時と無名バッファは保存しない,helpとhowmのファイルも保存しない{{{1
"autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
"autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
"function! ChkMkView()
"	if &diff == 0 && empty(expand("%")) == 0 && match(expand("%:e"), "jax") == -1 && match(expand("%:p"), "howm\/.*\.howm") == -1
"		mkview
"	endif
"endfunction
"if has('win32')
"  set viewdir=$HOME/vimfiles/view
"else
"  set viewdir=$HOME/.vim/view
"endif
"
"au BufWinLeave *.* call ChkMkView()
"au BufWinEnter *.* silent loadview

" view保存処理{{{1
" https://gist.github.com/3666285 by thinca
if has('win32') || has('win64')
  set viewdir=$HOME/vimfiles/view
else
  set viewdir=$HOME/.vim/view
endif
augroup vimrc-view
  autocmd!
  autocmd BufLeave * if expand('%') !=# '' && &buftype ==# ''
  \ | mkview
  \ | endif
  autocmd BufReadPost * if !exists('b:view_loaded') &&
  \ expand('%') !=# '' && &buftype ==# ''
  \ | silent! loadview
  \ | let b:view_loaded = 1
  \ | endif
  autocmd VimLeave * call map(split(glob(&viewdir . '/*'), "\n"),
  \ 'delete(v:val)')
augroup END


"grep後に自動でQuickfixを開く{{{1
"au QuickfixCmdPost make,grep,grepadd,vimgrep copen
"au QuickfixCmdPost l* lopen

"diffの設定{{{1
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
		silent normal! ]c
	else
		silent normal! J
	endif
endfunction
function! Prevdiff()
	if &diff
		silent normal! [c
	else
		"silent execute ":<C-u>call ref#K('normal')"
		silent execute ":call ref#K('normal')"
	endif
endfunction

"refe.vimの設定{{{1
"augroup BufferAu
"    autocmd! BufferAu
"    "初期化
"    au BufEnter * nnoremap K K
"    ".rbファイルでKでRefe検索
"    au BufEnter *.rb nnoremap <silent> K :Refe <cword><CR>
"augroup END

"Rubyの設定{{{1
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

" 「:OccurMigemo ame」で「雨」とか「飴」とか「AME」とか探せる。{{{1
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

" 検索時に結果が中央に来るようにする{{{1
"nmap n nzz
"nmap N Nzz
"nmap * *zz
"nmap # #zz
"nmap g* g*zz
"nmap g# g#zz
"nmap g/ g/zz

" nmap sj <C-W>j<C-w>_
" nmap sk <C-W>k<C-w>_
" nmap sh <C-w>h<C-w>_
" nmap sl <C-w>l<C-w>_
nmap sj <C-W>j
nmap sk <C-W>k
nmap sh <C-w>h
nmap sl <C-w>l
" 標準のsをssに割り当て
nnoremap <silent> ss s

"term color {{{1
if $TERM =~ "xterm-256color"
"   colorscheme desert256
"colorscheme desert256
  " omini..
"  highlight Pmenu ctermbg=8
"  highlight PmenuSel ctermbg=12
"  highlight PmenuSbar ctermbg=0
endif

"highlight ZenkakuSpace ctermbg=6
"match ZenkakuSpace /\s\+$\|　/
""Markに色をつける
"syntax match Mark /\%'a.../ containedin=ALL
"highlight def link Mark Todo

"smartchrの設定{{{1
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

" foldingをh,lで閉じたり開いたりするマッピング {{{1
" 行頭で h を押すと折畳を閉じる。
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
" 折畳上で l を押すと折畳を開く。
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" 行頭で h を押すと選択範囲に含まれる折畳を閉じる。
xnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'
" 折畳上で l を押すと選択範囲に含まれる折畳を開く。
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

" smartword ON-OFF {{{1
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
nmap w <Plug>(smartword-w)
nmap b <Plug>(smartword-b)
nmap e <Plug>(smartword-e)
nmap ge <Plug>(smartword-ge)
vmap w <Plug>(smartword-w)
vmap b <Plug>(smartword-b)
vmap e <Plug>(smartword-e)
vmap ge <Plug>(smartword-ge)
omap <Leader>w <Plug>(smartword-w)
omap <Leader>b <Plug>(smartword-b)
omap <Leader>e <Plug>(smartword-e)
omap <Leader>ge <Plug>(smartword-ge)


" unite.vim {{{1
"入力モード開始する
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 1000
"let g:unite_source_file_mru_ignore_pattern=''
"let g:unite_source_file_rec_ignore_pattern='\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|assets'



"let g:mapleader = "\\"
let mapleader = "0"
"バッファ一覧
nnoremap <silent> <Leader>b :<C-u>Unite bookmark<CR>
nnoremap <silent> <Leader>B :<C-u>Unite buffer tab<CR>
"ファイル一覧
nnoremap <silent> <Leader>f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
" レジスタ一覧
"nnoremap <silent> <Leader>r :<C-u>Unite -buffer-name=register register<CR>
" grep一覧
" nnoremap <silent> <Leader>g :<C-u>Unite -buffer-name=grep -auto-preview -no-quit grep<CR>
nnoremap <silent> <Leader>g :<C-u>Unite -buffer-name=grep -no-quit grep<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>h :<C-u>Unite -buffer-name=files file_mru<CR>
" 常用セット
nnoremap <silent> <Leader>u :<C-u>Unite -buffer-name=files buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <Leader>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file file/new<CR>
" outline
nnoremap <silent> <Leader>o :<C-u>Unite -buffer-name=outline outline -no-start-insert -auto-preview<CR>
nnoremap <silent> <F2> :<C-u>Unite -buffer-name=outline outline -no-start-insert -auto-preview<CR>
if has('win32') || has('win64')
	nnoremap <silent> <Leader>e :<C-u>Unite -buffer-name=files everything<CR>
else
	nnoremap <silent> <Leader>e :<C-u>Unite -buffer-name=files locate<CR>
endif
" tab
nnoremap <silent> <Leader>t :<C-u>Unite -buffer-name=tab tab<CR>
" history/command
nnoremap <silent> <Leader>: :<C-u>Unite -buffer-name=history/command history/command<CR>
"nnoremap <silent> q: :<C-u>Unite -no-start-insert -buffer-name=history/command history/command<CR>
" history/search
nnoremap <silent> <Leader>/ :<C-u>Unite -buffer-name=history/search history/search<CR>
"nnoremap <silent> q/ :<C-u>Unite -buffer-name=history/search history/search<CR>
" history/yank
let g:unite_source_history_yank_enable = 1
nnoremap <silent> <Leader>y :<C-u>Unite -buffer-name=history/yank history/yank<CR>
" unite-help
" nnoremap <silent> <C-h> :<C-u>Unite -buffer-name=help -start-insert help<CR>
" unite-alignta
let g:unite_source_alignta_preset_arguments = [
      \ ["Align at '='", '=>\='],
      \ ["Align at ':'", '01 :'],
      \ ["Align at '|'", '|' ],
      \ ["Align at ')'", '0 )' ],
      \ ["Align at ']'", '0 ]' ],
      \ ["Align at '}'", '}' ],
      \]
nnoremap <silent> <Leader>A :<C-u>Unite -buffer-name=alignta -start-insert alignta:options<CR>
xnoremap <silent> <Leader>A :<C-u>Unite -buffer-name=alignta -start-insert alignta:arguments<CR>
xnoremap <silent> A :<C-u>Unite -buffer-name=alignta -start-insert alignta:arguments<CR>
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
nnoremap <silent> gn :<C-u>Unite -buffer-name=bookmark -default-action=tabopen -input=:: -immediately -start-insert bookmark:bookmark<CR>
nnoremap <silent> gN :<C-u>Unite -buffer-name=bookmark -input=:: -immediately -start-insert bookmark:bookmark<CR>
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
"if has('mac')
"	let g:unite_kind_file_delete_file_command="trash $srcs"
"	let g:unite_kind_file_delete_directory_command="trash $srcs"
"endif

"let g:unite_source_file_rec_ignore_pattern='\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|assets'
" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
 " c-wでパス単位で削除するように変更
 imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
 imap <buffer> jj <Plug>(unite_insert_leave)
 "" c-aでカーソルを先頭に移動して絞り込みテキスト入力を開始する
 "imap <buffer> <C-a> <Plug>(unite_insert_head)
 " c-eでカーソルを行末に移動して絞り込みテキスト入力を開始する
 nmap <buffer> <C-e> <Plug>(unite_append_end)
 "" c-uでカーソルから行の先頭までの文字を全て削除する
 "imap <buffer> <C-u> <Plug>(unite_delete_backward_line)
 " ESCキーを2回押すと終了する
 nmap <silent><buffer> <ESC><ESC> :<C-u>q<CR>
 imap <silent><buffer> <ESC><ESC> <ESC>:<C-u>q<CR>
 " c-h,hで上のディレクトリに
 nmap <buffer> <C-h> <Plug>(unite_delete_backward_path)
 nmap <buffer> h <Plug>(unite_delete_backward_path)
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
	nnoremap <buffer><expr> o unite#do_action('vimfiler')
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
" unite-grep設定
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup -S'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 200

if executable('jvgrep')
	" For jvgrep.
	let g:unite_source_grep_command = 'jvgrep'
	let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
	let g:unite_source_grep_recursive_opt = '-R'
endif
" unite-grepの便利キーマップ
vnoremap /g y:Unite grep::-iRn:<C-R>=escape(@", '\\.*$^[]')<CR><CR>
" 特殊なmappingの設定{{{1
augroup my_ex_mappings
	
	autocmd! my_ex_mappings
	"autocmd FileType * nnoremap <buffer><silent> q: :<C-u>Unite -no-start-insert -buffer-name=history/command history/command<CR>
	"autocmd FileType * nnoremap <buffer><silent> q: :<C-u>Unite -buffer-name=history/command history/command<CR>
	"autocmd FileType unite,vimfiler,vimshell,ref-phpmanual nunmap <buffer> q:
	autocmd FileType vimshell nnoremap <buffer><silent> <C-N> :<C-u>tabnext <CR>
	autocmd FileType vimshell nnoremap <buffer><silent> <C-P> :<C-u>tabprevious <CR>
	autocmd FileType vimshell nmap <buffer><silent> J <Plug>(vimshell_next_prompt)
	autocmd FileType vimshell nmap <buffer><silent> K <Plug>(vimshell_previous_prompt)
	" quickfix用設定(qの記録はそこまで使わないため、Qに設定)
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
augroup END


" vim-surround"{{{1
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
" tab設定{{{1
set softtabstop=2
set tabstop=2
set shiftwidth=2

" encoding設定{{{1
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932

" diff設定{{{1
"set diffopt-=filler
"set diffopt+=vertical
"半角スペースの数が比較している行で違っていてもそれを無視してdiff実行
set diffopt+=iwhite

"セパレートウィンドウを切り替えをリマップ
"nnoremap <C-w> <C-w><C-w>

" vimshell.vim {{{1
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
nnoremap <silent> <Leader>fe :<C-u>VimFilerExplorer -winwidth=25 -split<CR>
nnoremap <silent> <Leader>ff :<C-u>VimFiler<CR>
nnoremap <silent> <Leader>f :<C-u>VimFiler<CR>
"vimfilerdoubleの起動
nnoremap <silent> <Leader>d :<C-u>VimFilerDouble<CR>
unlet mapleader

" vimfiler.vim {{{1
" デフォルトのエクスプローラーをvimfilerにする
let g:vimfiler_as_default_explorer = 1
" 起動時からsafeモード解除
let g:vimfiler_safe_mode_by_default = 0
" アイコン変更
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_enable_auto_cd = 1
" quick lookの設定
if has('mac')
	" mac
	let g:vimfiler_quick_look_command = 'qlmanage -p '
elseif has('win')
	" windows
	" let g:vimfiler_quick_look_command = 'seer.exe'
end
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
	nmap <buffer><silent> <C-g> :<C-u>let @*=vimfiler#get_filename(line('.'))<CR>:<C-u>echo vimfiler#get_filename(line('.'))<CR>
	if has('mac')
		nmap <buffer><silent> <S-v> <Plug>(vimfiler_quick_look)
	end
endfunction

" open-browser.vim {{{1
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" vim-markdown {{{1
"let g:previm_open_cmd = 'open -a Firefox'
"fun! MyAddToFileType(ft)
"  if index(split(&ft, '\.'), a:ft) == -1
"    let &ft .= '.'.a:ft
"  endif
"endfun
"au FileType markdown call MyAddToFileType('mkd')
"au FileType mkd      call MyAddToFileType('markdown')

" カレントウィンドウにのみ罫線を引く{{{1
augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END

" ターミナル上のみのつもりgui版以外のがいいかも？{{{1
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


" for Fugitive.vim {{{1
let mapleader = "\\"
nnoremap <Leader>gd :<C-u>Gdiff<Enter>
nnoremap <Leader>gs :<C-u>Gstatus<Enter>
nnoremap <Leader>gl :<C-u>Glog<Enter>
nnoremap <Leader>ga :<C-u>Gwrite<Enter>
nnoremap <Leader>gc :<C-u>Gcommit -v<Enter>
nnoremap <Leader>gC :<C-u>Git commit --amend<Enter>
nnoremap <Leader>gb :<C-u>Gblame<Enter>
unlet mapleader

" fugitive上の独自キーマッピング
autocmd FileType gitcommit call s:gitcommit_my_settings()
function! s:gitcommit_my_settings()
  " gitcommit上で?を押したときにhelpを表示
  nmap <buffer><silent> ? :<C-u>Unite -no-start-insert -buffer-name=fugitive/mapping fugitive/mapping<CR>
endfunction

" c-gを2c-gに{{{1
nnoremap <C-g> <Esc>2<C-g>
" aをa!に{{{1
"cnoremap a<CR> a!<CR>

" foldmethod=markerに{{{1
set foldmethod=marker
" marker設定
set commentstring=\ %s
set foldmarker={{{,}}}
" :mes で出てくるメッセージは適当にクリップボードにコピーする。 in Vim - Humanity{{{1
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
 
" F12でset nonuをtoggleする{{{1
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

" dt(とかをd(とかでできる{{{1
onoremap ( t(
onoremap ) t)
onoremap [ t[
onoremap ] t]

" ZoomWin設定{{{1
nmap <unique> <c-w>o  <Plug>ZoomWin
nmap <unique> <c-w><c-o>  <Plug>ZoomWin

" submode.vim{{{1
" たとえば、ウィンドウのサイズ変更（<C-w>+とか）を
" 繰り返し入力するのは大変！
" call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
" call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
" call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
" call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
" call submode#map('winsize', 'n', '', '>', '<C-w>>')
" call submode#map('winsize', 'n', '', '<', '<C-w><')
" call submode#map('winsize', 'n', '', '+', '<C-w>+')
" call submode#map('winsize', 'n', '', '-', '<C-w>-')
" textmanip{{{1
" call submode#enter_with('textmanip', 'v', 'r', '<C-t>h', '<Plug>(textmanip-move-left)')
" call submode#enter_with('textmanip', 'v', 'r', '<C-t>j', '<Plug>(textmanip-move-down)')
" call submode#enter_with('textmanip', 'v', 'r', '<C-t>k', '<Plug>(textmanip-move-up)')
" call submode#enter_with('textmanip', 'v', 'r', '<C-t>l', '<Plug>(textmanip-move-right)')
" call submode#map('textmanip', 'v', 'r', 'h', '<Plug>(textmanip-move-left)')
" call submode#map('textmanip', 'v', 'r', 'j', '<Plug>(textmanip-move-down)')
" call submode#map('textmanip', 'v', 'r', 'k', '<Plug>(textmanip-move-up)')
" call submode#map('textmanip', 'v', 'r', 'l', '<Plug>(textmanip-move-right)')

" Ex modeの履歴を遡るのもちょっと楽できる{{{1
" yokohama.vim#2 by tsukkee
cnoremap <C-p> <Up>
cnoremap <Up> <C-p>
cnoremap <C-n> <Down>
cnoremap <Down> <C-n>

" vimtodo.vim{{{1
set runtimepath+=$HOME/.vim/bundle/vimtodo
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
"   unmap <Space>
  nmap <buffer> <space> <Plug>TodoCheckboxToggle
  nmap <buffer> 9b <Plug>TodoInsertCheckbox
  nmap <buffer> 9n oTODO ds<Space>+<Space>{{{1<Esc>T+i
  " iabbrev <buffer> cc [ ]<Space>{{{2<Esc>T]i
  iabbrev <buffer> cc [ ]
	" vimtodoのを上書き
exe 'iab <buffer> cn '.vimtodo#TodoParseTaskState(g:todo_states[0][0])["state"].
            \' <C-R>=strftime("%Y-%m-%d")<CR>'.'<Space>+ {{{1<Esc>T+i'
  nnoremap <buffer><silent> 99 9
	nmap <buffer><silent> J /\<TODO[^:]<CR>
	nmap <buffer><silent> K ?\<TODO[^:]<CR>
endfunction

" 現在のファイルとカレントディレクトリにある同名のファイルをdiffする {{{1
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

" 環境依存設定{{{1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
if has('mac') && filereadable(expand('~/.vimrc.mac'))
	source ~/.vimrc.mac
endif
if (has('win32') || has('win64')) && filereadable(expand('~/.vimrc.win'))
	source ~/.vimrc.win
endif

" vim-altercmd *動かないかも {{{1
"call altercmd#load()
"command!
"\ -bar -nargs=+
"\ MapAlterCommand
"\ CAlterCommand <args> | AlterCommand <cmdwin> <args>
"
"" restart.vim {{{1
"command!
"\ -bar
"\ RestartWithSession
"\ let g:restart_sessionoptions = 'blank,curdir,folds,help,localoptions,tabpages'
"\ | Restart
"
"MapAlterCommand res[tart] Restart
"MapAlterCommand ers[tart] Restart
"MapAlterCommand rse[tart] Restart

" gfで開けるファイルを増やす {{{1
autocmd FileType html,php setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

" autoescダメだった {{{1
"let g:autoesc_pos = [0, 0, 0, 0]
"let g:autoesc_nomovecount = 0
"autocmd CursorHoldI <buffer> call s:autoesc()
""autocmd CursorHoldI call s:autoesc()
"function! s:autoesc()
"  let current_pos = getpos('.')
"  if current_pos[0] == g:autoesc_pos[0]
"				\ && current_pos[1] == g:autoesc_pos[1]
"				\ && current_pos[2] == g:autoesc_pos[2]
"				\ && current_pos[3] == g:autoesc_pos[3]
"    let g:autoesc_nomovecount = g:autoesc_nomovecount + 1
"  else
"    let g:autoesc_nomovecount = 0
"  endif
"  if g:autoesc_nomovecount > 5
"    call feedkeys("\<Esc>")
"	else
"		" CursorHoldIは連続発生用
"		call feedkeys("\<Esc>i")
"  endif
"  let g:autoesc_pos = current_pos
"endfunction

" 閉じタグの補完{{{1
augroup MyCloseTag
  autocmd!
"   autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
"   autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype php inoremap <buffer> __ __('')<Left><Left>
"   autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
" カーソルキーで行末／行頭の移動可能に設定{{{1
"set whichwrap=b,s,[,],<,>
"nnoremap h <Left>
"nnoremap l <Right>

" 縦に連番を入力する{{{1
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

" phpmapping {{{1
"augroup PhpMapping
"    au!
"    autocmd FileType php inoremap <buffer> , ,<Space>
"    autocmd FileType php inoremap <buffer><expr><CR> "\<ESC>" . setline('.', substitute(getline('.'), "\\s+$", "", "")) . "\<CR>"
"    "autocmd FileType php inoremap <buffer><expr><CR> setline('.', substitute(getline('.'), "\\s+$", "", ""))\<CR>
"augroup END
"
"function! AfterEnter()
"  let line = getline('.')
"  let line = substitute(line, "\\s+$", "", "")
"  call setline('.', line)
"endfunction

" 'cursorline' を必要な時にだけ有効にする - 永遠に未完成 {{{1
" http://d.hatena.ne.jp/thinca/20090530/1243615055
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

" caw.vim {{{1
nmap "" <Plug>(caw:I:toggle)
vmap "" <Plug>(caw:I:toggle)
nmap // <Plug>(caw:I:toggle)
vmap // <Plug>(caw:I:toggle)

" vimundo {{{1
" http://vim-users.jp/2010/07/hack162/
if has('persistent_undo')
  set undodir=~/.vimundo
  augroup vimrc-undofile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

" thinca/poslist.vim {{{1
" let g:poslist_histsize = 1000
" let g:poslist_lines = 500
" nmap <C-o> <Plug>(poslist-prev-line)
" nmap <C-i> <Plug>(poslist-next-line)
"nnoremap <C-Tab> <Plug>(poslist-prev-buf)
"nnoremap <C-S-Tab> <Plug>(poslist-next-buf)

" last two digit move {{{1
" ujihisa/config/_vimrc
" not it's not only two-digit
command! -count=1 -nargs=0 GoToTheLine silent execute getpos('.')[1][:-len(v:count)-1] . v:count
nnoremap <silent> gl :GoToTheLine<Cr>

" Jump to the last editing position.{{{1
" https://gist.github.com/3666285 by thinca
autocmd BufReadPost
\ * if line("'\"") && line("'\"") <= line('$')
\ | execute 'normal! g`"'
\ | endif

" Open junk file."{{{1
let mapleader = "0"
"バッファ一覧
nnoremap <silent> <Leader>9 :<C-u>JunkFile<CR>
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file()
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'tabnew ' . l:filename
  endif
endfunction
unlet mapleader

" sonictemplate-vim{{{1
let g:sonictemplate_vim_template_dir = '$HOME/.vim/template'

" columnjump{{{1
"map <c-k> <Plug>(columnjump-backward)
"map <c-j> <Plug>(columnjump-forward)

" tabのディレクトリ管理をタブ単位で行う{{{1
" http://labs.timedia.co.jp/2012/05/vim-tabpagecd.html
augroup plugin-tabpagecd
  autocmd!

  autocmd TabEnter *
  \   if exists('t:cwd')
  \ |   cd `=fnameescape(t:cwd)`
  \ | endif

  autocmd TabLeave *
  \   let t:cwd = getcwd()
augroup END

" quickrun設定{{{1
" let g:quickrun_config = {}
" 
" if strlen($rvm_bin_path)
" 	let g:quickrun_config['ruby'] = {
" \		'command': 'ruby',
" \		'exec': '$rvm_bin_path/ruby %s',
" \		'tempfile': '{tempname()}.rb'
" \	}
" endif
" yankround.vim設定{{{1
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" matchit有効化{{{1
if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif
" ctrlp with ag {{{1
" ag入ってたらagで検索させる
" ついでにキャッシュファイルからの検索もさせない
if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
endif

" memolist {{{1
"" tags prompt (default 0)
"let g:memolist_prompt_tags = 1
"" categories prompt (default 0)
"let g:memolist_prompt_categories = 1
"" use qfixgrep (default 0)
"let g:memolist_qfixgrep = 1
"
"" use vimfler (default 0)
"let g:memolist_vimfiler = 1
"
"" remove filename prefix (default 0)
"let g:memolist_filename_prefix_none = 1

" use unite (default 0)
let g:memolist_unite = 1

" use arbitrary unite source (default is 'file')
"let g:memolist_unite_source = "file_rec"

" use arbitrary unite option (default is empty)
let g:memolist_unite_option = "-auto-preview -start-insert"

"" use denite (default 0)
"let g:memolist_denite = 1
"
"" use arbitrary denite source (default is 'file_rec')
"let g:memolist_denite_source = "anything"
"
"" use arbitrary denite option (default is empty)
"let g:memolist_denite_option = "anything"
"
"" use various Ex commands (default '')
"let g:memolist_ex_cmd = 'CtrlP'
"let g:memolist_ex_cmd = 'NERDTree'

"" use delimiter of array in yaml front matter (default is ' ')
"let g:memolist_delimiter_yaml_array = ','
"
"" use when get items from yaml front matter
"  " first line string pattern of yaml front matter (default "==========")
"  let g:memolist_delimiter_yaml_array = "---"
"
"  " last line string pattern of yaml front matter (default "- - -")
"  let g:memolist_delimiter_yaml_array = "-

cab mm MemoNew
cab ml MemoList
cab mg MemoGrep

autocmd Filetype mkd.markdown setlocal foldlevel=2
"autocmd Filetype preview setlocal foldlevel=2
"autocmd Filetype preview setlocal foldopen=all
"setlocal foldlevel=2


