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
Plug 'w0rp/ale'                    " Asynchronous linting
Plug 'rust-lang/rust.vim'          " Needed for ALE
Plug 'ctrlpvim/ctrlp.vim'          " Fuzzy filename matcher
Plug 'svermeulen/vim-yoink'        " Rotatet amongst recent yanks
Plug 'nvie/vim-flake8'             " Python linter
call plug#end()

let g:ale_linters = {
    \ 'rust': [ 'rls' ],
    \ }
let g:ale_rust_rls_toolchain = 'stable'
autocmd FileType tex ALEDisable

au FileType rust nmap gd :ALEGoToDefinition<CR>

" General settings
set number                         " Show line numbers
set cursorline                     " Highlight current line
set nowrap                         " Don't wrap lines
set hidden                         " Hide buffers
set mouse+=a                       " Enable mouse
set ignorecase                     " Case insensitive search
set smartcase                      " Case sensitive when not lowercase
set autoread                       " Auto reload changed files
set expandtab                      " Use spaces
set tabstop=4                      " insert 4 spaces for tab
set softtabstop=4                  " show tab as 4 spaces
set shiftwidth=4                   " Indentation space

colorscheme gruvbox
set background=dark

" Share Unix clipboard
set clipboard=unnamedplus

" Key mappings
nmap <Tab> :wincmd w<CR>

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

" Ale settings
let g:ale_rust_cargo_check_all_targets = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Ctrl+P settings
let g:ctrlp_regexp = 0		" Disable regex search (toggle with Ctrl+R)
let g:ctrlp_show_hidden = 0	" Show hidden files

" Yoink settings
let g:yoinkMaxItems=50
let g:yoinkIncludeDeleteOperations=1
let g:yoinkMoveCursorToEndOfPaste=1
let g:yoinkSwapClampAtEnds=0
nmap <a-p> <plug>(YoinkPostPasteSwapBack)
nmap <a-P> <plug>(YoinkPostPasteSwapForward)
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
