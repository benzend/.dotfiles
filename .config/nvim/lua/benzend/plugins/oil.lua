local M = {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      show_hidden = true,
    }
  },
  -- Optional dependencies
  dependencies = { "echasnovski/mini.icons" },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function (_, opts)
    require("oil").setup(opts)
  end
}

return M
