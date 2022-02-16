vim.g.tokyonight_style = 'night'

vim.cmd([[
augroup transparent_bg
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
augroup END

colorscheme tokyonight
]])

