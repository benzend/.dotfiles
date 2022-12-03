require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "williamboman/mason.nvim" }
	use { "catppuccin/nvim", as = "catppuccin" }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })
  use { "nvim-telescope/telescope-project.nvim" }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use { 'neovim/nvim-lspconfig' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
  use { 'terrortylor/nvim-comment' }
end)
