let output=system('xrandr | grep \*')
if output =~ "2560x1440"
  Guifont Fira Mono:h13
else
  Guifont Fira Mono:h11
endif

GuiLinespace 1
GuiTabline 0
