--vim.api.nvim_create_autocmd("BufWritePost", {
--	pattern = {"*.java"},
--	callback = function ()
--		local fileName = vim.api.nvim_buf_get_name(0)
--		vim.cmd(":silent !google-java-format -r " ..fileName)
--	end
--}
--)
