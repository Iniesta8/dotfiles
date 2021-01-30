" vim:fdm=marker

" Plugins -------------------------------------------------------------

" Load plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'            " A light and configurable statusline/tabline plugin for Vim
Plug 'preservim/nerdtree'               " A tree explorer plugin for vim
Plug 'preservim/nerdcommenter'          " Vim plugin for intensely nerdy commenting powers
Plug 'vim-syntastic/syntastic'          " Syntax checking hacks for vim
Plug 'tpope/vim-fugitive'               " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-surround'               " surround.vim: quoting/parenthesizing made simple
Plug 'rhysd/vim-clang-format'           " Vim plugin for clang-format, a formatter for C, C++, Obj-C, Java, JavaScript, TypeScript and ProtoBuf
Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent!
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } " Challenger Deep Theme for VIM
Plug 'rust-lang/rust.vim'               " This is a Vim plugin that provides Rust support
Plug 'cespare/vim-toml'                 " Vim syntax for TOML
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'airblade/vim-rooter'              " Rooter changes the working directory to the project root when you open a file or directory
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf is a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf.vim'                 " Things you can do with fzf and Vim
Plug 'arcticicestudio/nord-vim'
" Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

call plug#end()

" Settings -------------------------------------------------------------

" Make vim more useful
set nocompatible

" set t_Co=256
" set background=dark

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

" Syntax highlighting
colorscheme nord
syntax on

" Mapleader
let mapleader=","
let g:mapleader=","

" Directories
set undodir=~/.vim/undo//
set directory=~/.vim/swap//
set nobackup " Some servers have issues with backup files
set nowritebackup

" Set some basic stuff
set autoread " Set to auto read when a file is changed from the outside
set cmdheight=2 " Give more space for displaying messages.
set cursorline " Highlight current line
set encoding=utf-8 nobomb " BOM often causes trouble
set expandtab " Expand tabs to spaces
set nofoldenable " Disable folding
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=100 " Increase history
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set noerrorbells " Disable error bells
set noshowmode " Don't show the current mode (lightline.vim takes care of us)
set nowrap " Do not wrap lines
set nu " Enable line numbers
set relativenumber " Relative line numbers
set scrolloff=3 " Start scrolling three lines before horizontal border of window
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
set tabstop=4
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
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
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

" Get output of shell commands
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

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

" Display all lines with keyword under cursor and ask which one to jump to
" nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>

" Join lines and restore cursor location (J)
nnoremap J mjJ`j

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Toggle relative line numbers
nnoremap <leader>N :setlocal relativenumber!<CR>

" Move code in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Buffers
" Buffer navigation (,,) (,b) (gb) (gB)
map <leader>, <C-^>
map <leader>b :Buffers<CR>
map gb :bnext<CR>
map gB :bprev<CR>

" Jump to buffer number (<N>gb)
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

" Highlight Interesting Words
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
function! HiInterestingWord(n)
  " Save our location.
  normal! mz

  " Yank the current word into the z register.
  normal! "zyiw

  " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
  let mid = 86750 + a:n

  " Clear existing matches, but don't worry if they don't exist.
  silent! call matchdelete(mid)

  " Construct a literal pattern that has to match at boundaries.
  let pat = '\V\<' . escape(@z, '\') . '\>'

  " Actually match the words.
  call matchadd("InterestingWord" . a:n, pat, 1, mid)

  " Move back to our original location.
  normal! `z
endfunction

" Mappings
nnoremap <silent> <leader>1 :call HiInterestingWord(1)<CR>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<CR>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<CR>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<CR>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<CR>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<CR>

" Default Highlights
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" Restore Cursor Position
augroup restore_cursor
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" Search files and file content (grep)
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" fzf default command is sourced in .zshrc, so that fzf uses rg for
" searching:
"		export FZF_DEFAULT_COMMAND='rg --files --hidden'

" fuzzy search for files (fzf + rg)
nnoremap <C-p> :Files<CR>

" fuzzy grep for file content (fzf + rg)
nnoremap <leader>rg :Rg<CR>

" Plugin Configuration -------------------------------------------------------------

" Lightline.vim
augroup lightline_config
  autocmd!
  let g:lightline = {
  \  'colorscheme': 'nord',
  \  'active': {
  \    'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified', 'cocstatus', 'gitbranch']],
  \  },
  \  'component_function': {
  \    'cocstatus': 'coc#status',
  \    'gitbranch': 'FugitiveHead',
  \  },
  \}
augroup END

" NERDtree
augroup nerdtree_config
  autocmd!
  let g:NERDTreeWinPos = "left"
  let g:NERDTreeWinSize = 35
  let NERDTreeShowFiles = 1
  let NERDTreeShowHidden = 1
  let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
  map <leader>nn :NERDTreeToggle<CR>
  map <leader>nb :NERDTreeFromBookmark<Space>
  map <leader>nf :NERDTreeFind<CR>
  map <leader>n :NERDTreeFocus<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Syntastic.vim
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_cpp_compiler_options = '-std=c++2a'

" Fugitive
augroup fugitive_config
  autocmd!
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  nnoremap <silent> <leader>gi :Git add -p %<CR>
  nnoremap <silent> <leader>gg :SignifyToggle<CR>
  nnoremap <silent> <leader>gu :SignifyRefresh<CR>
  " Refresh Signify after commit
  au FileType gitcommit au! BufDelete COMMIT_EDITMSG SignifyRefresh
augroup END

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
let NERDSpaceDelims = 1
let NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }

" Rust
let g:rustfmt_autosave = 1

" coc
augroup coc_config
  autocmd!
  let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-cmake',
  \ ]

  " 'Smart' navigation
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
  " Implement methods for trait
  nnoremap <silent><nowait> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<CR>
  " Show actions available at this location
  " nnoremap <silent> <space>a  :CocAction<CR>
augroup END

