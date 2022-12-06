require('gitsigns').setup({
  current_line_blame = true,
})

vim.api.nvim_set_keymap('n', '<space>g', [[<cmd>Gitsigns preview_hunk<cr>]], { noremap = true, silent = true })
