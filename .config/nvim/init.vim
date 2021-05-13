" vim:fdm=marker

" Plugins -------------------------------------------------------------

" Load plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'            " A light and configurable statusline/tabline plugin for Vim
Plug 'preservim/nerdcommenter'          " Vim plugin for intensely nerdy commenting powers
Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent!
Plug 'editorconfig/editorconfig-vim'    " EditorConfig plugin for Vim
Plug 'vim-syntastic/syntastic'          " Syntax checking hacks for vim
Plug 'tpope/vim-surround'               " surround.vim: quoting/parenthesizing made simple
Plug 'rhysd/vim-clang-format'           " Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, TypeScript and ProtoBuf
Plug 'rust-lang/rust.vim'               " This is a Vim plugin that provides Rust support
Plug 'airblade/vim-rooter'              " Rooter changes the working directory to the project root when you open a file or directory
Plug 'cespare/vim-toml'                 " Vim syntax for TOML
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf is a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'                 " Things you can do with fzf and Vim
Plug 'simonsmith/material.vim'          " A dark color scheme for Vim/Neovim based on the Material color scheme
Plug 'folke/tokyonight.nvim'            " A clean, dark Neovim theme

call plug#end()

" Settings -------------------------------------------------------------

" Make vim more useful
set nocompatible

set background=dark

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has('termguicolors'))
  set termguicolors
endif

" Syntax highlighting
let g:tokyonight_style = 'night'
let g:tokyonight_italic_keywords = 0
let g:tokyonight_italic_comments = 0
colorscheme tokyonight
syntax on

" Mapleader
let g:mapleader=','

" Set some basic stuff
set autoread " Set to auto read when a file is changed from the outside
set cmdheight=2 " Give more space for displaying messages.
set cursorline " Highlight current line
set encoding=utf-8 nobomb " BOM often causes trouble
set expandtab " Expand tabs to spaces
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=100 " Increase history
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set nobackup " Some servers have issues with backup files
set noerrorbells " Disable error bells
set nofoldenable " Disable folding
set noshowmode " Don't show the current mode (lightline.vim takes care of us)
set nowrap " Do not wrap lines
set nowritebackup
set nu " Enable line numbers
set relativenumber " Relative line numbers
set scrolloff=8 " Start scrolling three lines before horizontal border of window
set shell=/bin/zsh " Use /bin/sh for executing shell commands
set shiftwidth=4 " The # of spaces for indenting
set shortmess+=c " Don't give ins-completion-menu messages
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set signcolumn=yes " Always show signcolumns
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=4 " Tab key results in 4 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set tabstop=4 " Tab width
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
set updatetime=100 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wrapscan " Searches wrap around end of file


" Configuration -------------------------------------------------------------

" FastEscape
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

" General
" Faster split resizing (+,-)
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
endif

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" Quickly close the current window (,Q) or current buffer (,q)
nnoremap <leader>Q :q<CR>
nnoremap <leader>q :bd<CR>

" Remap :W to :w
command! W w

" Fast saving
nmap <leader>w :w!<CR>

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" Clear last search (,qs)
map <silent> <leader>qs <Esc>:noh<CR>
map <silent> <leader>qs <Esc>:let @/ = ""<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos('.')
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
nnoremap <leader>ss :call StripWhitespace ()<CR>

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

" Toggle relative line numbers
nnoremap <leader>N :setlocal relativenumber!<CR>

" Move code in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Buffers
" Buffer navigation (,,) (,b) (gb) (gB)
map <leader>, <C-^>
map <silent> <leader>b :Buffers<CR>
map gb :bnext<CR>
map gB :bprev<CR>

" Jump to buffer number (<N>gb)
let c = 1
while c <= 99
  execute 'nnoremap ' . c . 'gb :' . c . 'b\<CR>'
  let c += 1
endwhile

" Restore Cursor Position
augroup restore_cursor
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Search files and file content (rg)
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" fzf default command is sourced in .zshrc, so that fzf uses rg for
" searching:
"		export FZF_DEFAULT_COMMAND='rg --files --hidden'

" fuzzy search for files (fzf + rg)
nnoremap <silent> <C-p> :Files<CR>

" fuzzy grep for file content (fzf + rg)
nnoremap <silent> <leader>rg :Rg<CR>

" Plugin Configuration -------------------------------------------------------------

" Lightline.vim
let g:lightline = {
\  'colorscheme': 'material',
\  'active': {
\    'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified', 'cocstatus', 'gitbranch']],
\  },
\  'component_function': {
\    'cocstatus': 'coc#status',
\    'gitbranch': 'FugitiveHead',
\  },
\}

" Syntastic.vim
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_cpp_compiler_options = '-std=c++20'

" vim-clang-format
augroup clang_format_config
  autocmd!
  let g:clang_format#detect_style_file = 1
  let g:clang_format#auto_format = 1
  " map to <leader>cf in C++ code
  autocmd FileType c,cpp,objc nnoremap <buffer><leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><leader>cf :ClangFormat<CR>
  " Toggle auto formatting:
  nmap <leader>C :ClangFormatAutoToggle<CR>
  " auto-enabling auto-formatting
  autocmd FileType c ClangFormatAutoEnable
augroup END

" NERD Commenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }

" Rust
let g:rustfmt_autosave = 1

" Coc
augroup coc_config
  autocmd!
  let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-cmake',
  \ 'coc-clangd',
  \ 'coc-rust-analyzer',
  \ 'coc-pyright',
  \ ]

  " 'Smart' navigation
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? '\<C-n>' :
        \ <SID>check_back_space() ? '\<TAB>' :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
  " position. Coc only does snippet and additional edit on confirm.
  if exists('*complete_info')
    inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
  else
    imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif

  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gD <Plug>(coc-declaration)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references-used)

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

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
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

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  " nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
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
  " Implement methods for trait
  nnoremap <silent><nowait> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<CR>
  " Show actions available at this location
  nnoremap <silent> <space>a  :CocAction<CR>
augroup END

