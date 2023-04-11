local lga_actions = require("telescope-live-grep-args.actions")

require('telescope').setup{
  extensions = {
    live_grep_args = {
      auto_quoting = true,

      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        }
      }
    }

  }
}
require('telescope').load_extension('project')
