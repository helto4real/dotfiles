local opt = vim.opt -- for easier to read

-- leader  have to be set before plugins and all other configs
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- helps perfomance on windows with my anti-virus software
vim.g.nofsync = true

-- Don't show the mode, since it's already in status line
opt.showmode = false

-- Enable break indent
opt.breakindent = true

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'
-- higlight matches while searching
opt.incsearch = true

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
opt.hlsearch = true
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

vim.cmd([[au BufNewFile,BufRead *.v set filetype=v]])
