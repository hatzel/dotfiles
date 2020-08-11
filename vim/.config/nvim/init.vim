call plug#begin()
" utility
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'Chiel92/vim-autoformat'
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
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
" Plug 'zxqfl/tabnine-vim'
Plug 'ciaranm/detectindent'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Plug 'neovim/nvim-lsp'

Plug 'tpope/vim-abolish'
Plug 'easymotion/vim-easymotion'

" git
Plug 'tpope/vim-fugitive'
" allow opening lines on github etc.
Plug 'tpope/vim-rhubarb'

" visuals
" Plug 'bling/vim-airline'
Plug 'rbong/vim-crystalline'
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
Plug 'udalov/kotlin-vim'
Plug 'peterhoeg/vim-qml'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'git@gitlab.net.jusst.de:tronje.krabbe/aldrin.vim.git'

" Needed for communication with latexmk
Plug 'mhinz/neovim-remote'

Plug 'mattn/emmet-vim'

Plug 'bronson/vim-visual-star-search'

call plug#end()

" lua require'nvim_lsp'.rust_analyzer.setup({})

" =============== Visuals ===============
" ACAB
set termguicolors

" Show substitue live
set inccommand=nosplit

" airline config
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1

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
" Open fzf but make sure to switch from a NERD_tree buffer first
" so we don't end up opening the file in the sidebar
function! FZFOpen(command_str)
    if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
        exe "normal! \<c-w>\<c-w>"
    endif
    exe 'normal! ' . a:command_str . "\<cr>"
endfunction

" bind fzf to ctrl+p
nnoremap <silent> <C-P> :call FZFOpen(":FZF")<CR>
vnoremap <silent> <C-P> :call FZFOpen(":FZF")<CR>
inoremap <expr> <C-P> <ESC>:call FZFOpen(":FZF")<CR>

nnoremap <silent> <C-B> :call FZFOpen(":Buffers")<CR>
vnoremap <silent> <C-B> :call FZFOpen(":Buffers")<CR>
inoremap <silent> <C-B> <ESC>:call FZFOpen(":Buffers")<CR>

nnoremap <silent> <C-G>s :call FZFOpen(":Rg")<CR>
vnoremap <silent> <C-G>s :call FZFOpen(":Rg")<CR>
inoremap <silent> <C-G>s <ESC>:call FZFOpen(":Rg")<CR>

nnoremap <silent> <C-G>l :call FZFOpen(":BLines")<CR>
vnoremap <silent> <C-G>l :call FZFOpen(":BLines")<CR>
inoremap <silent> <C-G>l <ESC>:call FZFOpen(":BLines")<CR>

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
" noremap <Leader>f :Autoformat<CR>
" copy and paste:
vnoremap <C-c> "+y

set ignorecase
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

" Required for operations modifying multiple buffers like rename.
set hidden

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
" let g:black_linelength = 100

" Work inside venv
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

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

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  " if a:current
  "   let l:s .= crystalline#right_sep('', 'Fill') . ' %{fugitive#head()}'
  " endif
  if a:current
      let l:s .= "%{coc#status()}"
  endif
  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}'
    let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
  else
    let l:s .= ' '
endif

  return l:s
endfunction

function! TabLine()
    let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
    return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'gruvbox'

set showtabline=2
set guioptions-=e
set laststatus=2

let g:grammarous#languagetool_cmd = 'languagetool'

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting code.
xmap <leader>f  <Plug>(coc-format)
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f1)

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

let g:coc_snippet_next = '<tab>'
imap <C-l> <Plug>(coc-snippets-expand)

let g:coc_global_extensions = [
\ "coc-rust-analyzer",
\ "coc-json",
\ "coc-python",
\ "coc-snippets",
\ "coc-vimtex",
\ "coc-markdownlint"
\ ]
