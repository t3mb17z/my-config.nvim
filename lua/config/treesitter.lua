require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"java", "python", "cpp", "c", "typescript",
		"html", "json", "jsonc", "xml", "javascript",
		"rust", "go", "css", "bash"
	}
})

vim.api.nvim_create_autocmd({
	"BufNew", "BufNewFile", "BufRead", "BufEnter"
}, {
	callback = function()
		vim.cmd("TSEnable highlight")
	end
})
