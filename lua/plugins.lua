---@diagnostic disable: undefined-global
return require('packer').startup(function()
  -- Packer can manage itself
  use({ 'wbthomason/packer.nvim' })

  use({ 'kyazdani42/nvim-web-devicons' })

  use({ "glepnir/galaxyline.nvim" })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      -- { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
    }
  })

  use({'neovim/nvim-lspconfig'})

  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "BurntSushi/ripgrep" }
    },
  })

  use({ "machakann/vim-sandwich" })

  use({ 'glepnir/lspsaga.nvim', branch = "main", config = function()
      require('lspsaga').setup({})
    end,
  })

  use({ "norcalli/nvim-colorizer.lua" })

  use({ "sheerun/vim-polyglot" })

  use({ "tpope/vim-fugitive" })

  use({ "b3nj5m1n/kommentary" })

  use({ "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' })
  -- use({ 'nvim-treesitter/nvim-treesitter-context'})

  use({
    "tyru/open-browser-github.vim",
    requires = {
      "tyru/open-browser.vim"
    }
  })

  use({ 'lukas-reineke/indent-blankline.nvim' })

  use({ "ckipp01/scala-utils.nvim", requires = { "nvim-lua/plenary.nvim" } })

  use({ "L3MON4D3/LuaSnip" })
  use({ "saadparwaiz1/cmp_luasnip" })

  use({ "windwp/nvim-autopairs" })

  use({ 'mfussenegger/nvim-dap' })

  use({ 'tpope/vim-unimpaired' })

  use({ 'nvim-treesitter/nvim-treesitter-textobjects'})

  use({ 'folke/neodev.nvim' })

  use {'nvim-telescope/telescope-ui-select.nvim' }

  use "rebelot/kanagawa.nvim"

  use {
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

end)
