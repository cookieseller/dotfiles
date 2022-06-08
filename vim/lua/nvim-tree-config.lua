require('nvim-tree').setup {
    renderer = {
        highlight_opened_files = 'all'
    },
    filesystem_watchers = {
        enable = false,
        interval = 100,
    },
}

vim.api.nvim_set_keymap('n', '<leader>a', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
