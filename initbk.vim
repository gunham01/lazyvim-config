" Lua
lua require('minhlh.settinglua')

set mouse=a  "enable mouse

" au CursorHold,CursorHoldI * checktime
" au FocusGained,BufEnter * :checktime
" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
"     \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
"       \ | checktime 
"     \ | endif
" autocmd FileChangedShellPost *
"     \ echohl WarningMsg 
"     \ | echo "File changed on disk. Buffer reloaded."
"     \ | echohl None
"
" " Search a hightlighted text
" vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" nmap /\ :noh<CR>
"
"
" call plug#begin(stdpath('config').'/plugged')
"
" " Terminal
"   Plug 'voldikss/vim-floaterm'                  " Float terminal
"
" call plug#end()
"
"
" " Other setting
" for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
"   execute 'source' setting_file
" endfor
