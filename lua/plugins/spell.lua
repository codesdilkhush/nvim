return {
  "kamykn/spelunker.vim",
  event = "BufReadPost",
  config = function()
    -- Enable spell checking
    vim.opt.spell = true
    vim.opt.spelllang = { "en" }

    -- camelCase, snake_case, PascalCase
    vim.opt.spelloptions = "camel"

    -- Spelunker behavior
    vim.g.spelunker_check_type = 2        -- full file
    vim.g.spelunker_highlight_type = 2    -- underline

    -- Reduce false positives
    vim.g.spelunker_disable_auto_group = 1
    vim.g.spelunker_max_suggest_words = 5
  end,
}


