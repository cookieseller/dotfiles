local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  pyright = {},
  rust_analyzer = {},
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
        },
      },
    },
  },
  jdtls = {},
  tsserver = {},
  vimls = {},
  phpactor = {},
}

local lsp_signature = require("lsp_signature")
lsp_signature.setup {
  bind = true,
  handler_opts = {
    border = "rounded",
  },
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("user.plugins.lsp.keymaps").setup(client, bufnr)

  require("user.plugins.lsp.highlighting").setup(client)

  require("user.plugins.lsp.null-ls.formatters").setup(client, bufnr)
end

local opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

require("user.plugins.lsp.handlers").setup()

function M.setup()
  require("user.plugins.lsp.null-ls").setup(opts)

  require("user.plugins.lsp.installer").setup(servers, opts)
end

return M
