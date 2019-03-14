let output=system('xrandr | grep \*')
if output =~ "2560x1440"
  Guifont Fira Mono:h13
else
  Guifont Fira Mono:h11
endif

" Adjust font sizes with Ctrl-↑ and Ctrl-↓
let s:fontsize = 13 " substitute(Guifont, '^\(.*\):\([0-9]+\)$', '\2', '')
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Fira Mono:h" . s:fontsize
endfunction

nnoremap <C-Up> :call AdjustFontSize(1)<CR>
nnoremap <C-Down> :call AdjustFontSize(-1)<CR>

GuiLinespace 1
GuiTabline 0
