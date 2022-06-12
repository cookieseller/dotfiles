local M = {}

M.keymap = function(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(
    mode,
    lhs,
    rhs,
    vim.tbl_extend('keep', opts or {}, { noremap = true, silent = true })
  )
end

M.del_keymap = function(mode, lhs)
  vim.api.nvim_del_keymap(mode, lhs)
end


return M
