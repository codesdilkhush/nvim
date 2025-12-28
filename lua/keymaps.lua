-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- File Explorer (NvimTree)
keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })

keymap.set("n", "<leader>e", function()
	local api = require("nvim-tree.api")
	if vim.bo.filetype == "NvimTree" then
		vim.cmd("wincmd p")
	else
		api.tree.focus()
	end
end, { silent = true, desc = "Toggle focus tree/file" })

keymap.set("n", "<leader>c", function()
	require("nvim-tree.api").node.navigate.parent_close()
end, { silent = true, desc = "Collapse folder" })

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- File actions
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to clipboard" })
keymap.set("v", "<leader>x", '"+d', { desc = "Cut selection to clipboard" })
keymap.set("n", "<leader>xw", '"+diw', { desc = "Cut word to clipboard" })
keymap.set("n", "<leader>xl", '"+dd', { desc = "Cut line to clipboard" })
keymap.set("n", "<leader>p", '"+p', { desc = "Paste after cursor" })
keymap.set("n", "<leader>P", '"+P', { desc = "Paste before cursor" })
keymap.set("v", "<leader>p", '"_d"+p', { desc = "Paste over selection" })

-- LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", {
	desc = "Open LazyGit",
	silent = true,
})

-- LSP
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

--Formatter
keymap.set("n", "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
	})
end, { desc = "Format file" })

-- Native search & replace (current word)
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search & replace word" })

-- Visual editing
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

--Git
keymap.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })

-- Buffers
keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other buffers" })

-- Comments
keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", {
	silent = true,
	desc = "Toggle comment",
})
keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", {
	silent = true,
	desc = "Toggle comment",
})
-- Linter
keymap.set("n", "<leader>ln", function()
	require("lint").try_lint()
end, { desc = "Run lint" })

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Find files" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Word under cursor" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Todos" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "help" })

-- Trouble
keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
keymap.set(
	"n",
	"<leader>xb",
	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
keymap.set(
	"n",
	"<leader>xf",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP (Definitions / References)" }
)
keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Splits
keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
keymap.set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })
keymap.set("n", "<leader>sc", "<cmd>close<cr>", { desc = "Close split" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })

-- Cloak Toggle
keymap.set("n", "<leader>tc", "<cmd>CloakToggle<cr>", { desc = "Toggle Cloak (.env secrets)" })




