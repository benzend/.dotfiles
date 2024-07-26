local M = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { "javascript", "typescript", "ocaml", "lua", "rust", "ruby", "php" },
        sync_install = true,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}

return M
