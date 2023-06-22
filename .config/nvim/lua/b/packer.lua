require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	})
	use({ "nvim-telescope/telescope-project.nvim" })
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ "nvim-telescope/telescope-live-grep-args.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "terrortylor/nvim-comment" })

	use({ "christoomey/vim-tmux-navigator" })

	-- lsp
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })

	-- lsp autocomplete
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "onsails/lspkind-nvim" })
	use({
		"L3MON4D3/LuaSnip",
		tag = "v1.*",
		run = "make install_jsregexp",
	})
	use({ "saadparwaiz1/cmp_luasnip" })

	use({ "tpope/vim-fugitive" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({ "codota/tabnine-nvim", run = "./dl_binaries.sh" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	use("m4xshen/autoclose.nvim")
end)
