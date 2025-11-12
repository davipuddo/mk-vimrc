local lsps = {
	{ "lua_ls" },
	{ "clangd" },
	{ "nvim-flutter/flutter-tools.nvim" },
	{
		"pylsp",
		{
			pylsp = {
				signature = {
					line_length = 120;
				},
			},
		}
	},
	{
		"rust_analyzer",
		{
			["rust_analyzer"] = {
				cargo = { allFeatures = true },
				checkOnSave = { command = "clippy" },
			},
		},
	},
}

for _, lsp in pairs(lsps) do
	local name, config = lsp[1], lsp[2]
	vim.lsp.enable(name)
	if config then
		vim.lsp.config(name, config)
	end
end

vim.diagnostic.enable(true);
vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = {
		spacing = 16,
		virt_text_pos = "eol",
	},
	underline = true,
	severity_sort = true,
	signs = false,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
	}
);

return {

}
