local opt = vim.opt -- for easier to read

-- helps perfomance on windows with my anti-virus software
vim.g.nofsync = true

vim.cmd([[au BufNewFile,BufRead *.v set filetype=v]])
-- let's get smart indenting
opt.smartindent = true
-- No annoying backups
opt.backup = false
-- no wrapping helps for code
opt.wrap = false

-- indention to 4 characters
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- expand on tab
opt.expandtab = true

-- do not highligt previous searches
opt.hlsearch = false
-- higlight matches while searching
opt.incsearch = true
-- do ignore case search when search
opt.ignorecase = true
-- case sensitive if a case character is part of search
opt.smartcase = true

opt.showtabline = 1 -- always show tabs
vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

-- shows a line where the cursor is
opt.cursorline = true

opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10
-- apperance

-- use terminal gui colors
opt.termguicolors = true
-- always use dark
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

-- use line numbers
opt.nu = true
-- and use relateive line numbers
opt.relativenumber = true

opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
