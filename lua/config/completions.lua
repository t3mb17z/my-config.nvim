local cmp = require("cmp")

require("luasnip.loaders.from_vscode").load()

local icons = {
	Array = "",
	Function = "",
	Text = "",
	Object = "",
	Class = "",
	Snippet = "",
	Field = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(_, vim_item)
			print(vim_item.kind) --= (icons[vim_item.kind] or "Foo") .. " " .. vim_item.kind
			return vim_item
		end,
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
