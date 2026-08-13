return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate"
    },
    { 'nvim-lualine/lualine.nvim' },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "onsails/lspkind.nvim" },

    { -- Cmp
        'saghen/blink.cmp',
        version = '1.*',
        build = 'cargo build --release',
    },

    { -- My themes
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    { "rebelot/kanagawa.nvim" },
    { "EdenEast/nightfox.nvim" }, -- lazy

    { 'nvim-mini/mini.icons', version = '*' },
    --- File tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons", -- optional, but recommended
        },
        lazy = false, -- neo-tree will lazily load itself
    },
}
