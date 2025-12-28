return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",

		-- FZF native (fast)
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},

		"nvim-tree/nvim-web-devicons",
		"folke/trouble.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble_telescope = require("trouble.sources.telescope")

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = "❯ ",
				path_display = { "smart" },
				preview = {
					treesitter = false,
				},
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				file_ignore_patterns = {
					"%.git",
					"^.git/",
					"node_modules",
					"dist",
					"build",
					".next",
					".cache",
                    ".venv",
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-t>"] = trouble_telescope.open,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<Esc>"] = actions.close,
					},
					n = {
						["q"] = actions.close,
					},
				},
			},

			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		-- Load fzf safely
		pcall(telescope.load_extension, "fzf")
	end,
}
