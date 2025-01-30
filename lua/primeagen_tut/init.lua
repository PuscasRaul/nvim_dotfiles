require("primeagen_tut.remap")
print("hello from the primeagen")
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.scrolloff = 999
vim.opt.colorcolumn= "80"
vim.keymap.set("", "<Up>", "<Nop>", {silent = true})
vim.keymap.set("", "<Down>", "<Nop>", {silent = true})
vim.keymap.set("", "<Left>", "<Nop>", {silent = true})
vim.keymap.set("", "<Right>", "<Nop>", {silent = true})
require'lspconfig'.pyright.setup{}
require'lspconfig'.lua_ls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.sqlls.setup{}
require('lspconfig').csharp_ls.setup({
  cmd = { "csharp-ls" }, -- Command to start the language server
  env = {
    DOTNET_ROOT = "/usr/lib64/dotnet", -- Path to your .NET SDK
  },
  settings = {
    csharp_ls = {
      msbuild = {
        useLegacySdkResolver = true, -- Optional: Enable if older SDK resolvers are needed
      },
    },
  },
})

