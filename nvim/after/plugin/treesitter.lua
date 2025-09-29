require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
<<<<<<< HEAD
  ensure_installed = { "c", "vim", "lua" },
=======
  ensure_installed = { "c", "vim", "lua", "vimdoc", "markdown", "markdown_inline" },
>>>>>>> 1cac5a31e9f3b598550768bab77cddec797cd581

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
