vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "asm" },
    callback = function(args)
        vim.treesitter.start(args.buf)
    end
})
