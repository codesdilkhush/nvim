return {
    "gbprod/substitute.nvim",
    event = {"BufReadPre","BufNewFile"},
    config = function()
    
        local sub = require("substitute")
        local keymap = vim.keymap


        keymap.set("n", "<leader>r", sub.operator, { desc = "Replace (operator)", silent = true })
        keymap.set("n", "<leader>rr", sub.line, { desc = "Replace line", silent = true })
        keymap.set("n", "<leader>re", sub.eol, { desc = "Replace to end of line", silent = true })
        keymap.set("x", "<leader>r", sub.visual, { desc = "Replace selection", silent = true })


        sub.setup()
    end,
}
