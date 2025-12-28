return {
  "laytan/cloak.nvim",
  event = "BufReadPre",
  config = function()
    require("cloak").setup({
      enabled = true,
      cloak_character = "*",
      highlight_group = "Comment",

      patterns = {
        {
          -- matches: .env, .env.local, .env.prod, app.env, test.env
          file_pattern = { "*.env", ".env*" },
          cloak_pattern = "=.+",
        },
      },
    })
  end,
}

