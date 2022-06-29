local packer = require "packer"

-- Recompile on file change
vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
packer.init({
  profile = {
    enable = true,
    threshold = 0
  },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
})
packer.startup(function(use)
  use { "wbthomason/packer.nvim" } -- Let packer manage itself
  use {
    "dracula/vim",
    as = "dracula",
    config = function()
      require("user.plugins.dracula")
    end
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "arkav/lualine-lsp-progress"
    },
    config = function()
      require("user.plugins.lualine")
    end
  }
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    opt = true,
    event = "BufRead",
    run = ":TSUpdate",
    config = function()
      require("user.plugins.treesitter").setup()
    end,
    requires = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
    },
  }
  -- Auto pairs
  use {
    "windwp/nvim-autopairs",
    wants = "nvim-treesitter",
    module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
    config = function()
      require("user.plugins.autopairs").setup()
    end
  }
  use {
    "windwp/nvim-ts-autotag",
    wants = "nvim-treesitter",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup { enable = true }
    end,
  }
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    event = "VimEnter",
    config = function()
      require("user.plugins.file-tree")
    end
  }
  -- to change the root directory in nvim-tree
  use {
    "notjedi/nvim-rooter.lua",
    config = function() require "nvim-rooter".setup() end
  }
  use {
    "vim-test/vim-test",
    event = "VimEnter",
    config = function()
      require("user.plugins.vim-test")
    end
  }
  use {
    "neovim/nvim-lspconfig",
    -- opt = true,
    event = "BufReadPre",
    wants = { "nvim-lsp-installer", "lsp_signature.nvim", "coq_nvim", "lua-dev.nvim", "vim-illuminate", "null-ls.nvim" },
    config = function()
      require("user.plugins.lsp").setup()
    end,
    requires = {
      "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim",
      "RRethy/vim-illuminate",
      "folke/lua-dev.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  }
  use { "mfussenegger/nvim-jdtls", ft = { "java" } }
  use {
    "folke/trouble.nvim",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("trouble").setup {
        use_diagnostic_signs = true,
      }
    end,
  }
  use {
    "tami5/lspsaga.nvim",
    event = "VimEnter",
    cmd = { "Lspsaga" },
    config = function()
      require("lspsaga").setup {}
    end,
  }
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "InsertEnter",
    opt = true,
    run = ":COQdeps",
    config = function()
      require("user.plugins.coq").setup()
    end,
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
    },
    disable = false,
  }
  use {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
      require("user.plugins.whichkey").setup()
    end
  }
  use {
    "nvim-telescope/telescope.nvim",
    wants = {
      "plenary.nvim",
      "telescope-fzf-native.nvim",
      "telescope-project.nvim",
      "telescope-repo.nvim",
      "telescope-file-browser.nvim",
      "project.nvim",
    },
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-web-devicons" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      { "nvim-telescope/telescope-project.nvim" },
      { "cljoly/telescope-repo.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      {
        "ahmedkhalf/project.nvim",
        config = function()
          require("project_nvim").setup {}
        end,
      },
    },
    event = "VimEnter",
    config = function()
      require("user.plugins.telescope")
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    wants = "plenary.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("user.plugins.gitsigns").setup()
    end,
  }
  use {
    "voldikss/vim-floaterm",
    config = function()
      require("user.plugins.floaterm")
    end
  }
  use { "rcarriga/nvim-notify" }
  use { "tpope/vim-surround" }
  use { "folke/tokyonight.nvim" }
  use {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    wants = "nvim-web-devicons",
    config = function()
      require("user.plugins.bufferline").setup()
    end
  }
end)
