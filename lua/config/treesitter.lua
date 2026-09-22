vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "asm", "markdown", "nim", "go", "gomod" },
    callback = function(args)
        vim.treesitter.start(args.buf)
    end
})
