return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- VS Code tabs
        numbers = "none",

        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = false,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return icon .. count
        end,

        separator_style = "slant", -- VS Code-like
        always_show_bufferline = true,

        truncate_names = true,
        max_name_length = 18,
        max_prefix_length = 12,

        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },

      highlights = {
        fill = {
          bg = "#1e1e2e",
        },
        background = {
          bg = "#1e1e2e",
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    })
  end,
}

