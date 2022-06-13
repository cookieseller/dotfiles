local M = {}

local servers = {
  phpactor = {},
  jdtls = {},
  html = {},
  jsonls = {},
  pyright = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
}

print("Hello im called")
local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("user.plugins.lsp.keymaps").setup(client, bufnr)
end

local opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  require("user.plugins.lsp.installer").setup(servers, opts)
end

return M
