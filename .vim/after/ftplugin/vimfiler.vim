" パスコピーyp
"inoremap <buffer> <exp> ? <Esc><Plug>(vimfiler_help)
let mapleader = "0"
nnoremap <buffer><silent> <Leader>b :<C-u>Unite -immediately -default-action=cd buffer<CR>
"ファイル一覧
nnoremap <buffer><silent> <Leader>f :<C-u>UniteWithBufferDir -immediately -default-action=cd -buffer-name=files file<CR>
" grep一覧
nnoremap <buffer><silent> <Leader>g :<C-u>Unite -immediately -default-action=cd -buffer-name=grep -auto-preview -no-quit grep<CR>
" 最近使用したファイル一覧
nnoremap <buffer><silent> <Leader>h :<C-u>Unite -buffer-name=files -immediately -default-action=cd file_mru<CR>
" 常用セット
nnoremap <buffer><silent> <Leader>u :<C-u>Unite -buffer-name=files -immediately -default-action=cd buffer file_mru<CR>
" 全部乗せ
nnoremap <buffer><silent> <Leader>a :<C-u>UniteWithBufferDir -immediately -default-action=cd -buffer-name=files buffer file_mru bookmark file<CR>
" outline
nnoremap <buffer><silent> <Leader>o :<C-u>Unite -immediately -default-action=cd -buffer-name=outline outline -auto-preview<CR>
if has('win32') || has('win64')
	nnoremap <buffer><silent> <Leader>e :<C-u>Unite -immediately -default-action=cd -buffer-name=files everything<CR>
else
	nnoremap <buffer><silent> <Leader>e :<C-u>Unite -immediately -default-action=cd -buffer-name=files locate<CR>
endif
unlet mapleader

