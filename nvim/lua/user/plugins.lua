local packer = require 'lib.packer-init'

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' } -- Let packer manage itself
  use {
    'dracula/vim',
    as = 'dracula',
    config = function()
      require('user.plugins.dracula')
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.lualine')
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user.plugins.file-tree')
    end
  }
  use {
    'vim-test/vim-test',
    config = function()
      require('user.plugins.vim-test')
    end
  }
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = { "nvim-lsp-installer" },
    config = function()
      require("user.plugins.lsp").setup()
    end,
    requires = {
      "williamboman/nvim-lsp-installer",
    },
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("user.plugins.whichkey").setup()
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = function()
      require('user.plugins.telescope')
    end
  }
  use {
    'voldikss/vim-floaterm',
    config = function()
      require('user.plugins.floaterm')
    end
  }
  use { 'rcarriga/nvim-notify' }
end)

