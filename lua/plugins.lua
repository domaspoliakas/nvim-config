return require('packer').startup(function()
  -- Packer can manage itself
  use({ 'wbthomason/packer.nvim' })

  use({ 'kyazdani42/nvim-web-devicons' })

  use({ "glepnir/galaxyline.nvim" })

  use({ "joshdick/onedark.vim" })

  use({ 
    "hrsh7th/nvim-cmp", 
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      -- { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
    }
  })

  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "BurntSushi/ripgrep" }
    },
  })

  use({ "machakann/vim-sandwich" })

  use({ 'tami5/lspsaga.nvim' })

  use({ "norcalli/nvim-colorizer.lua" })

  use({ "sheerun/vim-polyglot" })

  use({ "tpope/vim-fugitive" })

  use({ "b3nj5m1n/kommentary" })

  use({ "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' })
  use({ 'nvim-treesitter/nvim-treesitter-context'})
  use({ 'nvim-treesitter/playground'})

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

end)
