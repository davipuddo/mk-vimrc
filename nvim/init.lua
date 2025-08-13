require("pdd");

vim.wo.relativenumber = true;
vim.o.tabstop = 4;
vim.o.shiftwidth = 4;
vim.cmd.set("conceallevel=1")
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("COQnow --shut-up")
	end,
})
