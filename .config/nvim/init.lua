require('basics')
require('bindings')
require('colors')
require('telescope-config')
require('treesitter-config')
require('coc-config')
require('functions')
require('lualine').setup()

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'folke/tokyonight.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-commentary'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  use 'machakann/vim-highlightedyank'
  use 'rhysd/vim-clang-format'
  use 'rust-lang/rust.vim'
  use 'kdheepak/lazygit.nvim'
end)
