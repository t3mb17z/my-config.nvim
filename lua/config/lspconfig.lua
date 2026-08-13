---@diagnostic disable: param-type-mismatch
local on_attach = function()
    vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set('n', "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set('n', "<leader>gi", vim.lsp.buf.implementation, {})
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

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("emmylua_ls", {
    cmd = { 'emmylua_ls' },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { 'lua' },
    settings = {
        workspace = {
            library = {
                vim.env.VIMRUNTIME,
                (os.getenv("HOME")) .. "/.config/love-api",
                vim.fn.getcwd(0, 0), vim.fn.getcwd(0, 0) .. "/lua"
            },
            checkThirdParty = false,
            -- useGitIgnore = false,
        },
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            enable = true,
            globals = {
                "love", "vim"
            }
        }
    },
    root_markers = { ".emmyrc.json", ".luarc.json", ".git" }
})

vim.lsp.config("tsgo", {
    filetypes = { 'javascript', 'typescript' },
    capabilities = capabilities,
    on_attach = on_attach,
})

-- vim.lsp.config("denols", {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })

vim.lsp.config("emmet_language_server", {
    filetypes = { 'html', 'css' },
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("clangd", {
    cmd = { "clangd", "--inlay-hints", "--clang-tidy" },
    filetypes = { 'c', 'cpp' },
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("zls", {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zon' },
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("rust_analyzer", {
    filetypes = { 'rust' },
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
                features = "all",
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true
            }
        }
    },
    root_dir = vim.fs.root(0, { "Cargo.toml", ".git" })
})

-- local pyvenv = "/home/john/.local/python-venv"
vim.lsp.config("ty", {
    cmd = { 'ty','server' },
    filetypes = { 'python' },
    capabilities = capabilities,
    on_attach = on_attach,
    -- settings = {
    --     python = {
    --         analysis = {
    --             autoSearchPaths = true,
    --             useLibraryCodeForTypes = true
    --         }
    --     }
    -- }
})

local javaconf = require("config.java")
javaconf.root_dir = vim.fs.root(0, {
    ".git", "mvnw", "gradlew",
})
javaconf.filetypes = { 'java' }
javaconf.capabilities = capabilities
javaconf.on_attach = on_attach

vim.lsp.config("jdtls", javaconf)


vim.lsp.config("bashls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("jsonls", {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { 'json', 'jsonc' },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        json = {
            validate = { enable = true }
        }
    }
})

-- vim.lsp.config("cssls", {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })

vim.lsp.config("gopls", {
    filetypes = { 'go', 'mod' },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = vim.fs.root(0, { "go.mod", ".git" })
})

-- vim.lsp.config("html", {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- })

vim.lsp.enable({
    "clangd", "emmylua_ls", "tsgo", "ty",
    "rust_analyzer", "bashls", "jdtls", "gopls",
    "jsonls", "zls", "emmet_language_server"
}, true)
