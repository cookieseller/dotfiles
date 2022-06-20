local keymap = require 'lib.utils'.keymap
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

-- Keep selection after indenting
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

keymap("n", "<S-Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<S-Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<S-Up>", ":resize -1<CR>", default_opts)
keymap("n", "<S-Down>", ":resize +1<CR>", default_opts)

keymap("n", "g.", "g;", default_opts)

keymap("n", "<c-l>", "gg =G g,", default_opts)
