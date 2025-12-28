local opt = vim.opt

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- transparent nvim tree
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.cmd([[
      hi NvimTreeNormal guibg=NONE ctermbg=NONE
      hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
      hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
      hi NvimTreeWinSeparator guibg=NONE ctermbg=NONE
    ]])
	end,
})

-- Line number
opt.nu = true

-- Tab and indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- wrapping and file setting
opt.wrap = true
opt.swapfile = false
opt.backup = false

-- undo dir
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

-- search setting
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Color and interface
opt.termguicolors = true
opt.scrolloff = 8

-- Performance and UI settings
opt.updatetime = 40

--Clipboard
opt.clipboard = "unnamedplus"

-- Split
opt.splitright = true
opt.splitbelow = true

-- timeout
opt.timeout = true
opt.timeoutlen = 300


