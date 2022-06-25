local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    b = {
      name = "Telescope plugins",
      r = { "<cmd>Telescope file_browser<cr>", "File Browser" },
      c = { "<cmd>Telescope commands<cr>", "Commands" },
      p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Project List" },
      g = { "<cmd>Telescope repo list<cr>", "Git Repository Search" },
    },
    l = {
      name = "Code",
      R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
      a = { "<cmd>Telescope lsp_code_actions<CR>", "Code Action" },
      d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
      f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
      i = { "<cmd>LspInfo<CR>", "Lsp Info" },
      n = { "<cmd>Lspsaga rename<CR>", "Rename" },
      r = { "<cmd>Telescope lsp_references<CR>", "Diagnostics" },
      t = { "<cmd>TroubleToggle<CR>", "Trouble" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
