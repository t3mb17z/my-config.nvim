vim.o.background = "dark"


require("tokyonight").setup({
  style = "night",
})

local scheme = ""

local char = vim.fn.input("Is day?: ")
if char == 's' then
  scheme = "tokyonight-day"
elseif char == 'n' then
  scheme = "tokyonight-night"
end

--[[require("kanagawa").setup({
  commentStyle = { italic = false },
  functionStyle = { bold = true },
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
  typeStyle = { bold = false }
})]]

vim.cmd.colorscheme(scheme)

return scheme
