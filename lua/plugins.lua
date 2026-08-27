return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate"
    },
    { 'nvim-lualine/lualine.nvim', event = "VeryLazy" },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        'stevearc/oil.nvim',
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
    },

    { "L3MON4D3/LuaSnip", lazy = true },
    { "rafamadriz/friendly-snippets", lazy = true },

    { -- Cmp
        'saghen/blink.cmp',
        version = '1.*',
        build = 'cargo build --release',
        event = "InsertEnter"
    },

    { -- My themes
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 0,
        opts = {},
    },

    { "rebelot/kanagawa.nvim", lazy = true },
    {
        "EdenEast/nightfox.nvim", lazy = false,
        priority = 1000
    }, -- lazy

    { 'nvim-mini/mini.icons', version = '*' },
}
