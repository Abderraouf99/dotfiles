vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- disable line wrap
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

-- colours
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus") -- use system clipboard

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
