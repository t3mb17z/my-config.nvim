local npairs = require("nvim-autopairs")

vim.keymap.set('n', "<C-n>", function()
    require("oil").toggle_float()
end, { noremap = true })

vim.keymap.set('i', "<CR>", function()
    return npairs.autopairs_cr()
end, { expr = true, replace_keycodes = false })
