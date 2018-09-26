let output=system('xrandr | grep \*')
if output =~ "2560x1440"
  Guifont Source Code Pro:h13
else
  Guifont Source Code Pro:h11
endif

GuiLinespace 1
GuiTabline 0
