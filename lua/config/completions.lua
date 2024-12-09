local cmp = require("cmp")

local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
		})
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Down>"] = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = "select" })
			else
				vim.cmd("norm! j")
			end
		end,
		["<Up>"] = function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "select" })
			else
				vim.cmd("norm! k")
			end
		end,
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	{
		{ name = "buffer" },
	})
})
