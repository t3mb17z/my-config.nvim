vim.o.shell = "bash"

vim.g.mapleader = ' '
vim.gnmaplocalleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.o.updatetime = 200

require("config.lazy")
require("config")

vim.opt.rtp:prepend("/home/csod4/repos/volt.nvim")
