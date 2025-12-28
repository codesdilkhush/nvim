  return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "▎" },
      change       = { text = "▎" },
      delete       = { text = "▁" },
      topdelete    = { text = "▔" },
      changedelete = { text = "▎" },
    },

    signcolumn = true,      -- show signs in gutter
    numhl      = false,     -- no number highlight
    linehl     = false,     -- no full line highlight
    word_diff  = false,

    current_line_blame = true, -- inline blame
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- end of line
      delay = 500,
    },

    current_line_blame_formatter =
      "<author>, <author_time:%Y-%m-%d> • <summary>",

    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
    },
  },
}

