local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>V', builtin.treesitter, {})
vim.keymap.set('n', '<leader>FS', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
	defaults = {
		color_devicons = true,
		layout_strategy = 'horizontal', 
		layout_config = {
			mirror = false,
			prompt_position = 'bottom',
			height = .85, 
			width = .85,
			preview_cutoff = 80,
			preview_width = 65,
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
  	}
}

require('telescope').load_extension('fzf')
