local map = vim.keymap.set
local silent = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

map('n', '<leader>tb', builtin.buffers, silent)
map('n', '<leader>tc', builtin.commands, silent)
map('n', '<leader>tg', builtin.git_files, silent)
map('n', '<leader>tf', builtin.find_files, silent)
map('n', '<leader>tl', builtin.live_grep, silent)
map('n', '<leader>ts', builtin.grep_string, silent)
map('n', '<leader>tt', require('telescope').extensions.file_browser.file_browser, silent)
