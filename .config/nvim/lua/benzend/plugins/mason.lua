local M = {
	"williamboman/mason.nvim",
	config = function()
		require('mason').setup({
      servers = {
        -- remove if server issue fixed
        "rust-analyzer@2024-10-21"
      }
    })
	end
}

return M
