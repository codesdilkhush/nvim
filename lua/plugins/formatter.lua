return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            -- Map filetypes to formatters
            formatters_by_ft = {
                lua = { "stylua" },

                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },

                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                python = { "isort", "black" },
                go = { "gofmt" },

                c = { "clang_format" },
                cpp = { "clang_format" },
            },

            -- Format on save
            format_on_save = {
                async = false,
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
    end,
}
