vim.o.background = "dark"


--[[require("tokyonight").setup({
  style = "night",
  styles = {
    comments = { italic = false },
    keywords = { italic = false }
  }
})]]

require("kanagawa").setup({
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
  ty0eStyle = { bold = false }
})

vim.cmd.colorscheme("kanagawa")
