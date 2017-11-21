call plug#begin()
" utility
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'

" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

Plug 'easymotion/vim-easymotion'

" ctrlP and accessories
Plug 'kien/ctrlp.vim'
Plug 'DavidEGx/ctrlp-smarttabs'

" visuals
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'

" language specific
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'mitsuhiko/vim-python-combined'
Plug 'lervag/vimtex'
Plug 'tikhomirov/vim-glsl'
Plug 'keith/swift.vim'
Plug 'rust-lang/rust.vim'
Plug 'zchee/deoplete-jedi'
Plug 'leafgarland/typescript-vim'
Plug 'ElmCast/elm-vim'
Plug 'cespare/vim-toml'

" Needed for communication with latexmk
Plug 'mhinz/neovim-remote'

Plug 'mattn/emmet-vim'

Plug 'bronson/vim-visual-star-search'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


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
let g:ctrlp_cmd = 'CtrlPMixed'

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
let maplocalleader = "\\"
let g:user_emmet_leader_key='<C-E>'

" =============== Tabs & Spaces ===============
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab

" =============== Convenience Stuff ===============
" autoformat
noremap <Leader>f :Autoformat<CR>
" copy and paste:
vnoremap <C-c> "+y

set smartcase " use smartcase for search

" linenumbers
set number

" write with capital W
command! W  write

" tab navigation
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

" No cache for pass files
au BufNewFile,BufRead *.gpg setlocal noswapfile nobackup noundofile
au BufNewFile,BufRead /dev/shm/pass.* setlocal noswapfile nobackup noundofile

" clear highlighting with double escape
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" no concealing!
let g:tex_conceal = ""
set conceallevel=0

" ultisnips
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-x>"

" Language Client
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
\ }

" Automatically start language servers.
" let g:LanguageClient_autoStart = 1
let g:ale_completion_enabled = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Required for operations modifying multiple buffers like rename.
set hidden

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" find directories named venv
let g:ale_virtualenv_dir_names = get(g:, 'ale_virtualenv_dir_names', [
\   '.env',
\   'env',
\   've-py3',
\   've',
\   'virtualenv',
\   'venv',
\])

let g:ale_linters = {
\   'python': ['flake8'],
\   'rust': ['rls']
\}

" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
" tagbar
nmap <F8> :TagbarToggle<CR>

" Don't conceal json
let g:vim_json_syntax_conceal = 0
" Don't conceal markdown
let g:vim_markdown_conceal = 0

