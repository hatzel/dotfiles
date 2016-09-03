call plug#begin()
Plug 'mhinz/neovim-remote'
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
Plug 'bling/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'mitsuhiko/vim-python-combined'
Plug 'lervag/vimtex'
call plug#end()

" ACAB
set termguicolors

" ctrlP config
let g:ctrlp_working_path_mode = 'ra'

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" grovebox
let g:gruvbox_bold=1
let g:gruvbox_unterline=1
let g:gruvbox_untercurl=1
let g:gruvbox_italic=1
let g:gruvbox_termcolors=1
set background=dark
colorscheme gruvbox

" tabs and spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab

" vimtex
let g:vimtex_view_method='zathura'

" Copy and paste:
vnoremap <C-c> "+y
