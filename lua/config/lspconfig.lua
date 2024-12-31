local lsp = require("lspconfig")

local on_attach = function()
	vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set('n', "<leader>gd", vim.lsp.buf.definition, {})
end

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "\u{f530}",
			[vim.diagnostic.severity.WARN] = "\u{f071}",
			[vim.diagnostic.severity.INFO] = "\u{ea74}",
			[vim.diagnostic.severity.HINT] = "\u{f400}",
		}
	}
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

lsp.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
