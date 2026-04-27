require('render-markdown').setup({
	enabled = true,

	render_modes = { "n", "c", "t" },

	preset = "obsidian",

	file_types = { "markdown" },
	max_file_size = 10.0,

	latex = {
		enabled = true,
		render_modes = false,
		converter = { "utftex", "latex2text" },
		highlight = "RenderMarkdownMath",
		position = "center",
		top_pad = 0,
		bottom_pad = 0
	},
	completions = {
		blink = { enabled = true }
	}
})
