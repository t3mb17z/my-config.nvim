local lsp = require("lspconfig")

local on_attach = function()
	vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})
	vim.keymap.set('n', "<leader>gd", vim.lsp.buf.definition, {})
	vim.keymap.set('n', "<leader>gi", vim.lsp.buf.implementation, {})

	vim.keymap.set('n', "<leader>gr", require("telescope.builtin").lsp_references, {})
  vim.keymap.set('n', "<leader>lg", require("telescope.builtin").live_grep, {})
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
		vim.diagnostic.open_float({
			focusable = false,
			border = "rounded",
		})
	end
})

vim.diagnostic.open_float()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. '/.luarc.json') or
				vim.loop.fs_stat(path .. '/.luarc.jsonc') then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force',
			client.config.settings.Lua, {
				runtime = {
					version = 'LuaJIT'
				},
				workspace = {
					checkThirdParty = false,
					library = {
            vim.fn.expand("$VIMRUNTIME"),
          }
				}
			}
		)
	end,
	settings = {
		Lua = {},
	}
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
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy",
      },
      cachePriming = {
        enable = true
      },
      imports = {
        granularity = {
          group = "module"
        },
        prefix = "self"
      },
      cargo = {
        buildScripts = {
          enable = false
        },
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = false
      }
    }
  },
  root_dir = require("lspconfig.util").root_pattern("Cargo.toml", ".git")
})

local pyvenv = "/home/john/.local/python-venv"
lsp.pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = function(client)
		client.config.settings.python = vim.tbl_deep_extend('force', client.config.settings.python, {
			pythonPath = pyvenv .. "/private",
		})
	end,
	settings = {
		python = {}
	}
})

local javaconf = require("config.java")
javaconf.root_dir = vim.fs.root(0, {
  ".git", "mvnw", "gradlew",
})
javaconf.capabilities = capabilities
javaconf.on_attach = on_attach

lsp.jdtls.setup(javaconf)


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

lsp.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
