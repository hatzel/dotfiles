call plug#begin()
" utility
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
" Disable for now, seems to cause issues with rust
" Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'eugen0329/vim-esearch'
Plug 'kergoth/vim-bitbake'
Plug 'qpkorr/vim-bufkill'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'zxqfl/tabnine-vim'
Plug 'ciaranm/detectindent'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ }
call plug#end()
" Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --system-libclang --system-boost --clang-completer' }


Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'easymotion/vim-easymotion'

" git
Plug 'tpope/vim-fugitive'
" allow opening lines on github etc.
Plug 'tpope/vim-rhubarb'

" visuals
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'luochen1990/rainbow'

" language specific
Plug 'dart-lang/dart-vim-plugin'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'mxw/vim-jsx'
Plug 'mitsuhiko/vim-python-combined'
Plug 'lervag/vimtex'
Plug 'tikhomirov/vim-glsl'
Plug 'keith/swift.vim'
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ElmCast/elm-vim'
Plug 'cespare/vim-toml'
Plug 'zchee/deoplete-jedi' " Python Completion
Plug 'ambv/black'          " Python Formatter
Plug 'udalov/kotlin-vim'
Plug 'peterhoeg/vim-qml'

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
let g:gruvbox_untercurl= 1
let g:gruvbox_italic=1
let g:gruvbox_termcolors=1

let hostname = substitute(system("hostname"), "\n", "", "")
let light_hostnames = ["falcon"]

set termguicolors
colorscheme gruvbox

if index(light_hostnames, hostname) == -1
    set bg=dark
else
    set bg=light
endif

" Show tabs
set list
set listchars=tab:\|·

" =============== Plugin Configurations ===============
" bind fzf to ctrl+p
noremap <silent> <C-P> :FZF<CR>
nnoremap <silent> <C-P> :FZF<CR>
vnoremap <silent> <C-P> :FZF<CR>
inoremap <silent> <C-P> :FZF<CR>

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
    \ 'rust': ['rls'],
    \ 'go': ['go-langserver'],
    \ 'python': ['pyls'],
    \ 'c': ['clangd'],
\ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:ale_completion_enabled = 1

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
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

let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'cpp': ['clang-check']
\}

" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
" tagbar
" nmap <F8> :TagbarToggle<CR>

" vim sneak on f
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" taste the rainbow (rainbow colored parantheses)
let g:rainbow_active = 1

" vim-test bindings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:go_fmt_autosave = 1

" Python auto formater
let g:black_linelength = 100

" Work inside venv
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

" Disable you complete me
let g:loaded_youcompleteme = 1

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
command! Trim call TrimWhiteSpace()

function! SwitchToTabs()
    set noexpandtab
endfunction
command! Tabs call SwitchToTabs()

function! SwitchToSpaces()
    set expandtab
endfunction
command! Spaces call SwitchToSpaces()

" Reload on save:
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
