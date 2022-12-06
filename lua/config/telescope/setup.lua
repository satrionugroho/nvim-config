local map = vim.api.nvim_set_keymap
local silent = { noremap = true, silent = true }

map('n', '<leader>tb', [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map('n', '<leader>tc', [[<cmd>Telescope commands theme=get_dropdown<cr>]], silent)
map('n', '<leader>tg', [[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>tf', [[<cmd>Telescope find_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>tl', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
map('n', '<leader>ts', [[<cmd>Telescope grep_string theme=get_dropdown<cr>]], silent)
map('n', '<leader>tt', [[<cmd>Telescope file_browser theme=get_dropdown<cr>]], silent)
