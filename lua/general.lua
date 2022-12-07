local opt = vim.opt
local keymap = vim.api.nvim_set_keymap
local exec = vim.api.nvim_exec
local opts = { noremap = true, silent = false }

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smarttab = true
opt.smartcase = true
opt.smartindent = true
opt.autoread = true
opt.autoindent = true
opt.cursorcolumn = true
opt.nu = true
opt.incsearch = true
opt.ignorecase = true
opt.encoding = 'UTF-8'
opt.mouse = 'a'
opt.foldcolumn = '1'
opt.foldlevel = 0
opt.foldlevelstart = -1

keymap('n', 'go', 'o<esc>', opts)
keymap('n', 'gO', 'O<esc>', opts)
keymap('n', '<space>u', ':set foldlevel=20<cr>', opts)
keymap('n', '<space>f', ':set foldlevel=0<cr>', opts)
keymap('n', '<leader>g', ':Neotree toggle<cr>:set foldlevel=20<cr>', opts)
keymap('n', '<leader>s', ':Neogit<cr>:set foldlevel=20<cr>', opts)
keymap('n', '<Leader>r', ":lua require('rest-nvim').run()<CR>", { noremap = true, silent = true, desc = 'Running rest client' })

exec([[
  set nowrap
]], true)
