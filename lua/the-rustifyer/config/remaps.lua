-- This file holds my personal keymaps and remaps, along as the configuration for the leader key
--
-- Not all remaps may be configured here, as they could be directly configured in the plugins

local noremap_silent = { noremap = true, silent = true };

-- Opens `Newtr` file explorer 
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, noremap_silent)

