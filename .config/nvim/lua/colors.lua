-- vim.g.tokyonight_style = 'night'
-- vim.cmd [[ colorscheme tokyonight ]]

vim.g.nord_contrast = true
vim.g.nord_italic = false
require('nord').set()
vim.cmd [[ colorscheme nord ]]

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- require("catppuccin").setup()
-- vim.cmd [[colorscheme catppuccin]]

-- vim.cmd [[colorscheme nord]]

require('lualine').setup {
  options = {
    theme = 'nord'
  }
}

