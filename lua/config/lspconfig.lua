local lsp = require("lspconfig")

local on_attach = function()
	vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})
end

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", }, {
	callback = function()
		vim.diagnostic.open_float(0, {
			focusable = false,
			border = "rounded",
		})
	end
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
