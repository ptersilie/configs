" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'             " gruvbox colorscheme
Plug 'tpope/vim-fugitive'          " Git extras (e.g. branches)
Plug 'bling/vim-airline'           " Airline
Plug 'bling/vim-bufferline'        " Show the list of buffers in the command bar
Plug 'mhinz/vim-signify'           " Show diff +/- signs on LHS of screen
call plug#end()

" General settings
set number                         " Show line numbers
set cursorline                     " Highlight current line
set nowrap                         " Don't wrap lines
set hidden                         " Hide buffers
set mouse+=a                       " Enable mouse

colorscheme gruvbox
set background=dark

" Share Unix clipboard
set clipboard=unnamedplus

" Airline settings
set laststatus=2
let g:airline_theme             = 'gruvbox'
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#syntastic#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.linenr = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 0

" Bufferline
let g:bufferline_echo = 0
let g:bufferline_rotate = 2
let g:bufferline_fname_mod = ':.'
nmap <C-Left> :bp!<CR>
imap <C-Left> <C-o>:bp!<CR>
nmap <C-Right> :bn!<CR>
imap <C-Right> <C-o>:bn!<CR>
