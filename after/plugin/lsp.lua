-------- MASON LSPCONFIG
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'clangd',
		'lua_ls',
		'rust_analyzer',
		'vtsls',
		'pyright',
		'sqlls',
		'lemminx',
		'unocss',
		'omnisharp',
    'vtsls',
	}
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_capabilities.signatureHelpProvider = false  -- Add this line

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup({
      capabilities = lsp_capabilities
    })
  end,
  -- Special setup for Lua
  lua_ls = function()
    require('lspconfig').lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          diagnostics = { globals = {'vim'} },
          workspace = { library = vim.api.nvim_get_runtime_file('', true) }
        }
      }
    })
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP keybindings',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end
})

-------- LUASNIP CONFING
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
ls.filetype_set("cpp", { "c" })
ls.add_snippets("all", {
	s("autotrigger", {
		t("autosnippet"),
	}),
}, {
	type = "autosnippets",
	key = "all_auto",
})

-- ls.config.setup({
--   enable_autosnippets = false,  -- Disable automatic snippet expansion
--   store_selection_keys = nil,   -- Disable auto-expansion on select
-- })



-------- CMP CONFING
local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  window = {
    documentation = cmp.config.window.bordered(),
  },
})

vim.filetype.add({
  extension = {
    fxml = "xml",
    axaml = "xml"
  }
})

vim.lsp.config('csharp_ls', {
  -- Server-specific settings. See `:help lsp-quickstart`
  settings = {
    ['csharp_ls'] = {},
  },
})
