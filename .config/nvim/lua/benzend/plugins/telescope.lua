local M = {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ahmedkhalf/project.nvim",
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  keys = {
    { "<C-M-o>", "<cmd>lua require('telescope.builtin').find_files()<cr>" },
    {
      "<C-M-p>",
      "<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown({}))<cr>",
    },
    { "<C-g>",   "<cmd>lua require('telescope.builtin').live_grep()<cr>" },
    { "<C-f>",   "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
  },
  opts = function()
    return {
      pickers = {
        sort_lastused = true,
        previewer = false,
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--glob",
            "!**/.git/*"
          }
        }
      },
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".next"
        },
        vimgrep_arguments = {
          "rg",
          "--vimgrep",
          "--hidden",
          "--smart-case",
          "--trim"
        }
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("projects")
    telescope.load_extension("live_grep_args")
  end,
}

return M
