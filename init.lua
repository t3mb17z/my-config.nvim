vim.o.shell = "zsh"

vim.g.mapleader = ' '
vim.gnmaplocalleader = ' '

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.expandtab = true

vim.o.updatetime = 200

require("config.lazy")
require("config")
local bufnr = vim.api.nvim_create_buf(true, false)
local win = vim.api.nvim_open_win(bufnr, true, {
	relative = 'editor',
	width = 45,
	height = 23,
	row = 1, col = 1,
})
vim.bo[bufnr].modifiable = true
local tem = vim.api.nvim_open_term(bufnr, {})
if tem == 0 then
  print("Error")
end
vim.api.nvim_chan_send(tem, "ls\n")
