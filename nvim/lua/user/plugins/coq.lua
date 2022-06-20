local M = {}
_G.MUtils= {}

local remap = vim.api.nvim_set_keymap
-- local is_module_available = require 'lib.utils'.is_module_available
function M.setup()
  local coq = require "coq"
  coq.Now()

  local is_module_available = require 'lib.utils'.is_module_available
  if (is_module_available('nvim-autopairs')) then
    local npairs = require('nvim-autopairs')
    npairs.setup({ map_bs = false, map_cr = false })

    MUtils.CR = function()
      if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
          return npairs.esc('<c-y>')
        else
          return npairs.esc('<c-e>') .. npairs.autopairs_cr()
        end
      else
        return npairs.autopairs_cr()
      end
    end
    remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

    MUtils.BS = function()
      if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
        return npairs.esc('<c-e>') .. npairs.autopairs_bs()
      else
        return npairs.autopairs_bs()
      end
    end
    remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
  end
  -- 3party sources
  require "coq_3p" {
    { src = "nvimlua", short_name = "nLUA", conf_only = false }, -- Lua
    { src = "bc", short_name = "MATH", precision = 6 }, -- Calculator
    {
      src = "repl",
      sh = "zsh",
      shell = { p = "perl", n = "node" },
      max_lines = 99,
      deadline = 500,
      unsafe = { "rm", "poweroff", "mv" },
    },
  }
end

return M
