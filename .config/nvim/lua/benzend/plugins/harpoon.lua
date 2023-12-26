local M = {
	"ThePrimeagen/harpoon",
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		require("harpoon").setup()
	end
}

return M
