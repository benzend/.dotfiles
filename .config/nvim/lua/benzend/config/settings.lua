local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true

opt.mouse = 'a'

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.wrap = false

opt.clipboard = 'unnamedplus'

opt.backup = false

opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

opt.signcolumn = 'yes'

opt.isfname:append('@-@')

opt.cmdheight = 1

opt.updatetime = 50

opt.colorcolumn = '80'

g.mapleader = ' '
