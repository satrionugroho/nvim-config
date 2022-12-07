local packer = require('packer')

local filetype = {'exs', 'ex', 'heex', 'eex', 'sface', 'leex'}

packer.use {
  'elixir-editors/vim-elixir',
  ft = filetype,
  config = function()
    vim.api.nvim_command('syntax on')
  end
}

local elixirGrp = vim.api.nvim_create_augroup('ElixirGroup', { clear = true })
vim.api.nvim_create_autocmd('BufRead', {
  pattern = filetype,
  callback = function()
    vim.api.nvim_exec([[
      set filetype=elixir
      PackerLoad vim-elixir
    ]], true)
  end,
  group = elixirGrp,
})


require('lspconfig').elixirls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  cmd = { '/usr/local/elixirls/bin/language_server.sh' };
})
