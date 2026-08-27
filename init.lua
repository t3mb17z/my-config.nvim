vim.o.shell = os.getenv("SHELL")

vim.g.mapleader = ' '
vim.gnmaplocalleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.updatetime = 200
vim.o.autoindent = true
vim.o.smartindent = true

require("config.lazy")
require("config")
