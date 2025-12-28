return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional (icons)
    },
    lazy = false,
    config = function()
        -- Disable netrw (required)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            hijack_netrw = true,
            sync_root_with_cwd = true,

            view = {
                width = 30,
                side = "left",
            },

            renderer = {
                highlight_git = true,
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },

            filters = {
                dotfiles = false,
            },

            git = {
                enable = true,
                ignore = false,
            },

            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
        })
    end,
}
