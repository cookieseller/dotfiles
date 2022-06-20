local lsp = require('lsp-zero')

lsp.nvim_workspace()
lsp.preset('recommended')
lsp.set_preferences({
  sign_icons = {
    error = '',
    warn = '',
    hint = '',
    info = ''
  }
})
lsp.setup()
