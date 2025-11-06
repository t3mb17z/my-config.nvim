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
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "\u{f530}",
      [vim.diagnostic.severity.WARN] = "\u{f071}",
      [vim.diagnostic.severity.INFO] = "\u{ea74}",
      [vim.diagnostic.severity.HINT] = "\u{f400}",
    }
  }
})

vim.api.nvim_create_autocmd({ "CursorHold", }, {
  callback = function()
    vim.diagnostic.open_float({
      focusable = false,
      border = "rounded",
    })
  end
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("emmylua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = {
        library = {
          "$VIMRUNTIME"
        }
      }
    }
  }
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("clangd", {
  -- cmd = { "clangd-19" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      workspace = {
        library = {
          "$VIMRUNTIME"
        }
      }
    }
  }
})

vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = true,
      pachePriming = {
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
  root_dir = vim.fs.root(0, { "Cargo.toml", ".git" })
})

-- local pyvenv = "/home/john/.local/python-venv"
vim.lsp.config("pyright", {
  -- cmd = { "pyright-langserver", "--stdio" },
  capabilities = capabilities,
  on_attach = on_attach,
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

vim.lsp.config("jdtls", javaconf)


vim.lsp.config("bashls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("jsonls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true }
    }
  }
})

vim.lsp.config("emmet_language_server", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("cssls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = vim.fs.root(0, { "go.mod", ".git" })
})

vim.lsp.config("html", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("vls", {
  cmd = { "vls" },
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.enable("clangd")
vim.lsp.enable("emmylua_ls")
vim.lsp.enable("pyright")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("vls")
