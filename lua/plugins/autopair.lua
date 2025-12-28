return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/nvim-cmp",
    }, 
    
    config = function()
        local autopairs = require("nvim-autopairs")
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        autopairs.setup({
            check_ts = true,
            enable_check_bracket_line = true,

            ts_config = {
                -- Python
                python = { "string", "comment" },

                -- Go
                go = { "string", "comment" },

                -- C / C++
                c = { "string", "comment" },
                cpp = { "string", "comment" },

                -- JavaScript / TypeScript
                javascript = { "string", "template_string", "comment" },
                typescript = { "string", "template_string", "comment" },

                -- React (JSX / TSX)
                javascriptreact = { "string", "template_string", "comment" },
                typescriptreact = { "string", "template_string", "comment" },

                -- HTML
                html = { "comment" },

                -- CSS / SCSS
                css = { "comment" },
                scss = { "comment" },
            },

            disable_filetype = {
                "TelescopePrompt",
                "vim",
            },
        })

        -- 🔗 nvim-cmp integration (REQUIRED)
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )
    end,
}
