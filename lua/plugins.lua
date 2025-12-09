return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    'nvim-lualine/lualine.nvim',
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { -- My themes
    "rebelot/kanagawa.nvim",
  },
  { 'nvim-mini/mini.icons', version = '*' },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  }
}
