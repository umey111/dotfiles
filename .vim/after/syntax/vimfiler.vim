if version < 700
  syntax clear
elseif exists("b:vimfiler_org_current_syntax")
  finish
endif

" if has('gui_running')
"     hi VimFilerCurrentDirectory  gui=UNDERLINE guifg=#80ffff guibg=NONE
" else
    hi! def link VimFilerCurrentDirectory Identifier
" endif

let b:vimfiler_org_current_syntax = "orgvimfiler"
