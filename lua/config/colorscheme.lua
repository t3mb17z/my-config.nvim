vim.o.background = "dark"


require("tokyonight").setup({
  style = "night",
})

--[[require("kanagawa").setup({
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
  typeStyle = { bold = false }
})]]

vim.cmd.colorscheme("tokyonight")
