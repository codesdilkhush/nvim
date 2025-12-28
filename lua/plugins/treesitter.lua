return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        require("nvim-treesitter").setup {
            ensure_installed = { "lua", "python", "prisma", "javascript", "cpp", "c", "go", "typescript", "css", "html", "tsx", "json", "bash", "yaml", "toml", "sql", "markdown" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            auto_install = true,
            autotag = {
                enable = true
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_selection = "<C-space>",
                    scope_selection = false,
                    node_selection = "<bs>",
                },
            },
        }
    end,
}
