-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({

	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
  })

  use {'nyoom-engineering/oxocarbon.nvim'}

  use ("nvim-treesitter/nvim-treesitter", {run = ":TSUpdate"}) 

  use ('nvim-treesitter/playground')

  use ("neovim/nvim-lspconfig")

  use ('ms-jpq/coq_nvim', {branch = 'coq'})

  use ('ms-jpq/coq.artifacts', {branch = 'artifacts'})

  use ('ms-jpq/coq.thirdparty', {branch = '3p'})

end)
