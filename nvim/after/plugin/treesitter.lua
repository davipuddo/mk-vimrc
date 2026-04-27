 require('nvim-treesitter').setup {
  ensure_installed = { "c", "vim", "lua", "markdown", "hyprlang", },

  install_dir = vim.fn.stdpath('data') .. '/site',
}
