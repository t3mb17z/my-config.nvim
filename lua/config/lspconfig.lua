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
	cmd = { "/home/john/.local/lua-language-server/bin/lua-language-server" },
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.ts_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.clangd.setup({
	cmd = { "clangd-19" },
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.rust_analyzer.setup({
	-- cmd = { "/home/john/.cargo/ra-multiplex/target/release/ra-multiplex", 'server' },
	capabilities = capabilities,
	on_attach = on_attach,
})

local pyvenv = "/home/john/.local/python-venv"
lsp.pyright.setup({
	cmd = { pyvenv .. "/private/bin/pyright-python-langserver", "--stdio" },
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			venvPath = pyvenv,
			analysis = {
				extraPaths = {
					pyvenv .. "/private"
				}
			}
		}
	}
})

lsp.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true }
		}
	}
})

lsp.emmet_language_server.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
