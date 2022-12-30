local packer = require('packer')

local filetype = {'exs', 'ex', 'heex', 'eex', 'sface', 'leex'}

packer.use {
  'elixir-editors/vim-elixir',
  ft = filetype,
  config = function()
    vim.api.nvim_command('syntax on')
    vim.api.nvim_command('set foldlevel=1')
  end
}

local elixirGrp = vim.api.nvim_create_augroup('ElixirGroup', { clear = true })
vim.api.nvim_create_autocmd('BufRead', {
  pattern = filetype,
  callback = function()
    vim.api.nvim_exec([[
      set filetype=elixir
      set foldlevel=1
      PackerLoad vim-elixir
    ]], true)
  end,
  group = elixirGrp,
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = filetype,
  command = 'set foldlevel=1',
  group = elixirGrp,
})


require('lspconfig').elixirls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  cmd = { '/usr/local/share/elixirls/bin/language_server.sh' };
})
