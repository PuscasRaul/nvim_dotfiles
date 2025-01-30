vim.g.mapleader = " "
vim.keymap.set( "n", "<leader>q", vim.cmd.Ex)
vim.keymap.set( "i", "<C-e>", "<C-o>A", { silent = true })
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>h', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>l', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
