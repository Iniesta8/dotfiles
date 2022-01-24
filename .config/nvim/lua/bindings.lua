vim.api.nvim_set_keymap('n', '<leader>w', ':w!<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':q<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>,', '<C-^>', { noremap = true })
-- clear search
vim.api.nvim_set_keymap('n', '<leader>qs', '<Esc>:noh<CR>', { noremap = true })
-- find merge conflict markers
vim.api.nvim_set_keymap('n', '<leader>fc', '/\\v^[<\\|=>]{7}( .*\\|$)<CR>', { noremap = true })

