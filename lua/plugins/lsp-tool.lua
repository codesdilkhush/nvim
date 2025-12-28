return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- Lua
                "stylua",

                -- JS / TS / Web
                "prettier",

                -- Python
                "black",
                "isort",
                -- Go
                "gospel",
                "goimports",

                -- C / C++
                "clang-format",

                -- Shell
                "shfmt",

                -- LSP servers
                "lua-language-server",
                "pyright",
                "gopls",
                "ts_ls",
                "html",
                "cssls",
            },
        })
    end,
}
