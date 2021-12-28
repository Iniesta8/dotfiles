vim.cmd([[
    " Strip trailing whitespace (,ss)
    function! StripWhitespace ()
      let save_cursor = getpos('.')
      let old_query = getreg('/')
      :%s/\s\+$//e
      call setpos('.', save_cursor)
      call setreg('/', old_query)
    endfunction
    nnoremap <leader>ss :call StripWhitespace()<CR>
]])

vim.cmd([[
    autocmd!
    let g:clang_format#detect_style_file = 1
    let g:clang_format#auto_format = 1
    " Toggle auto formatting:
    nmap <leader>C :ClangFormatAutoToggle<CR>
    " auto-enabling auto-formatting
    autocmd FileType c ClangFormatAutoEnable
]])
