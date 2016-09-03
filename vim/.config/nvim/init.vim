call plug#begin()
" utility
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'

" ctrlP and accessories
Plug 'kien/ctrlp.vim'
Plug 'DavidEGx/ctrlp-smarttabs'

" visuals
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'

" language specific
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'rust-lang/rust.vim'
Plug 'mitsuhiko/vim-python-combined'
Plug 'lervag/vimtex'
" Needed for communication with latexmk
Plug 'mhinz/neovim-remote'
call plug#end()

" =============== Visuals ===============
" ACAB
set termguicolors

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

" =============== Plugin Configurations ===============
" ctrlP config
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|aux|flx|out|pdf)$',
\ }

" vimtex
let g:vimtex_view_method='zathura'
let g:vimtex_prog_name='~/.config/nvim/plugged/neovim-remote/nvr'
" stop small files from being detected as plaintext
let g:tex_flavor = 'latex'

" spell checking
Plug 'mhinz/neovim-remote'
set spell spelllang=en_us
set spellfile=~/.config/nvim/en.utf-8.add

" =============== Tabs & Spaces ===============
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab

" =============== Convenience Stuff ===============
" copy and paste:
vnoremap <C-c> "+y

" write with capital W
command! W  write

" tab navigation
map <S-Tab> :tabnext<CR>
map <S-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabnext<CR>
