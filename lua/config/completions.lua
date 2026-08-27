local blink = require("blink.cmp")

local function get_mini_icon(ctx)
    if ctx.source_name == "Path" then
        local is_unknown_type = vim.tbl_contains({
            "link", "socket", "file", "fifo",
            "char", "block", "unknown"
        }, ctx.item.data.type)

        local mini_icon, mini_hl = require("mini.icons").get(
            is_unknown_type and "os" or ctx.item.data.type,
            is_unknown_type and "" or ctx.label
        )

        if mini_icon then
            return mini_icon, mini_hl
        end
    end

    local mini_icon, mini_hl, _ = require("mini.icons").get(
        "lsp", ctx.kind
    )

    return mini_icon, mini_hl
end

blink.setup({
    keymap = {
        preset = 'none',
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<Down>'] = {
            function(cmp)
                return cmp.select_next({
                    auto_insert = false
                })
            end, 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<Up>'] = {
            function(cmp)
                return cmp.select_prev({
                    auto_insert = false
                })
            end, 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-Space>'] = { 'show' },
        fuzzy = {
            implementation = "rust"
        }
    },
    sources = {
        default = { 'lsp', 'snippets' },
        providers = {
            lsp = {
                score_offset = 100
            },
            snippets = {
                score_offset = -10,
                enabled = function()
                    local ok, node = pcall(vim.treesitter.get_node)
                    return not (ok and node and node:type():match('string'))
                end
            }
        }
    },
    appearance = {},
    completion = {
        menu = {
            draw = {
                columns = {
                    { "kind_icon", "label", gap = 1 },
                    { "kind", gap = 0 },
                },
                components = {
                    label = {
                        text = function(ctx)
                            return ctx.label
                        end
                    },
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _ = get_mini_icon(ctx)
                            return kind_icon
                        end,
                        highlight = function(ctx)
                            local _, hl = get_mini_icon(ctx)
                            return hl
                        end
                    },
                    kind = {
                        highlight = function(ctx)
                            local _, hl = get_mini_icon(ctx)
                            return hl
                        end
                    }
                }
            },
            border = 'double'
        },
        accept = {
            auto_brackets = {
                enabled = true
            }
        },
    }
})

require("luasnip.loaders.from_vscode").load()

-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#ffffff", bg = "#241926" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
