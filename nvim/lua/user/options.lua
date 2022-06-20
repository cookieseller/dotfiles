vim.opt.clipboard = 'unnamedplus' -- Use Linux system clipboard
vim.opt.scrolloff=8
vim.opt.sidescrolloff=8
vim.opt.termguicolors=true
vim.opt.expandtab=true --tabs are spaces now
vim.opt.shiftwidth=8 --auto ident with 4 spaces
vim.opt.tabstop=8 --one tab is 4 spaces
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.git/*"

vim.g.tokyonight_style = "night"
-- vim.api.nvim_command('colorscheme tokyonight')

vim.cmd[[
  set wildmenu
  set wildmode=longest:full,full
]]


