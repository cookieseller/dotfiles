local keymap = require 'lib.utils'.keymap

keymap('n', '<leader>c', ':FloatermToggle scratch<CR>')
keymap('t', '<leader>c', '<C-\\><C-n>:FloatermToggle scratch<CR>')

vim.g.floaterm_gitcommit='floaterm'
vim.g.floaterm_autoinsert=1
vim.g.floaterm_width=0.8
vim.g.floaterm_height=0.8
vim.g.floaterm_wintitle=0

vim.cmd([[
    " DraculaBgLight
    hi Floaterm guibg=#343746
]])
