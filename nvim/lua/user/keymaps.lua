local keymap = require 'lib.utils'.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Allow gf to open non-existent files
keymap('', 'gf', ':edit <cfile><CR>')

keymap('v', '<', '<gv')
keymap('v', '>', '>gv')