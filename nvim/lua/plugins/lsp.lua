local lsps = {
	{
		"lua_ls",
		{
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			}
		}
	},
	{ "jdtls" },
	{ "clangd" },
	{ "ts_ls" },
	{ "cssls" },
	{ "html" },
	{ "jsonls" },
	{ "nvim-flutter/flutter-tools.nvim" },
	{ "zls" },
	{ "bashls" },
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

vim.keymap.set("n", "gd", vim.lsp.buf.definition)

return {}
