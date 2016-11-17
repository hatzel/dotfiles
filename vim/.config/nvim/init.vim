call plug#begin()
" utility
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
Plug 'andviro/flake8-vim'

" Needed for communication with latexmk
Plug 'mhinz/neovim-remote'

Plug 'mattn/emmet-vim'

Plug 'Valloric/YouCompleteMe'
Plug 'bronson/vim-visual-star-search'
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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll|aux|flx|out|pdf)$',
    \ }
" ctrlP opens tabs by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
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

" Leader
let mapleader = ","
" trigger emmet using ',,'
let g:user_emmet_leader_key=','

" ycm
noremap <leader>g :YcmCompleter GoTo <CR>
noremap <leader>d :YcmCompleter GoToDefinition <CR>
noremap <leader>c :YcmCompleter GoToDeclaration <CR>
noremap <leader>i :YcmCompleter GoToImprecise <CR>
noremap <leader>p :YcmCompleter GetParent <CR>
noremap <leader>t :YcmCompleter GetType <CR>

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
map <C-S-Tab> :tabprev<CR>
nmap <S-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>


au BufNewFile,BufRead *.gpg setlocal noswapfile nobackup noundofile
au BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile

" clear highlighting with double escape
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" no concealing!
let g:tex_conceal = ""
