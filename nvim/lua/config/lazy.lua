-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " ";
vim.g.maplocalleader = "\\";
vim.wo.relativenumber = true;
vim.wo.number = true;
vim.o.tabstop = 4;
vim.o.shiftwidth = 4;

-- Setup lazy.nvim
require("lazy").setup({
    spec = {

		"neovim/nvim-lspconfig",

		"folke/lazydev.nvim",

		"williamboman/mason.nvim",

		{ import = "plugins.lsp" },

		{
			'nvim-telescope/telescope.nvim',
			tag = '0.1.8',
			dependencies = { 'nvim-lua/plenary.nvim' },
		},

		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { {"nvim-lua/plenary.nvim"} }
		},

		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

		'nvim-tree/nvim-web-devicons',

		'nyoom-engineering/oxocarbon.nvim',

		{
			"nvim-treesitter/nvim-treesitter",
			branch = "master",
			lazy = false,
			build = ":TSUpdate"
		},

		'nvim-treesitter/playground',

		{
			'saghen/blink.cmp',
			dependencies = { 'rafamadriz/friendly-snippets' },
			version = '1.*',
			opts = {
				-- See :h blink-cmp-config-keymap for defining your own keymap
				keymap = { preset = 'default' },

				appearance = {
					nerd_font_variant = 'mono'
				},
				completion = { documentation = { auto_show = false } },
				signature = { enabled = true },
			},
		},
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
