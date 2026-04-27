require("tree-sitter-manager").setup({
	ensure_installed = {
		"c", "vim", "lua", "toml", "java", "javascript", "html", "json",
		"rust", "css", "ini", "cpp", "fish", "bash", "hyprlang"
	},

	border = "rounded",
	auto_install = true,

	install_dir = vim.fn.stdpath('data') .. '/site',
	parser_dir = vim.fn.stdpath('data') .. '/site/parser',
	query_dir = vim.fn.stdpath('data') .. '/site/queries',
})
