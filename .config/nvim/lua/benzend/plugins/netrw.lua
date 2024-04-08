local M = {
	'prichrd/netrw.nvim',
	config = function()
		require'netrw'.setup{
			use_devicons = true
		}
	end
}

return M
