vim.api.nvim_create_autocmd({
	"BufNew", "BufNewFile", "BufRead", "BufEnter"
}, {
	callback = function()
		vim.cmd("TSEnable highlight")
	end
})
