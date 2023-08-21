local M = {
	"nvim-telescope/telescope.nvim",
	tag = '0.1.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<C-M-o>", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
		{
			"<C-M-p>",
			"<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))<cr>",
		},
		{ "<C-g>", "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
		{ "<C-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
	},
	opts = function()
		return {
			pickers = {
				find_files = { hidden = true },
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end,
				},
			},
			defaults = {
				file_ignore_patters = {
					"node_modules"
				}
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
	end,
}

return M
