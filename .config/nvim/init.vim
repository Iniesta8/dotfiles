" vim:fdm=marker

" Plugins -------------------------------------------------------------

" Load plugins {{{
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

call plug#end()
" }}}

" Settings -------------------------------------------------------------

" Preamble {{{

" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
colorscheme challenger_deep

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
" }}}

" Mapleader {{{
let mapleader=","
let g:mapleader=","
" }}}

" Directories {{{
set undodir=~/.vim/undo//
set directory=~/.vim/swap//
set nobackup " Some servers have issues with backup files
set nowritebackup
" }}}

" Set some basic stuff {{{
set autoindent " Copy indent from last line when starting new line
set autoread " Set to auto read when a file is changed from the outside
set backspace=indent,eol,start
set cmdheight=2 " Give more space for displaying messages.
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set expandtab " Expand tabs to spaces
set nofoldenable " Disable folding
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (lightline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set relativenumber
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/zsh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting
set shortmess+=c " Don't give ins-completion-menu messages
set showtabline=2 " Always show tab bar
set si " Smart indent
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set signcolumn=yes " Always show signcolumns
set smartcase " Ignore 'ignorecase' if search pattern contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 4 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set tabstop=2
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
set updatetime=300 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" }}}


" Configuration -------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" General {{{
augroup general_config
  autocmd!

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
  " }}}

  " Sudo write (,W) {{{
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Quickly close the current window (,Q) or current buffer (,q) {{{
  nnoremap <leader>Q :q<CR>
  nnoremap <leader>q :bd<CR>
  " }}}

  " Get output of shell commands {{{
  command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
  " }}}

  " Remap :W to :w {{{
  command! W w
  " }}}

  " Fast saving {{{
  nmap <leader>w :w!<CR>
  " }}}

  " Toggle show tabs and trailing spaces (,c) {{{
  set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
  set fcs=fold:-
  nnoremap <silent> <leader>c :set nolist!<CR>
  " }}}

	" Clear last search (,qs)
  map <silent> <leader>qs <Esc>:noh<CR>
  map <silent> <leader>qs <Esc>:let @/ = ""<CR>
  " }}}

  " Find merge conflict markers {{{
  map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
  " }}}

  " Display all lines with keyword under cursor and ask which one to jump to {{{
  nmap <leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search) {{{
  map <space> /
  map <c-space> ?
  " }}}

  " Toggle relative line numbers {{{
  nnoremap <leader>N :setlocal relativenumber!<CR>
  " }}}

  " Move code in visual mode {{{
  vnoremap J :m '>+1<CR>gv=gv
  vnoremap K :m '>-2<CR>gv=gv
  " }}}

augroup END
" }}}

" Buffers {{{
augroup buffer_control
  autocmd!

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <leader>, <C-^>
  map <leader>b :Buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

augroup END
" }}}

" Highlight Interesting Words {{{
augroup highlight_interesting_word
  autocmd!
  " This mini-plugin provides a few mappings for highlighting words temporarily.
  "
  " Sometimes you're looking at a hairy piece of code and would like a certain
  " word or two to stand out temporarily.  You can search for it, but that only
  " gives you one color of highlighting.  Now you can use <leader>N where N is
  " a number from 1-6 to highlight the current word in a specific color.
  function! HiInterestingWord(n) " {{{
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
  endfunction " }}}

  " Mappings {{{
  nnoremap <silent> <leader>1 :call HiInterestingWord(1)<CR>
  nnoremap <silent> <leader>2 :call HiInterestingWord(2)<CR>
  nnoremap <silent> <leader>3 :call HiInterestingWord(3)<CR>
  nnoremap <silent> <leader>4 :call HiInterestingWord(4)<CR>
  nnoremap <silent> <leader>5 :call HiInterestingWord(5)<CR>
  nnoremap <silent> <leader>6 :call HiInterestingWord(6)<CR>
  " }}}

  " Default Highlights {{{
  hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
  hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
  hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
  hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
  hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
  hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
  " }}}
augroup END
" }}}

" Restore Cursor Position {{{
augroup restore_cursor
  autocmd!

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}

" Search files and file content (grep) {{{
augroup search_config
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

augroup END
" }}}

" Plugin Configuration -------------------------------------------------------------

" Lightline.vim {{{
augroup lightline_config
	autocmd!
	let g:lightline = {
		\ 'colorscheme': 'challenger_deep',
		\ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'filename': 'LightlineFilename',
    \   'cocstatus': 'coc#status'
    \ },
    \ }
	function! LightlineFilename()
	  return expand('%:t') !=# '' ? @% : '[No Name]'
	endfunction

	" Use autocmd to force lightline update
	autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END
" }}}

" NERDtree {{{
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
" }}}

" Syntastic.vim {{{
augroup syntastic_config
  autocmd!
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_cpp_compiler_options = '-std=c++2a'
augroup END
" }}}

" Fugitive {{{
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
" }}}

" vim-clang-format {{{
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
" }}}

" NERD Commenter {{{
augroup nerd_commenter_config
  autocmd!
  let NERDSpaceDelims = 1
  let NERDCompactSexyComs = 1
  let g:NERDTrimTrailingWhitespace = 1
  let g:NERDCommentEmptyLines = 1
  let g:NERDCustomDelimiters = { 'c': { 'left': '//' } }
augroup END
" }}}

" Rust {{{
augroup rust_config
  autocmd!
  let g:rustfmt_autosave = 1
augroup END
" }}}

" coc {{{
augroup coc_config
  autocmd!
  let g:coc_global_extensions = [
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
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

  " Use <c-.> to trigger completion.
  inoremap <silent><expr> <c-.> coc#refresh()

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
  " nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  " nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  " nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  " nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  " nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  " nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  " nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

  " Implement methods for trait
  " nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<CR>
  " Show actions available at this location
  " nnoremap <silent> <space>a  :CocAction<CR>
augroup END
" }}}

"
