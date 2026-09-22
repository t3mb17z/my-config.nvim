return {
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

    {
        "ellisonleao/gruvbox.nvim",
        priority = 100,
        config = true,
    },
    {
        "EdenEast/nightfox.nvim", lazy = false,
        priority = 1000
    }, -- lazy

    { 'nvim-mini/mini.icons', version = '*' },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate'
    }
}
