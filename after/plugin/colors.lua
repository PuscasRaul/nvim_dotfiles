function ColorMyPencils(color)
color = color or "rose-pine"
vim.cmd.colorscheme(color)
vim.opt.colorcolumn = "80"
vim.cmd("highlight ColorColumn guibg=#555555 ctermbg=8")
vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })

end

ColorMyPencils()
