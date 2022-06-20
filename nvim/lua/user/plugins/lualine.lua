-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

require('lualine').setup {
  options = {
      theme = 'tokyonight',
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch' },
    lualine_c = {
      {
    	'lsp_progress',
    	-- With spinner
    	-- display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' }},
    	colors = {
    	  percentage  = colors.cyan,
    	  title  = colors.cyan,
    	  message  = colors.cyan,
    	  spinner = colors.cyan,
    	  lsp_client_name = colors.magenta,
    	  use = true,
    	},
    	separators = {
    		component = ' ',
    		progress = ' | ',
    		percentage = { pre = '', post = '%% ' },
    		title = { pre = '', post = ': ' },
    		lsp_client_name = { pre = '[', post = ']' },
    		spinner = { pre = '', post = '' },
    		message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed' },
    	},
    	display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
    	timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
    	spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
    }
    },
    lualine_x = { 'filename', 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
