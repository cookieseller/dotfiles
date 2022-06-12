require('nvim-tree').setup {
  git = {
    ignore = false,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = false,
  },
  renderer = {
    highlight_opened_files = "all",
    icons = {
      webdev_colors = true,
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  view = {
    adaptive_size = false,
    centralize_selection = false,
  }
}

vim.cmd [[highlight NvimTreeIndentMarker guifg=#30323E]]

vim.api.nvim_set_keymap('n', '<leader>a', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
