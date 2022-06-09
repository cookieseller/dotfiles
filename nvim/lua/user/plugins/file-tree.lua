vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
--vim.g.nvim_tree_group_empty = 1

require('nvim-tree').setup {
  git = {
    ignore = false,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  highlight_focused_file = true,
  update_focused_file = {
    enable = true,
  },
  view = {
    adaptive_size = false,
    centralize_selection = false,
  }
}

vim.cmd [[highlight NvimTreeIndentMarker guifg=#30323E]]

vim.api.nvim_set_keymap('n', '<leader>a', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
