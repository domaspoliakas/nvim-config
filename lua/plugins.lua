---@diagnostic disable: undefined-global
return require('lazy').setup({
  -- Packer can manage itself
  { 'wbthomason/packer.nvim' },

  { 'kyazdani42/nvim-web-devicons' },

  { "glepnir/galaxyline.nvim" },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      -- { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
    }
  },

  {'neovim/nvim-lspconfig'},

  {'scalameta/nvim-metals', dependencies = { "nvim-lua/plenary.nvim" } },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "BurntSushi/ripgrep" }
    },
  },

  { "machakann/vim-sandwich" },

  { 'glepnir/lspsaga.nvim', branch = "main", config = function()
      require('lspsaga').setup({})
    end,
  },

  { "norcalli/nvim-colorizer.lua" },

  { "sheerun/vim-polyglot" },

  { "tpope/vim-fugitive" },

  { "b3nj5m1n/kommentary" },

  { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate' },
  -- { 'nvim-treesitter/nvim-treesitter-context'},

  {
    "tyru/open-browser-github.vim",
    dependencies = {
      "tyru/open-browser.vim"
    }
  },

  { 'lukas-reineke/indent-blankline.nvim' },

  { "ckipp01/scala-utils.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },

  { "windwp/nvim-autopairs" },

  { 'mfussenegger/nvim-dap' },

  { 'tpope/vim-unimpaired' },

  { 'nvim-treesitter/nvim-treesitter-textobjects'},

  { 'folke/neodev.nvim' },

  {'nvim-telescope/telescope-ui-select.nvim' },

  {"rebelot/kanagawa.nvim"},

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

})
